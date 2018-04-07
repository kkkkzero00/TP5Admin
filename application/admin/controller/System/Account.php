<?php
namespace app\admin\controller\System;
use app\common\controller\Base;
use app\common\model\HyAccount;
use think\View;
use think\Request;
use think\Cookie;
use think\Session;
use think\Config;
// header("Access-Control-Allow-Origin: http://localhost:8000");
// header("Access-Control-Allow-Methods: POST, GET, OPTIONS, PUT, DELETE");
// header('Access-Control-Allow-Credentials: true');


class Account extends Base
{		
    // public $request = [];
    protected $resJson = [
            'data'=>'',
            'message'=>'',
            'status'=>false,
            'code'  => 200,
    ];

    public function _initialize()
    {
        parent::_initialize();
    }

    public function checkUserExist($value=''){

      $data = Request::instance()->post();
      unset($data['_method']);
      
      $json = $this->resJson;
      $userModel = new HyAccount();

      $verifyCode = !empty($param['verifyCode'])? $param['verifyCode']: '';
      $isRemember = !empty($param['isRemember'])? $param['isRemember']: '';

      // var_dump($data);

      $info = $userModel->checkUserExist($data['account'], $data['password'], $verifyCode, $isRemember);


      if (!$info) {
          $json['message'] = $userModel->getError();
          $json['code'] = 400;
          $json['status'] = false;
          $json['success'] = false;

          return json($json);
      }


      $json['message'] = '正进行登录授权。。。';
      $json['code'] = 200;
      $json['status']  = true;
      $json['success']  = true;

      return json($json);
    }

    public function userPermission(){
        
      // $data = Request::instance()->get();
      
      $cookies = Cookie::get();
      $token = (!empty($cookies['u_Tok']))?json_decode($cookies['u_Tok']):'';

      // var_dump($data);
      $userModel = new HyAccount();
      
      // var_dump($token);

      if($token){
          $res = $userModel->getUserInfo($token->id);

          if (!$res) {
              $json['message'] = $userModel->getError();
              $json['code'] = 500;
              $json['status'] = false;
              $json['success'] = false;

              return json($json);
          }
          
          $json['message'] = '登陆成功，请耐心等待数据返回！';
          $json['code'] = 200;
          $json['status']  = true;
          $json['success'] = true;
          $json['data'] = $res;

          return json($json);
      }else{
        $json['message'] = "该用户还未登录，请重新登录！";
        $json['code'] = 500;
        $json['status'] = false;
        $json['success'] = false;

        return json($json);
      }
    }

    public function logout(){
        $authKey = Session::get('authKey');

        if($authKey){

            Cookie::delete('u_Tok');
            cache('Auth_'.$authKey, null);
            cache('MenuRoutes_'.$authKey,null);

            Session::delete('authKey');

            $json['message'] = '登出成功！';
            $json['code'] = 200;
            $json['status']  = true;

        }else{
            $json['message'] = '登出失败，没有登出权限！';
            $json['code'] = 500;
            $json['status']  = false;
        }

        return json($json);   
    }

    public function checkAuthRoute(){
        $data = Request::instance()->get();
        // var_dump($data);
        

        $path = $data['path'];
        $authKey = Session::get('authKey');
        $menuRoutes = cache('MenuRoutes_'.$authKey);
        // var_dump($menuRoutes);

        if($menuRoutes == false) {
            $json['message'] = '用户权限已过期，请重新登录！';
            $json['code'] = 500;
            $json['status']  = false;

            return json($json);
        }

        if(!in_array($path, $menuRoutes)){
            $json['message'] = '地址非法！';
            $json['code'] = 500;
            $json['status']  = false;

            return json($json);
        }

        $json['message'] = '地址合法！';
        $json['code'] = 200;
        $json['status']  = true;

        return json($json);
    }

    /**
     * [getkeys 获取密钥]
     * @return [type] [description]
     */
    public function getPublickey(){
      $publicKey = Config::get("crypto.PWD_HASH_ADDON");
      $iv = Config::get("crypto.CRYPT_KEY_IV");

      return json([
        'code'=>200,
        'status'=>true,
        'token'=>$publicKey.$iv
      ]);
      
    }

}
