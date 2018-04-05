<?php
namespace app\user\model;
use app\common\model\HyList;

class User extends HyList
{   
    public $table = DTP.'user';
    // protected $autoWriteTimestamp = true;
    //若数据库的时间格式是datetime就改成 protected $autoWriteTimestamp = 'datetime'

    public function initialize(){
        parent::initialize();
        // var_dump($this->where(array("status"=>1))->column('id,name'));
    }
    
    /**
     * [initPk 初始化主键]
     * @return [string] [主键字段]
     */
    protected function initPk(){
        return 'id';
    }

    /**
     * [initInfoOptions 初始化标题]
     * @return [array] [description]
     */
    protected function initInfoOptions() {
        return array (
            'title' => '用户管理',
            'subtitle' => '管理所有用户信息' 
        );
    }

    protected function initSqlType(){
        return 'getDtData';
    }
    /**
     * [initSqlOptions 初始化sql语句]cust
     * @return [type] [description]
     */
    protected function initSqlOptions(){
        return [
            'alias' =>  'u',
            // 'associate' => [
            //     [
            //         'alias' => 'a',
            //         'table' =>  'article',//关联表名
            //         'foreignKey'    =>  'user_id',//当前表连接的关联表的外键 a.user_id
            //         'key'   =>   'id',//当前表的主键 u.id
            //         'limit'=>'a.status = 1',
            //         'searchType'=>'eq',
            //         'type'  => 'inner'
            //     ],
            //     [
            //         'alias' => 'fr',
            //         'table' =>  'frame_role',
            //         'foreignKey'    =>  'id',//fr.id
            //         'key'   =>   'role_id',//u.role_id
            //         'searchType'=>'in'
            //         // 'type'  =>  false
            //     ]
            // ],
            /*传参形式支持ThinkPHP5的传参形式*/
            'where' =>  [
                'u.status'   =>   array('eq',1),
                // 'a.user_id'=>array('lt',3)
            ],
            // 'whereOr'=>array(),
            'field' =>  [
                // 'a.title AS article_title',
                // 'fr.name AS frame_role_name',
                // 'u.username','u.password','u.gender AS user_gender,u.create_time,u.email'
                'id',
                'username',
                'age',
                'phone',
                'address',
                'email',
                'gender',
                'create_time'
            ]
        ];
    }

    protected function initValidateOptions(){
       $rule = [
            'username'  => 'require|max:25',
            'age'   => 'number|between:0,110',
            'email' => 'email',
        ];

        $msg = [
            'username.require' => '名称必须',
            'username.max'     => '名称最多不能超过25个字符',
            'age.number'   => '年龄必须是数字',
            'age.between'  => '年龄只能在0-110之间',
            'email'        => '邮箱格式错误',
        ];


        return ['rule'=>$rule,'msg'=>$msg];

    }

    protected function initPageOptions(){
        return array (
            'checkbox'  => true,
            // 'deleteType'=> 'status|9',
            /*
            'actions'   => array (
                'Pass' => array(
                    'title' => '通过',
                    'max' => 1
                )
            ),
            'buttons'   => array(
                'add'       =>  array(
                    'title'     =>  '报名',
                    'icon'      =>  'fa-plus'
                ),
            ),
            'initJS' => array(
                'OrganizeTrain',
            ),
            'formSize'=>'full',*/
            // 'tablesWrite'  => true
        );
    }


