<?php
namespace app\common\model;
use app\common\model\HyBase;
use think\Model;
use think\Request;
use think\Db;
use think\Loader;
use app\common\model\HyFile;
use think\Validate;
use think\Session;
use think\Config;

class HyList extends HyBase
{   
    // 默认主键
    protected $pk;

    protected $fieldsAliasMap = [];

    protected $sqlType = [];
    // sql条件
    protected $sqlOptions = [
        'alias'     => '',
        'associate' =>  [],
        'where'     =>  [],
        'field'     =>  [],
        'whereOr'   =>  [],
        'whereNull' =>  [],
        'whereNotNull'  =>  [],
        'whereIn'   =>  [],
        'whereNotIn'    =>  [],
        'whereBetween'  =>  [],
        'whereNotBetween'   =>  [],
        'whereLike' =>  [],
        'whereNotLike'  =>  [],
        'whereExists'   =>  [],
        'whereNotExists'    =>  [],
        'whereExp'  =>  [],
    ];

    //验证器配置项
    protected $validateOptions = [];
    //标题和副标题
    protected $infoOptions = [
        'title' => '',
        'subtitle'  =>  '',
        'pagetitle' => ''
    ];

    protected $resJsonKeys = [];


    // 页面配置
    protected $pageOptions = [];

    //  字段配置
    protected $fieldsOptions = [];

    protected $fieldOptionsMap = [];

    //设置一对一关联
    protected $relativeTable = [];

    public function initialize(){
        parent::initialize();

        $this->pk = $this->initPk();
        $this->resJsonKeys = Config::get('common.resJsonKeys');
        // var_dump($this);
        $this->pageOptions = [
            // 表格类型
            'type'      =>  'ajax',
            // 响应式表格
            'dtResponsive'=>true,
            // 删除 | 禁用：forbid <=> forbid|status|9
            'deleteType'=>  'delete',
            // 分页限制
            'limit'     =>  10,
            // 开启字段排序
            'sort'      =>  true,
            // 默认排序字段
            'order'     =>  $this->getPk().' desc',
            // 打印
            'print'     =>  true,
            // 导出 - xls(csv)、pdf
            'export'    =>  'xls',
            // 序号
            'number'    =>  false,
            // 显示全部
            'all'       =>  false,
            // 复选框
            'checkbox'  =>  true,
            // 操作成功刷新页面
            'okRefresh' =>  false,
            // 操作组
            'actions'   =>  [
                    'edit'  =>  [
                            'title'     =>  '编辑',
                            'max'       =>  1
                    ],
                    'delete'=>  [
                            'title'     =>  '删除',
                            // 是否需要确认
                            'confirm'   =>  true
                    ]
            ],
            // 按钮组
            'buttons'   =>  [
                    'add'   =>  [
                            'title' =>  '新增',
                            'icon'  =>  'fa-plus'
                    ]
            ],
            'formSize'      =>  'default',
            // 多表数据写入
            'tablesWrite'   =>  false,
            // 主键检查
            'checkPk'       =>  [
                    'edit'      =>  false,
                    'delete'    =>  false,
                    'detail'    =>  false
            ],
            // 详情模板
            // 'detailTpl'      =>  'Common@HyFrame/detail',
            // 编辑数据时重新发送pageOptions
            'editFields'    =>  false
        ];
    }
    /**
     * [_after_initialize 初始化后置方法]
     * @return [type] [description]
     */
    protected function _after_initialize(){
        $this->setInfoOptions($this->initInfoOptions());
        $this->setSqlType($this->initSqlType());
        $this->setSqlOptions($this->initSqlOptions());
        $this->setPageOptions($this->initPageOptions());
        $this->setFieldsOptions($this->initFieldsOptions());
        $this->setValidateOptions($this->initValidateOptions());
        $this->setFieldsAliasMap();

        // if($this->pageOptions['tablesWrite']===true)
        //  $this->setRelativeTable();
    }

    /**
     * [setSqlType 设置sql查询类型]
     * getDtData为默认类型
     * custom为自定义类型
     * @param [type] $type [description]
     */
    public function setSqlType($type){
        $this->sqlType = $type;
    }
    /**
     * [setInfoOptions 初始化infoOptions]
     * @param [type] $option [description]
     */
    public function setInfoOptions($option){
        if(is_array($option)){
            $this->infoOptions = array_merge($this->infoOptions,$option);
        }
        
    }
    /**
     * [setInfoOptions 初始化pageOptions]
     * @param [type] $option [description]
     */
    public function setPageOptions($option){
        if(is_array($option)){  
            $this->pageOptions = array_merge($this->pageOptions,$option);
        }
    }

    public function setValidateOptions($option){
        if(is_array($option)){  
            $this->validateOptions = array_merge($this->validateOptions,$option);
        }
    }

