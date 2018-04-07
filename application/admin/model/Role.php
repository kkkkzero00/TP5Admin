<?php
namespace app\admin\model;
use app\common\model\HyList;
use think\Config;
use think\Db;

class Role extends HyList
{   
    public $table = DTP.'frame_role';
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
            // 'alias' =>  'm',
    
            /*传参形式支持ThinkPHP5的传参形式*/
            'where' =>  [
            ],
            // 'whereOr'=>array(),
            'field' =>  [
                // 'a.title AS article_title',
                // 'fr.name AS frame_role_name',
                // 'u.username','u.password','u.gender AS user_gender,u.create_time,u.email'
                'id',
                'name',
                'description',
                'status'
        
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
                'name'=>'name',
                'label'=>'名称',
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
              'name'=>'description',
              'label'=>'描述',
                'render'=>[
                    'show'=>true
                ],
                'form' => [
                      'type'=>['add','edit'],
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
              'name'=>'status',
              'label'=>'状态',
              'type'=>'select',
              'render'=>[
                  'show'=>true
              ],
              'form' => [
                  'type'=>['add','edit'],
                  'rules'=>[
                      'type'=>'number'
                  ],
              ],
              
              'search'=>[
                  'open'=>true,
                  'rules'=>[
                      'type' => 'number'
                  ]
              ]
            ]

        ];
           
    }

    public function initSelectOptions(){
  
      return [
        'status'=>[1=>'启用',0=>'禁用']
      ];
    }

    public function beforeSend($data){
        $rules = [];
        foreach ($data as $k => &$v) {

            if($v['key'] == 1){
                $rules = Db::table(DTP.'frame_rule')
                    ->where([
                        'status'=>1,
                        'type'=>['neq','admin']
                      ])
                    ->field('id,pid,name')
                    ->select();                
            }else{
                $rules = Db::name('frame_access')
                    ->alias('fa')
                    ->where([
                      'fa.role_id'=>$v['key']
                    ])
                    ->join('hy_frame_rule fr','fa.rule_id = fr.id')
                    ->field('fr.id,fr.pid,fr.name')
                    ->select();

            } 

            $v['rules'] = $rules;
        }

        return $data;
    }


}
