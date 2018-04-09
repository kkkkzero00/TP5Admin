<?php
namespace app\admin\model;
use app\common\model\HyList;
use think\Config;
use think\Db;

class Manager extends HyList
{   
    public $table = DTP.'frame_manager';
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
            /*传参形式支持ThinkPHP5的传参形式*/
            'where' =>  [
                'status'   =>   array('eq',1),
                // 'a.user_id'=>array('lt',3)
            ],
            // 'whereOr'=>array(),
            'field' =>  [
                // 'a.title AS article_title',
                // 'fr.name AS frame_role_name',
                // 'u.username','u.password','u.gender AS user_gender,u.create_time,u.email'
                'id',
                'name',
                'role_id',
                'gender',
                'login_last_time'
        
            ]
        ];
    }

    protected function initValidateOptions(){
       // $rule = [
       //      'username'  => 'require|max:25',
       //      'age'   => 'number|between:0,110',
       //      'email' => 'email',
       //  ];

       //  $msg = [
       //      'username.require' => '名称必须',
       //      'username.max'     => '名称最多不能超过25个字符',
       //      'age.number'   => '年龄必须是数字',
       //      'age.between'  => '年龄只能在0-110之间',
       //      'email'        => '邮箱格式错误',
       //  ];


        // return ['rule'=>$rule,'msg'=>$msg];

    }

    protected function initPageOptions(){
        return array (
            'checkbox'  => true,
        );
    }


    protected function initFieldsOptions() {
        return [
            [
                'name'=>'id',
                'label' => '账号',
                'render'=>[
                    'show'=>true
                ],
                'form'=>[
                   'type'=>['add'],
                   'rules'=>[
                        'required'=> true,
                        'pattern'=>'^[0-9]+$',
                        'message' => "账号只能是数字！"
                    ],

                   //前台的表单验证规则

                ],
                /*搜索框验证规则*/
                'search'=>[
                  'open'=>true,
                  /*前台的验证规则*/
                  'rules'=>[
                    'type'=>'string',
                    'required'=>false,
                    'message'=>'请输入账号！',
                  ],
                  /*后台的验证规则*/
                  'backend'=>[
                    'type'=>'like',
                    // 'callback'=>['']
                  ]
                ]
            ],
            [
                'name'=>'name',
                'label'=>'姓名',
                'render'=>[
                    'show'=>true
                ],
                'form' => [
                      'type'=>['add','edit'],
                      'rules'=>[
                          'required'=> false,
                          'message' => "请输入正确姓名格式！"
                      ],
                      // 'callback'=>['setVal']
                ],
                
                'search'=>[
                    'open'=>true,
                    'rules'=>[
                        'type' => 'string'
                    ],
                    'backend'=>[
                        'type'=>'like',
                        // 'callback'=>['']
                    ]
                ]
            ],
            [
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
                'name'=>'password',
                'label'=>'密码',
                'render'=>[
                    'show'=>false
                ],
                'form' => [
                    'type'=>['add','edit'],
                    'rules'=>[
                        'required'=> false,
                        'message' => "请输入正确密码格式！"
                    ],
                    'callback'=>['pwdEncrypt']
                ]
            ],
            [
              'name'=>'role_id',
              'label' => '角色',
              'render'=>[
                  'show'=>true
              ],
              'form' => [
                'type'=>['add','edit'],
                'rules'=>[
                    'type'=>'array',
                    // required:true
                ]
              ],
              'search'=>[
                'open'=>true,
                'rules'=>['type'=>'array'],
                'backend'=>[
                    'type'=>'multiselect',
                 ]
              ], 
              'type'=>'multiselect',
            ],
            [
              'name'=>'create_time',
              'label'=>'创建时间',
              'type'=>'RangePicker',
              'render'=>[
                'show'=>true
              ],
              'form' => [
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
                      'message'=>'请选择创建时间！'
                  ],
                  'backend'=>[
                    'type'=>'daterange',
                  ]
              ], 
            ],
            // [
            //   'name'=>'avatar',
            //   'label'=>'头像',
            //   'type'=>'file',
            // ]
        ];
           
    }



    public function detail($pk){

        return [
            'name'=>[
                'title'=>'姓名',
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

    public function initSelectOptions(){
      $role_id = Db::table(DTP.'frame_role')->where(['status'=>1])->column("id,name");

      return [
        'role_id'=>$role_id,
        'gender'=>[1=>'男',2=>'女']
      ];
    }

    /**
     * [getGenderAttr 支持ThinkPHP5的获取器,支持字段定义别名的写法，但要转成驼峰法]
     * @param  [type] $value [description]
     * @return [type]        [description]
     */
    protected function getRoleIdAttr($value,$data){
        
        $roleIds = explode(',',$value);

        $data = Db::table("hy_frame_role")
            ->where(['id'=>['in',$roleIds],'status'=>1])
            ->column("id,name,description");

        return $data;
    }

    /*protected function getCreateTimeAttr($value){
        return strtotime($value);
    }*/

    protected function callback_toUpper($value){
        // var_dump($value);
        return 'title like '.'\'%'.strtolower($value).'%\'';
    }

    protected function callback_pwdEncrypt($value){
        return pwdEncrypt($value);
    }

    protected function callback_setVal($value){
        return 'set_'.$value;
    }


}