    /**
     * [setInfoOptions 初始化fieldsOptions]
     * @param [type] $option [description]
     */
    public function setFieldsOptions($option){
        if(is_array($option)){
            $this->fieldsOptions = array_merge($this->fieldsOptions,$option);
        }

        foreach ($this->fieldsOptions as $k => $v) {
            $this->fieldOptionsMap[$v['name']] = $v;
        }
        
    }

    /**
     * [setInfoOptions 初始化sqlOptions]
     * @param [type] $option [description]
     */
    public function setSqlOptions($option){
        if(is_array($option)){
            $this->sqlOptions = array_merge($this->sqlOptions,$option);
        }
    }

    // public function setRelativeTable(){

    //  foreach ($this->sqlOptions['associate'] as $k => $v) {
    //      $this->relativeTable[$v['table']] = $this->hasOne($v['table']);
    //  }
        
    // }

    /**
     * [getTitle 获取标题信息]
     * @return [type] [description]
     */
    public function getTitle(){
        return $this->infoOptions;
    }

    /**
     * [getBreadcrumb 获取面包屑]
     * @return [type] [description]
     */
    public function getBreadcrumb(){
        return '';
    }

    /**
     * [ajax 模型的ajax入口]
     * @param  [type] $type  [description]
     * @param  [type] &$json [description]
     * @return [type]        [description]
     */
    public function ajax($type,&$json,$req = null,$id = null){
        if(is_null($req)&&!is_null($id)){
            $args = [&$json,$id];
        }
        elseif(is_object($req)){
            $args = [&$json,$req,$id];
        }
        else{
            $args = [&$json,$req,$id];
        }
        call_user_func_array([&$this,'ajax_'.$type],$args);
    }
    /**
     * [ajax_list 列表获取数据入口]
     * @param  [type] &$json [description]
     * @return [type]        [description]
     */
    public function ajax_list(&$json,$id=null){
        $type = strtolower($this->sqlType);
        switch ($type) {
            case 'custom':
                $json = $this->getCustom($id);
                break;
            case 'getdtdata':
            default:
                $json = $this->getDtData($id);
                break;
        }
        
    }

    /**
     * [callbackHandler 回调控制 默认第一个参数为回调函数名，第二个参数为变量初始值，剩下的都是其他参数]
     * @param  [type] $callback [回调函数的名字]
     * @param  [type] $value    [回调函数的参数]
     * @param  [type] $data     [前台提交的数组]
     * @return [type]           [description]
     */
    protected function callbackHandler(){
        $args = func_get_args();
        
        $cb = array_shift($args);
        $value = array_shift($args);
        $data = array_shift($args);
      
        if(is_array($cb)){

            $res = $value;

            foreach ($cb as $k => $v) {

                if(is_string($v)){


                    if($cb_item = method_exists($this,'callback_'.$v)?[$this, 'callback_'.$v] : false){
                        $res = call_user_func_array($cb_item,[$value,$data,$args]);
                    }

                    // var_dump($res);

                }else if(is_array($v)){
                    $cb_item = array_shift($v);

                    if($cb_item = method_exists($this,'callback_'.$cb_item)?[&$this, 'callback_'.$cb_item] : false){
                        $res = call_user_func_array($cb_item,[$res,$data]);
                    }

                }
            }

            // var_dump($res);
            return $res;

        }

        return $value;
        
    }


    /**
     * [searchMap 搜索处理数组]
     * @param  [type] $search [搜索的字段]
     * @return [NULL]         
     */
    protected function searchMap($search){

        $searchArr = [];

        foreach($search as $k => $v){

            $isConfig = true;
            $fieldOption = null;

            // var_dump($k);
            foreach ($this->fieldsOptions as $k1 => $v1) {
                
                // var_dump($v1['name']);

                if($k == $v1['name']){
                    if(
                        !isset($v1['search']) && 
                        !isset($v1['search']['open']) && 
                        !$v1['search']['open']
                    ){
                        $isConfig = false;
                    }else{
                        $fieldOption = $v1;
                    }

                    break;

                }
            }


            if(!$isConfig) continue;
            
            if($v == null || (is_array($v) && count($v) == 0) || (is_string($v) && $v == "")) continue;
            
            $searchOptions = isset($fieldOption['search']['backend'])?$fieldOption['search']['backend']:null;

            $type = $searchOptions?(isset($searchOptions['type'])?$searchOptions['type']:'like'):'equal';
            // var_dump($type);
            

            $table = isset($fieldOption['table'])?DTP.$fieldOption['table']:null;
            
            $k = isset($this->fieldsAliasMap[$k])?$this->fieldsAliasMap[$k]:$k;

            $temp = $table?($table.'.'.$k):$k;

            /*如果使用了callbackHander就默认使用字符串查询*/
            if($callback = isset($searchOptions['callback'])?$searchOptions['callback']:false){
                

                foreach ($callback as $k2 => $v2) {
                    $cb = $callback[$k2];
                    $string = $this->callbackHandler($cb,$v);
                }

                $searchArr[$temp] = $string;
                
                continue;
            }

            switch($type){  
                case 'daterange':
        
                    $v = explode(",",$v);

                    $v[0] = strtotime($v[0]);
                    $v[1] = strtotime($v[1]);

                    $searchArr[$temp] = ['between',[$v[0],$v[1]]];
                    /*   
                        1486474923  2017-2-7
    
                        1486396800

                        1486561323  2017-2-8
                     */
                    break;
                case 'like':
                    $searchArr[$temp] = ['like','%'.$v.'%']; break;
                case 'select':
                case 'equal':
                default:
                    $searchArr[$temp] = ['eq',$v]; break;

            }
        }
        // dump($stringSearch);
        return $searchArr;   
    }