    protected function initFieldsOptions() {
        return [
            [
                'table' => 'user',
                'name'=>'username',
                'label' => '名字',
                'render'=>[
                    'show'=>true
                ],
                'form'=>[
                   'type'=>['add','edit'],
                   //前台的表单验证规则
                   'rules'=>[
                      'type'=>'string',
                      'required'=>true,

                    ],
                    'callback'=>['setVal']
                ],
                /*搜索框验证规则*/
                'search'=>[
                  'open'=>true,
                  /*前台的验证规则*/
                  'rules'=>[
                    'type'=>'string',
                    'required'=>false,
                    'message'=>'请输入姓名！',
                  ],
                  /*后台的验证规则*/
                  'backend'=>[
                    'type'=>'like',
                    // 'callback'=>['']
                  ]
                ]
            ],

            [
                'table' => 'user',
                'name'=>'gender',
                'label' => '性别',
                'render'=>[
                    'show'=>true
                ],
                'form' => [
                  'type'=>['add','edit'],
                  'rules'=>[
                      'type'=>'number',
                      // required:true
                  ]
                ],
                'search'=>[
                  'open'=>true,
                  'rules'=>['type'=>'number']
                ], 
                'type'=>'select',
                'options'=>[
                    ['id'=>1,'name'=>'男'],
                    ['id'=>2,'name'=>'女'],
                ]
            ],

            [
                'name'=>'age',
                'label'=>'年龄',
                'type'=>'number',
                'render'=>[
                    'show'=>true
                ],
                'form' => [
                      'type'=>['add','edit'],
                      'rules'=>[
                          'required'=> false,
                          'message' => "请输入正确格式"
                      ]
                ],
                
                'search'=>[
                    'open'=>true,
                    'rules'=>[
                        'type' => 'number'
                    ],
                    'backend'=>[
                        'type'=>'equal',
                        // 'callback'=>['']
                    ]
                ]
            ],
            
            [
                'name'=>'phone',
                'label'=>'电话',
                'render'=>[
                    'show'=>true
                ],
                'form' => [

                      'type'=>['add','edit'],
                      'rules'=>[
                          'pattern'=>'^1[34578]\d{9}$',
                          'message' => '电话格式不正确！'
                      ]
                ],
                'search'=>[
                    'open'=>true,
                    'rules'=>[
                      'pattern'=>'^1[34578]\d{9}$',
                      'message'=>'电话格式不正确！'
                    ]
                ]
            ],

            [
                'table' => 'user',
                'name'=>'address',
                'label' => '地址',
                'type'=>'address',
                'render'=>[
                    'show'=>true
                ],
                'form'  =>  [
                   'type'=>['add','edit']
                ],
                'search'=>[
                    'open'=>true
                ]
                
            ],
            
            [
                'name'=>'email' ,
                'label'=>'电子邮箱',
                'render'=>[
                    'show'=>false
                ],
                'form'=>[
                  'fill'=>[
                    'type' => 'add',
                    'callback'=>['value','347756896@qq.com']
                  ]
                ],
            ],

            [
                'name'=>'avatar',
                'label'=>'头像',
                'type'=>'file',
                'render'=>[
                    'show'=>false
                ],
                // 'form'=>[
                //     'type' => ['add','edit']
                // ]
            ],

            [
                'name'=>'create_time',
                'label'=>'创建时间',
                'type'=>'RangePicker',
                'render'=>[
                    'show'=>true
                ],
                'form'=>[
                    'fill'=>[
                        'type'=>'add',
                        'callback'=>[['formatTime']]
                    ]
                ],
                'search'=>[
                  'open'=>true,
                  'rules'=>[
                      'type'=>'array',
                      'required'=>false,
                      'message'=>'please select time'
                  ],
                  'backend'=>[
                    'type'=>'daterange',
                    // 'callback'=>['']
                  ]
                ], 
                
            ]
        ];
    }

    protected function initBackendFieldsOptions(){

    }

    public function detail($pk){

        return [
            'username'=>[
                'title'=>'用户名',
                'icon'=>'fa-users',
                'style'=>'green',
                'render'=>true
            ],
            'gender'=>[
                'title'=>'性别',
                'icon'=>'fa-pencil',
                'style'=>'purple-plum',
                'render'=>true
            ]
        ];
    }

    /**
     * [getGenderAttr 支持ThinkPHP5的获取器,支持字段定义别名的写法，但要转成驼峰法]
     * @param  [type] $value [description]
     * @return [type]        [description]
     */
    protected function getUserGenderAttr($value,$data){
        // dump($value);
        switch($value){
            case 1: $gender = '男';break;
            case 2: $gender = '女';break;
            default: $gender = '未定义';break;
        }
        return $gender;
    }

    protected function callback_setUserName($value){
        return strtoupper($value);
    }   

    /*protected function getCreateTimeAttr($value){
        return strtotime($value);
    }*/

    protected function callback_toUpper($value){
        // var_dump($value);
        return 'title like '.'\'%'.strtolower($value).'%\'';
    }

    protected function callback_setVal($value){
        return $value;
    }

}
