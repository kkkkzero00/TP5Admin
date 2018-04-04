<?php
// +----------------------------------------------------------------------
// | ThinkPHP [ WE CAN DO IT JUST THINK ]
// +----------------------------------------------------------------------
// | Copyright (c) 2006-2016 http://thinkphp.cn All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: liu21st <liu21st@gmail.com>
// +----------------------------------------------------------------------

// [ 应用入口文件 ]
/*准许跨域*/
header("Access-Control-Allow-Origin: http://localhost:8000");
header("Access-Control-Allow-Methods: POST, GET, OPTIONS, PUT, PATCH, DELETE");
header("Access-Control-Allow-Headers: X-Requested-With,content-type");
header('Access-Control-Allow-Credentials: true');

if(strtoupper($_SERVER['REQUEST_METHOD'])== 'OPTIONS'){
    echo 200; 
    exit;
} 

// 定义应用目录
define('APP_PATH', __DIR__ . '/../application/');
// 加载框架引导文件
require __DIR__ . '/../thinkphp/start.php';