    /**
     * [getDtData 根据配置的model的条件返回对应的数据]
     * @return [type] [description]
     */
    
    protected function getDtData($id = null){

        /*$result = Db::table('hy_user')
                ->where(
                    array(
                        'id'=>array(['lt',3],['eq',10],'OR'),
                        'qq'=>array(['eq',123],['neq',3434],'OR'),
                        'name|ssr'=>array(['like','thinkphp'],['like','wewe'],'or'),
                        'update_time'=>array(['in',[1,2,3,4,5]],['like',32],'AND')
                    )
                )
                ->whereOr(
                    array(
                        'phone'=>array(['lt',0],['eq',10],'AND'),
                        'create_time'=>array('eq',2)                
                    )
                )
                ->fetchSql(true)
                ->select();
        var_dump($result);*/
        //'SELECT * FROM `hy_user` WHERE  ( `id` < 3 OR `id` = 10 )  AND ( `qq` = 123 OR `qq` <> 3434 )  AND ( `name` LIKE 'thinkphp' or `name` LIKE 'wewe' )  AND ( `update_time` IN (1,2,3,4,5) AND `update_time` LIKE 32 ) OR ( `phone` < '0' AND `phone` = '10' )  OR `create_time` = 2' 
        /*$result = $this
                    ->where(function($query){
                        return $query->where('a','卡通')->where('b','欧美');
                    })
                    ->whereOr(function($query){
                        return $query->where('c','功夫')->whereOr('d','亚洲');
                    })
                    ->whereNull('id','AND')
                    ->whereBetween('cd',[1,2],'OR')
                    ->whereIn('aa',[1,2,3,4,6,5],'OR')
                    ->whereLike('name','tt','AND')
                    ->whereExp('password','> 3 AND \'password\' <= 4')
                    ->fetchSql(true)
                    ->count('id');
        dump($result);*/
     
        $get = Request::instance()->get();

        // var_dump($_GET);
        $pageKeys = Config::get('common.pageKeys');
        
        //获取alias
        if($alias = $this->sqlOptions['alias']?:'') $this->alias($alias);

        // 先判断是否存在连表
        if($associate = $this->sqlOptions['associate']?:null&&is_array($associate)){
            $join = array();

            foreach ($associate as $k => $v) {
                // preg_match('/([\w\.\-\(\)]+)\s*(AS|as)*\s*([\w\-]*)/i', $v['table'],$m);

                array_push($join,array(DTP.$v['table'].' '.$v['alias'],trim($alias).'.'.trim($v['key']).' = '.trim(isset($v['alias'])?$v['alias']:'').'.'.trim($v['foreignKey']).(isset($v['limit'])?' AND '.$v['limit']:''),isset($v['type'])?strtoupper($v['type']):'INNER'));
            }
            $this->join($join);
            // dump($join);
        }

        
        $field = '';
        //获取field
        if($field = $this->sqlOptions['field']?:''){
            if(is_array($field)){
                $field = implode(',',$field);
            }
        }

        // dump(self::$fieldAliasMap);
        $limit = $this->pageOptions['limit']?:null;
        
        //判断分页
        $pageSize = isset($get[$pageKeys['pageSize']])?$get[$pageKeys['pageSize']]:$limit;
        $page = isset($get[$pageKeys['page']])?$get[$pageKeys['page']]:1;

        unset($get[$pageKeys['pageSize']]);
        unset($get[$pageKeys['page']]);

        // dump($pageSize);
        if($page&&$pageSize){
            $this->page($page); 
            $limit = $pageSize;
        }

        $field .= ','.$alias.'.'.$this->getPk();

        $this->field($field);
        
        //获取where
        if($where = $this->sqlOptions['where']?:null&&is_array($where)){
            //扩展搜索框时要在这里加查询条件
            
            $search = array();

            //如果只是查询一条信息
            if(!is_null($id))
            {
                $where[(isset($alias)?$alias.".":"").$this->getPk()] = $id;
                $limit = 1;  
            }
            else
            {
                $searchArr = [];
                //判断是否为搜素功能
                if(method_exists($this,'searchMap') && count($get)!=0){
                    $searchArr = $this->searchMap($get);
                } 
                
                // var_dump($get);
                $where = array_merge($where, $searchArr);

            }
            
            
            $this->where($where);
            // dump($where);
        }

        
        if($whereOr = $this->sqlOptions['whereOr']?:null){
            $this->whereOr($whereOr);
        }

        // var_dump($where);

        $obj = $this
                ->order((is_null($alias)?'':$alias).'.'.$this->pageOptions['order'])
                ->limit($limit)
                ->select();

         // dump($obj);
        $dataKey = $this->resJsonKeys['data'];
        $totalKey = $this->resJsonKeys['total'];
        $infoKey = $this->resJsonKeys['info'];
        $successKey = $this->resJsonKeys['success'];
        $codeKey = $this->resJsonKeys['code'];
        $statusKey = $this->resJsonKeys['status'];


        if(!Session::get('form_token')){
            Session::set('form_token',sha1(Config::get("crypto.CRYPT_KEY_ACT")));
        }

        if(empty($obj)){
            return array(
                $dataKey => null,
                $totalKey => 0,
                $infoKey => '没有符合要求的信息！',
                $successKey=>false,
                $codeKey  => 500,
                $statusKey=>false,
                // 'token'=>Session::get('form_token'),
                // 'config'=>$this->fieldsOptions
            );
        }

        if(!is_null($id)){
            $detailConfig = $this->detail($id);

            return [
                $dataKey=>$obj[0],
                $totalKey=>1,
                'config'=>$detailConfig,
                $infoKey=> '获取数据成功',
                $successKey=>true,
                $statusKey=>true,
                $codeKey => 200
            ];

        }

        $data = [];
        foreach ($obj as $k => $v) {
            $data[$k] = $v->toArray();
            $data[$k]['key'] = $data[$k][$this->getPk()];
            // dump($v[$this->getPk()]);
            $data[$k][$this->getPk()] = act_encrypt($v[$this->getPk()]);

        }

        // $cry = act_encrypt(123123);
        // var_dump($cry);
        // var_dump(act_decrypt($cry));

        if(isset($alias)) $this->alias($alias);
        if(isset($where)) $this->where($where);
        if(isset($whereOr)) $this->whereOr($whereOr);
        if(isset($join)) $this->join($join);

        $count = $this->count((isset($alias)?$alias.'.':'').$this->getPk())?:0;


        // dump($data);
    
        $json = [
            $dataKey=>$data,
            'config'=>$this->fieldsOptions,
            'token'=>Session::get('form_token'),
            $totalKey=>$count,
            $infoKey=> '获取数据成功',
            $successKey=>true,
            $statusKey=>true,
            $codeKey => 200
        ];

        return $json;
    }

