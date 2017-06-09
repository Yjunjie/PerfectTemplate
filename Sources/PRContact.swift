
 

//与请求相关的定义
let Requestyjjip = "192.168.1.108"
//let Requestyjjip = "127.0.0.1"

let Requestyjj = "http://"+Requestyjjip

let RequestHome = Requestyjj+":8888"

let RequestUserInfoPath = RequestHome+"/queryUserInfoByUserName"//"/queryUserInfoByUserName"    //通过用户名查询用户信息
let RequestUserLogin = RequestHome+"/login"                         //登录
let RequestUserRegister = RequestHome+"/register"                   //注册
let RequestContentList = RequestHome+"/contentList"                 //获取笔记列表
let RequestContentDetail = RequestHome+"/contentDetail"             //获取笔记详情
let RequestContentAdd = RequestHome+"/contentAdd"                   //添加笔记
let RequestContentUpdate = RequestHome+"/contentUpdate"             //更新笔记
let RequestContentDelete = RequestHome+"/contentDelete"             //删除笔记
let RequestContentupload = RequestHome+"/upload"
let RequestContentdown = RequestHome+"/img/cat.jpg"

 
