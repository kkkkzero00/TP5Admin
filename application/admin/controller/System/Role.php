<?php
namespace app\admin\controller\System;

use app\common\controller\ListManage;
use think\Db;
use think\Request;
use think\Config;
use think\Session;

class Role extends ListManage{

    public function getAccess(){

        $data = Db::table(DTP.'frame_rule')
        ->where(['status'=>1,'type'=>['neq','admin']])
        ->field('id,pid,name')
        ->select();

        $json = [];

        if($data){
            $json = [
                'data'=>$data,
                'total'=>count($data),
                'success'=>true,
                'status'=>true, 
                'code'=>200,
                'info'=>'数据获取成功！'
            ];
        }else{
            $json = [
                'data'=>null,
                'total'=>0,
                'success'=>false,
                'status'=>false, 
                'code'=>500,
                'info'=>'数据获取失败！'
            ];

        }
        
        return json($json);
    }

    public function setAccess($id){
        $data = Request::instance()->post();

        $resJsonKeys = Config::get('common.resJsonKeys');

        $infoKey = $resJsonKeys['info'];
        $successKey = $resJsonKeys['success'];
        $codeKey = $resJsonKeys['code'];
        $statusKey = $resJsonKeys['status'];


        unset($data['_method']);
        $json = [];

        if($data['token'] != Session::get('form_token')){
             
            $json[$infoKey] = '请勿非法操作，拉黑后果自负！';
            $json[$statusKey] = $json[$successKey] = false;
            $json[$codeKey] = 500;

            return json($json);
        }
        unset($data['token']);

        $insert = [];
        $role_id = is_null($id) ?$data['role_id'] : $id ;

        Db::startTrans();

        try{
            $table = DTP.'frame_access';

            $del = Db::table($table)
                ->where('role_id',$id)
                ->delete();

            $res = null;
            
            if(isset($data['access']) && (count($data['access']) != 0)){
                foreach ($data['access'] as $k => $v) {
                    array_push($insert,['role_id'=>$role_id,'rule_id'=>$v]);
                }

                $res = Db::table($table)->insertAll($insert);
            }else{
                $res = true;
            }

            
            if(!$res) throw new Exception("数据库新增授权失败！");


            Db::commit(); 

            return [
                $infoKey => '授权成功！',
                $statusKey => true,
                $successKey=>true,
                $codeKey => 200
            ];
            
        } catch (\Exception $e) {
            // 回滚事务
            Db::rollback();

            return [
                $infoKey => $e->getMessage(),
                $statusKey => false,
                $successKey => false,
                $codeKey => 500
            ];
        }   
        


    }
}