    /**
     * [setFieldsAliasMap 设置字段别名映射]
     */
    protected function setFieldsAliasMap(){
        $fieldArr = explode(',',implode(',',$this->sqlOptions['field']));

        foreach ($fieldArr as $k => $v) {
            preg_match('/([\w\.\-\(\)]+)\s*(AS|as)*\s*([\w\-]*)/i', $v,$m);
            if(empty($m[2])) continue;
            $f = explode('.',$m[1])[1];
            $this->fieldsAliasMap[$m[3]] = $f;  
        }

    }

    /**
     * [ajax_insert 新增操作]
     * @param  [type] &$json [description]
     * @return [type]        [description]
     */
    protected function ajax_insert(&$json,$req){

        $token = Session::get('form_token');


        $infoKey = $this->resJsonKeys['info'];
        $successKey = $this->resJsonKeys['success'];
        $codeKey = $this->resJsonKeys['code'];
        $statusKey = $this->resJsonKeys['status'];

        if($token == $req['token']){
            unset($req['token']);
            unset($req['_method']);

            $json = $this->write('add',$req);
            $json[$successKey] = $json[$statusKey];  
            return;
            
        }else{
            $json[$statusKey] = false;
            $json[$successKey] = $json[$statusKey];
            $json[$infoKey] = '非法操作！';
            return;
        } 
       
    }

    /**
     * [ajax_update 更新操作]
     * @param  [type] &$json [description]
     * @return [type]        [description]
     */
    protected function ajax_update(&$json,$req){

        $_pk = isset($req['_pk'])?$req['_pk']:null;
        $pk = act_decrypt($_pk);
     
        $infoKey = $this->resJsonKeys['info'];
        $successKey = $this->resJsonKeys['success'];
        $codeKey = $this->resJsonKeys['code'];
        $statusKey = $this->resJsonKeys['status'];
     

        // var_dump($pk);
        if(!$pk || $req['token'] != Session::get('form_token')){
            $json[$infoKey] = '请勿非法操作，拉黑后果自负！';
            $json[$statusKey] = false;
            $json[$codeKey] = 500;
            
        }else{
            unset($req['_method']);
            unset($req['_pk']);
            unset($req['token']);

            $id = $req['id'];

            $json = $this->write('edit',$req,$id);
        }

        
        $json[$successKey] = $json[$statusKey];  

        return;
    }


