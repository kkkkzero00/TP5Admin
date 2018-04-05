<?php
namespace app\common\controller;
use app\common\controller\Base;
use think\View;
use think\Loader;
use think\Request;

class ListManage extends Base
{   

    public function _initialize(){

        parent::_initialize();
   
        if($this->model === null){
            $model = $this->request->module().'/'.CONTROLLER_NAME;
            $this->model = Loader::model($model);
        }
    }

    protected $resJson = [
        'data'=>'',
        'message'=>'',
        'status'=>false,
        'code'  => 200,
        'total' => 0
    ];

    /**
     * 显示资源列表 获取所有数据
     *
     * @return \think\Response
     */
    public function lists(){

        $json = $this->resJson;
        $this->model->ajax('list',$json);

        return json($json);
    }

    /**
     * 保存新建的资源  新增数据
     *
     * @param  \think\Request  $request
     * @return \think\Response
     */
    public function insert()
    {
        $request = Request::instance()->post();
        $json = $this->resJson;
        // var_dump($request);
        $this->model->ajax("insert",$json,$request);

        return json($json);
    }

    /**
     * 显示指定的资源 获取某个数据的值
     *
     * @param  int  $id
     * @return \think\Response
     */
    public function read($id)
    {
        
        $get = Request::instance()->get();
        
        $json = $this->resJson;
        // var_dump($id);
        
        $this->model->ajax("list",$json,null,$id);
        // dump(34);
        return json($json);
    }

    /**
     * 保存更新的资源 更新某个数据的值
     *
     * @param  \think\Request  $request
     * @param  int  $id
     * @return \think\Response
     */
    public function update($id)
    {
        $request = Request::instance()->put();
        // var_dump($request);
        
        $json = $this->resJson;
        $this->model->ajax("update",$json,$request);
        // var_dump($json);
        return json($json);
    }

    /**
     * 删除指定资源 删除某个数据
     *
     * @param  int  $id
     * @return \think\Response
     */
    public function delete()
    {
        $request = Request::instance()->param();
        // var_dump($request);
        $json = $this->resJson;
        $this->model->ajax("delete",$json,$request);

        return json($json);
    }


}