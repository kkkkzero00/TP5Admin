<?php
namespace app\common\model;

use think\Model;
use think\Config;
use think\Db;
use app\common\model\HyAuth;
use think\Session;
use think\Cookie;

class HyAccount extends Model
{
    public $name = 'frame_manager';

    public function roles()
    {
        return $this->belongsToMany('HyRole', 'frame_access', 'role_id', 'user_id');
    }

    public function checkUserExist($account, $password, $verifyCode = '', $isRemember = false, $type = false){

        if (!$account) {
            $this->error = '帐号不能为空';
            return false;
        }
        if (!$password){
            $this->error = '密码不能为空';
            return false;
        }


        if (config('common.IDENTIFYING_CODE') && !$type) {
            if (!$verifyCode) {
                $this->error = '验证码不能为空';
                return false;
            }
            // $captcha = new HonrayVerify(config('captcha'));
            // if (!$captcha->check($verifyCode)) {
            //     $this->error = '验证码错误';
            //     return false;
            // }
        }

        $privateKey = Config::get("crypto.CRYPT_KEY_PWD");

        $publicKey = Config::get("crypto.PWD_HASH_ADDON");

        $iv = Config::get("crypto.CRYPT_KEY_IV");
        //先将公钥转成16进制，然后由于php只支持16、24.32位的长度，所以要进行切割
       

        $decrypt_account = aes_communication_decrypt($account,$publicKey,$iv);

        // debug('begin');
        $userInfo = $this->where(['id'=>$decrypt_account])->find();
        // debug('end');
        // print_r(debug('begin','end',6).'s');

        if (!$userInfo) {
            $this->error = '帐号不存在';
            return false;
        }


        //从后台取出来的密码进行解密
        $pwdsha1 = aes_decrypt($userInfo['password'],$privateKey);
        var_dump($pwdsha1);
        var_dump($password);

        if($pwdsha1!=$password){
            $this->error = '密码错误';
            return false;
        }

        if ($userInfo['status'] === 0) {
            $this->error = '帐号已被禁用';
            return false;
        }


        // 获取菜单和权限,权限验证时以distance为判断基准
        // debug('begin');
        // $dataList = $this->getMenuAndRule($userInfo['id']);
        // var_dump($userInfo);
        
        $now  = time();
        /*一天后过期*/
        $expireTime = ($now + 24*60*60);
        Cookie::init(['prefix'=>null,'expire'=>$expireTime,'path'=>'/']);

        Cookie::set(
            'u_Tok',
            json_encode(["id"=>$userInfo['id'],"deadline"=>$expireTime])
        );

        // var_dump(Cookie::get());

        return true;
    }

	public function getUserInfo($id){

        $userInfo = $this
                    ->where(['id'=>$id,'status'=>['neq',0]])
                    ->field('id,name,role_id,gender,login_last_time,password')
                    ->find();
       
        $userInfo = $userInfo->toArray();

        $roles = explode(",",$userInfo['role_id']);
        sort($roles);


        $userInfo['role_id'] = $roles;

        $dataList = $this->getMenuAndRule($roles);
       //  // debug('end');
       //  // print_r(debug('begin','end',6).'s');

        if (!$dataList['menusList']) {
            $this->error = '没有权限';
            return false;
        }

       /* if ($isRemember || $type) {
            $secret['username'] = $username;
            $secret['password'] = $password;
            $data['rememberKey'] = encrypt($secret);
        }*/

        // 保存缓存        
        
        // session_start();
        
        $info['userInfo'] = $userInfo;
        $info['sessionId'] = session_id();

        //这个authKey就是判定某个用户在线登录状态的唯一标识，在权限认证里面通过这个authKey，在缓存中取出这个用户的具体信息
        $authKey = act_encrypt($userInfo['id'].$userInfo['password'].$info['sessionId']);
        
        unset($userInfo['password']);

        $info['authList'] = $dataList['rulesList'];
        $info['authKey'] = $authKey;
        
        // dump($info);
        // 存入缓存
        cache('Auth_'.$authKey, null);
        cache('menusList',null);

        cache('Auth_'.$authKey, $info, config('common.LOGIN_SESSION_VALID'));

        $routes = [];
        foreach ($dataList['menusList'] as $k => $v) {
            $routes[$v['id']] = $v['route'];
        }

        cache('MenuRoutes_'.$authKey,$routes);

        // dump(config('common.LOGIN_SESSION_VALID'));
        // 返回信息
        
        $data = [];
        $data['authKey']        = $authKey;
        $data['sessionId']      = $info['sessionId'];
        $data['userInfo']       = $userInfo;
        $data['auth']       = $dataList['rulesList'];
        $data['menus']      = $dataList['menusList'];

        Session::set('authKey',$authKey);
        // Session::set('userId',$userInfo['id']);
        // Session::set("sessionId",$info['sessionId']);
        
        return $data;
    }

    public function getMenuAndRule($role_id){
        
        $menusList = $rulesList = [];

        if ($role_id[0] === '1') {

            $menusList = Db::name('frame_rule')
                            ->where([
                                'status'=>1,
                                'type'=>['in',['nav','menu','detail']]
                                ])
                            ->field('id,pid,name,type,icon,model,route,path')
                            ->order('id asc')
                            ->select();

            $rulesList = 'all';
        } else {
        
            $rule_ids = Db::name('frame_access')
                        ->where(['role_id'=>['in',$role_id]])
                        ->column('rule_id');
            $rule_ids = array_unique($rule_ids);


            $rules = Db::name('frame_rule')
                            ->where([
                                'status'=>1,
                                'id' => ['in',$rule_ids]
                            ])
                            ->field('id,pid,name,type,icon,model,route,path,distance')
                            ->order('id asc')
                            ->select();

            foreach ($rules as $k => $v) {
                if($v['type'] == 'url'){
                    $rulesList[$v['id']] = $v['distance'];
                }

                if(in_array($v['type'],['nav','menu'])){
                    unset($v['distance']);
                    array_push($menusList,$v);
                }     
            }  
        }

        $ret = [
            'menusList' => $menusList,
            'rulesList' => $rulesList
        ];

        return $ret;
    }


    
    /*public function switchAuth(){
        $u_id = Session::get('userId');
        if($u_id == 1){

        }else{
            $post = Request::instance()->post();
            $rule = $post['rule'];
            

            $rules = Db::name('frame_access')->where(['user_id'=>$u_id])->column('role_id');
            
            if(!in_array($rule,$rules)){
                return false;
            }

            $dataList = $this->getMenuAndRule();

        }
        
    }*/

}