    /**
     * [ajax_edit 获取要修改数据的操作]
     * @param  [type] &$json [description]
     * @return [type]        [description]
     */
    // protected function ajax_edit(&$json,$id){
    //     // $data = Request::instance()->post();
    //     //这个段代码做示例要用
    //     $tokenValue = act_encrypt($id);
        
    //     // $data['pk'] = act_encrypt($data['pk']);

    //     $pk = $id;

            
    //     $error = '无权访问要请求的数据！';
    //     $field = $this->getPk();
    //     if(!$field || !$pk){
    //         $json['info'] = $error;
    //         $json['status'] = false;
    //         return; 
    //     } 
    //     // 数据访问检查
    //     $value=$this->where(array($field=>array('eq', $pk)))->find();
    //     // dump($value);
    //     if(!$value){
    //         $json['info'] = '数据不存在！';;
    //         $json['status'] = false;
    //         $json['code'] = 404;
    //         return;
    //     } 

    //     $json['info'] = '获取数据成功！';
    //     $json['status'] = true;
    //     $json['val'] = $value;
    //     $json['token'] = tokenBuilder($tokenValue);
    //     $json['total'] = 1;

    //     // 主键检查
    //     /*if(false===$this->checkPk($pk, 'edit')) return $this->setError($error);
    //     $log=array('msg'=>'数据描述：'.implode('|', $value), 'style'=>'text-info');
    //     Hook::listen('hy_log', $log);*/
    // }


    /**
     * [ajax_delete 删除操作]
     * @param  [type] &$json [description]
     * @return [type]        [description]
     */
    protected function ajax_delete(&$json,$req){

        $token = $req['token'];

        $infoKey = $this->resJsonKeys['info'];
        $successKey = $this->resJsonKeys['success'];
        $codeKey = $this->resJsonKeys['code'];
        $statusKey = $this->resJsonKeys['status'];


        if($token != Session::get('form_token')){
            $json[$infoKey]='数据非法！';
            $json[$codeKey]='500';
            $json[$successKey]=false;

            return;
        }

        unset($req['token']);
        unset($req['_method']);

        $deleteId = $req['deleteId'];

        if(is_array($deleteId)){
            foreach ($deleteId as &$v){
                $v = intval($v);

                if(!is_numeric($v)){
                    $json[$infoKey] = 'id格式错误，请重新提交！';
                    $json[$statusKey] = false; 
                    $json[$codeKey]   = 500;
                    return;
                }
            }  
        }else{
            $deleteId = intval($deleteId);
            if(!is_numeric($deleteId)){
                $json[$infoKey] = 'id格式错误，请重新提交！';
                $json[$statusKey] = false; 
                $json[$codeKey]   = 500;
                return;
            }
        }

        $json = $this->hy_delete($deleteId);    
        $json[$successKey] = $json[$statusKey];   
    }

    /**
     * [del 支持逻辑删除]
     * @param  [type] $arr [description]
     * @return [type]      [description]
     */
    protected function hy_delete($id){

        $infoKey = $this->resJsonKeys['info'];
        $successKey = $this->resJsonKeys['success'];
        $codeKey = $this->resJsonKeys['code'];
        $statusKey = $this->resJsonKeys['status'];

        // dump($id);
        $error = '无权访问要请求的数据！';
        $pk = $this->getPk();
        if(!$pk) 
            return [
                $statusKey=>false,
                $infoKey=>'无法获取主键，请和系统管理员联系！'
            ];
        
        // 数据访问检查
        $modelName  =  get_class($this);
        $model = new $modelName();

        if(is_array($id)){
            $value = $model->where(array($pk=>array('in', $id)))->select();
            $v_len = count($value);

            if($v_len < count($id)){
                return [
                    $statusKey=>false,
                    $infoKey=>'某条数据已经不存在，请刷新重试！'
                ];
            }
        }else{
            $value = $model->where(array($pk=>array('eq', $id)))->find();
            if(count($value) == 0){
                return [
                    $statusKey=>false,
                    $infoKey=>'该条数据已经不存在，请刷新重试！'
                ];
            }
        }

        /*
        // 主键检查
        if(false === $this->checkPk($arr,'delete')) return $this->setError($error);
        //记录日志
        $log=array('msg'=>'数据描述：'.implode('|', $value), 'style'=>'text-info');
        Hook::listen('hy_log', $log);*/
        // dump($this);
        
        
        
        // dump($this->pageOptions['deleteType'])
        if('delete'==$this->pageOptions['deleteType']){

            // $res = $model::destroy($id);

            Db::startTrans();

            try{

                if(is_array($id)){

                    foreach ($id as $k => $v) {
                        Db::table($this->table)->delete($v);
                        // 提交事务
                        Db::commit(); 
                    }
                    
                }else{
                    // var_dump($id);
                    Db::table($this->table)->delete($id);
                    Db::commit(); 
                }

                return [
                    $infoKey => '删除成功！',
                    $statusKey => true,
                    $codeKey => 200
                ];
                   
            } catch (\Exception $e) {
                // 回滚事务
                Db::rollback();

                return [
                    $infoKey => '删除失败，请重新操作！',
                    $statusKey => false,
                    $codeKey => 500
                ];
            }    
        }

        $del=explode('|', $this->pageOptions['deleteType']);

        if(2 !== count($del)){
            return [
                $infoKey => 'deleteType配置错误！',
                $statusKey => false,
                $codeKey => 500
            ];
        } 

        $model->where([$pk=>['IN', $id], $del[0]=>['lt', $del[1]]])
              ->update([$del[0]=>$del[1]]);

        return [
            $infoKey => '删除成功！',
            $statusKey => true,
            $codeKey => 200
        ]; 
    }

    /**
     * [write 对数据库进行的写操作，涉及多表写入]
     * @param  [string] $type [写入类型insert/update]
     * @param  [int] $pk   [主键]
     * @return [boolean]       [是否写入成功]
     */
    protected function write($type,$req,$pk=null){
        // $file = request()->file();
        // dump($file);
        // dump($_FILES);
        
        $class = CONTROLLER_NAME;
        $model = Loader::model($class);
        // dump($theModel);
        $data = $req;
        // var_dump($data);
        // $data = [
        //     'username'=>'SZA',
        //     'user_gender'=>'114',
        //     'email'=>'347756896@qq.com',
        //     'article_title'=>'love galore'
        // ];

        $model->fieldsTypeDealing($type,$data);

        // var_dump($data);
        $valide = $model->fieldsValidate($data);
        if($valide['status']===false){ 
            // var_dump($valide);
            return $valide;
        }

        
        $model->initCallback($data);

        /*自动填充*/
        $model->autoFill($type,$data);

        // var_dump($data);
        $dataList = [];
        $current = $model->table;

        /*获取键值*/
        $infoKey = $this->resJsonKeys['info'];
        $codeKey = $this->resJsonKeys['code'];
        $statusKey = $this->resJsonKeys['status'];
        
        if(isset($model->pageOptions['tablesWrite'])&&$model->pageOptions['tablesWrite'] === true){

            foreach ($model->fieldsOptions as $k => $v) {
                if(empty($v['form']) || (empty($v['form'][$type]) && false === $v['form'][$type])) continue;
                if(!$v['table']) $v['table'] = $current;
                
                if(isset($data[$k])&&$data[$k]!==false){
                    $t = $k;
                    if(isset($model->fieldsAliasMap[$k])) $k = $model->fieldsAliasMap[$k];
                    $dataList[DTP.$v['table']][$k] = $data[$t];
                }
            }

            // $dataList[$current][$this->getPk()]=$pk;
            $associate = $model->sqlOptions['associate'];
            $res = true;
            $keys = array_keys($dataList);
            $pkArr = [];
            // dump($dataList);

            if($type == 'add'){
                //插入并获取返回的id
                $model->isUpdate(false);

                foreach ($dataList[$current] as $k => $v) {
                    $model->$k = $v;
                }
                $model->allowField(true)->save();

                $pkName = $model->getPk();
                $id = $model->$pkName;
                // dump($id);
                $res = $id?true:false;

                foreach ($associate as $k => $v) {
                    $table = DTP.$v['table'];
                    if(in_array($table,$keys)){
                        $dataList[$table][$v['foreignKey']] = $id;
                        //返回的主键先暂存起来
                        $pkArr[$table] = Db::table($table)->insertGetId($dataList[$table]);
                        $res = $res && $pkArr[$table];
                    }           
                
                }

                //如果任意一张表新增不成功全部回滚
                if(!$res){
                    foreach ($pkArr as $k=>$v){
                        if($v>1) Db::table($k)->delete($v);
                    }
                    $model->delete($id);
                }
            }elseif($type == 'edit'){

                // dump($dataList[$current]);
                $model->isUpdate(true)->allowField(true)->save($dataList[$current],[$this->getPk()=>$pk]);
                // dump(array($dataList[$current],[$this->getPk()=>$pk]));
                // dump($keys);
                foreach ($associate as $k => $v) {
                    $table = DTP.$v['table'];
                    
                    if(in_array($table,$keys)){
                        //返回的主键先暂存起来
                        $pRes = Db::table($table)
                                        ->where($v['foreignKey'],$pk)
                                        ->update($dataList[$table]);
                        $pkArr[$table] = ($pRes == 0)?false:true;
                        $res = $res && $pkArr[$table];
                    }           
                }
                
            }

            return $res;
        }else{
            $dataList = [];
            $t = null;
            foreach($data as $k => $v) {
                $t = $k;
                if(isset($model->fieldsAliasMap[$k])){
                    $k = $model->fieldsAliasMap[$k];
                } 

                $dataList[$k] = $data[$t];          
            }
            
            if($type == 'add'){
                // var_dump($dataList);
                // $this_pk = $model->getPk();
                $res = $model->data($dataList)->allowField(true)->save();

                if(!!$res){ 
                    $status = true;
                    $info = '数据新增成功！';
                    $code = 200;
                }
                else{ 
                    $status = false;    
                    $info = '数据新增失败！';
                    $code = 500;
                };
                

            }elseif($type == 'edit'){
                // var_dump($dataList);
                // var_dump($pk);
                $res = $model->isUpdate(true)->allowField(true)->save($dataList,[$this->getPk()=>$pk]);
          
                if(!!$res){ 
                    $status = true;
                    $info = '数据更新成功！';
                    $code = 200;
                }
                else{ 
                    $status = false;
                    $info = '数据更新失败！';
                    $code = 500;
                };
            }

            return [$statusKey=>$status,$infoKey=>$info,$codeKey=>$code];
        }   
    }

    /**
     * [fieldsValidate 使用TP5自带验证器进行验证]
     * @param  [type] $data [description]
     * @return [type]       [description]
     */
    protected function fieldsValidate($data){


        $rules = $msgs = [];
        // dump($data);
        $data_key = array_keys($data);

        foreach ($this->fieldsOptions as $k => $v) {
            // var_dump($v['name']);
            if(!in_array($v['name'],$data_key)||empty($v['form'])||empty($v['form']['validate'])) continue;

            //进行xss过滤
            if($v['type']=='text')
                $data[$k] = htmlspecialchars($data[$k],ENT_QUOTES);
            elseif($v['type']=='textarea')
                $data[$v['name']] = remove_xss($data[$v['name']]);
        }


        if(!isset($this->validateOptions['rule']) || !isset($this->validateOptions['rule'])){
            return ['status'=>true];
        }

        $validate = new Validate($this->validateOptions['rule'],$this->validateOptions['msg']);

        $result = $validate->check($data);
        
        if(!$result){
            return ['status'=>false,'success'=>false,'message'=>$validate->getError(),'code'=>500];
        }
       
        

        return ['status'=>true];
    }


    /**
     * [fieldsTypeDealing 数据类型预处理]
     * @param  [type] &$field [description]
     * @return [type]         [description]
     */
    protected function fieldsTypeDealing($type,&$data){

        

        foreach ($data as $k => $v) {
            if(!isset($this->fieldOptionsMap[$k])) continue;
            $option = $this->fieldOptionsMap[$k];
            // var_dump($option);
            /*过滤掉不允许出现的字段*/
            if(!isset($option['form']['type']) || !is_array($option['form']['type'])){ 
                unset($data[$k]);
                continue;
            }
            // var_dump($option['form']['type']);

            if(!in_array('both',$option['form']['type']))
                if(!in_array($type,$option['form']['type'])){
                    unset($data[$k]);
                    continue;

                }

            
        }
    }
    
    protected function initCallback(&$data){
        // var_dump($data);
        foreach ($this->fieldsOptions as $k => $v) {
            // if($v['type'] === 'file'){
            //     if(!isset($v['form']['file'])){
            //         $v['form']['file'] = array(
            //             'ext'   =>  'jpg,png,gif',
            //             'size'=>521000,
            //             'mimeType'=>'image/jpeg,image/png,image.gif'
            //         )
            //     }
            //     // $data[$k] = $this->uploadFile($k,$v['form']['file']);
            //     continue;
            // }
            

            $cb = isset($v['form']['callback'])?$v['form']['callback']:null;

            // var_dump($v);
            if(is_null($cb)) continue;


            $data[$v['name']] = $this->callbackHandler($cb,$data[$v['name']],$data);
        }

    }

    /**
     * [autoFill 自动写入功能]
     * @param  [type] $type  [description]
     * @param  [type] &$data [description]
     * @return [type]        [description]
     */
    private function autoFill($type,&$data){
        $fieldsOptions = $this->fieldsOptions;
        // var_dump($type);
        // var_dump($data);
        foreach ($fieldsOptions as $k => $v) {
            if(!isset($v['form']) || !isset($v['form']['fill']) || !is_array($v['form']['fill']) || !isset($v['form']['fill']['type'])) continue;
            
            $fill = $v['form']['fill'];

            if($fill['type'] != 'both' && $fill['type'] != $type) continue;

            if(!isset($fill['callback'])) continue;

            $cbArr = $fill['callback'];

            /*第二个参数为填充值*/
            $cb = array_shift($cbArr);
            $initVal = array_shift($cbArr);
            // var_dump($v['name']);
            
            $data[$v['name']] = $this->callbackHandler($cb,$initVal);

            if($data[$v['name']]===false) unset($data[$v['name']]);

               
        }
    }

    protected function callback_formatTime($value){
        // var_dump($value);
        return time();
    }


    protected function callback_value($value,$data){
        // dump($value);
        return $value;
    }

    protected function uploadFile($filename,$options){
        $obj = HyFile::upload($filename,$options);
        
    }

    /**
     * [remove_xss 过滤xss]
     * @param  [type] $val [description]
     * @return [type]      [description]
     */
    public function remove_xss($val) {
       // remove all non-printable characters. CR(0a) and LF(0b) and TAB(9) are allowed
       // this prevents some character re-spacing such as <java\0script>
       // note that you have to handle splits with \n, \r, and \t later since they *are* allowed in some inputs
       /*过滤这三组字符[\x00-\x08,\x0b-\x0c,\x0e-\x19]*/
       $val = preg_replace('/([\x00-\x08,\x0b-\x0c,\x0e-\x19])/', '', $val);
       // straight replacements, the user should never need these since they're normal characters
       // this prevents like <IMG SRC=@avascript:alert('XSS')>
       $search = 'abcdefghijklmnopqrstuvwxyz';
       $search .= 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
       $search .= '1234567890!@#$%^&*()';
       $search .= '~`";:?+/={}[]-_|\'\\';
       for ($i = 0; $i < strlen($search); $i++) {
          // ;? matches the ;, which is optional
          // 0{0,7} matches any padded zeros, which are optional and go up to 8 chars
          // @ @ search for the hex values
          // 把$search[$i]转成ascii码以后转成十六进制
          $val = preg_replace('/(&#[xX]0{0,8}'.dechex(ord($search[$i])).';?)/i', $search[$i], $val); // with a ;
          // @ @ 0{0,7} matches '0' zero to seven times
          $val = preg_replace('/( {0,8}'.ord($search[$i]).';?)/', $search[$i], $val); // with a ;
       }
       // now the only remaining whitespace attacks are \t, \n, and \r
       // 可能存在的恶意标签
       $ra1 = array('javascript', 'vbscript', 'expression', 'applet', 'meta', 'xml', 'blink', 'link', 'script', 'embed', 'object', 'iframe', 'frame', 'frameset', 'ilayer', 'layer', 'bgsound', 'title', 'base');
    
        //所有的事件都过滤掉
       $ra2 = array('onabort', 'onactivate', 'onafterprint', 'onafterupdate', 'onbeforeactivate', 'onbeforecopy', 'onbeforecut', 'onbeforedeactivate', 'onbeforeeditfocus', 'onbeforepaste', 'onbeforeprint', 'onbeforeunload', 'onbeforeupdate', 'onblur', 'onbounce', 'oncellchange', 'onchange', 'onclick', 'oncontextmenu', 'oncontrolselect', 'oncopy', 'oncut', 'ondataavailable', 'ondatasetchanged', 'ondatasetcomplete', 'ondblclick', 'ondeactivate', 'ondrag', 'ondragend', 'ondragenter', 'ondragleave', 'ondragover', 'ondragstart', 'ondrop', 'onerror', 'onerrorupdate', 'onfilterchange', 'onfinish', 'onfocus', 'onfocusin', 'onfocusout', 'onhelp', 'onkeydown', 'onkeypress', 'onkeyup', 'onlayoutcomplete', 'onload', 'onlosecapture', 'onmousedown', 'onmouseenter', 'onmouseleave', 'onmousemove', 'onmouseout', 'onmouseover', 'onmouseup', 'onmousewheel', 'onmove', 'onmoveend', 'onmovestart', 'onpaste', 'onpropertychange', 'onreadystatechange', 'onreset', 'onresize', 'onresizeend', 'onresizestart', 'onrowenter', 'onrowexit', 'onrowsdelete', 'onrowsinserted', 'onscroll', 'onselect', 'onselectionchange', 'onselectstart', 'onstart', 'onstop', 'onsubmit', 'onunload');
       $ra = array_merge($ra1, $ra2);
       $found = true; // keep replacing as long as the previous round replaced something
       while ($found == true) {
          $val_before = $val;
          for ($i = 0; $i < sizeof($ra); $i++) {
             $pattern = '/';
             for ($j = 0; $j < strlen($ra[$i]); $j++) {
                if ($j > 0) {
                   $pattern .= '(';
                   $pattern .= '(&#[xX]0{0,8}([9ab]);)';
                   $pattern .= '|';
                   $pattern .= '|( {0,8}([9|10|13]);)';
                   $pattern .= ')*';
                }
                $pattern .= $ra[$i][$j];
             }
             $pattern .= '/i';
             $replacement = substr($ra[$i], 0, 2).'<x>'.substr($ra[$i], 2); // add in <> to nerf the tag
             $val = preg_replace($pattern, $replacement, $val); // filter out the hex tags
             if ($val_before == $val) {
                // no replacements were made, so exit the loop
                $found = false;
             }
          }
       }
       return $val;
    }



}