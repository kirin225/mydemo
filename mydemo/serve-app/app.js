//功能：学子商城服务器程序
//1:下载四个第三方模块
//express           web服务器
//mysql             mysql驱动
//express-session   会话对象
//cors              跨域
//[8080脚手架   4000服务器]
//npm i express mysql express-session cors
//2:引入第三方模块
const express = require("express");
const session = require("express-session");
const mysql = require("mysql");
const cors = require("cors");
//3:创建数据库连接池
var pool = mysql.createPool({
   host:"w.rdc.sae.sina.com.cn",
   user:"wj32142mx0",
   password:"kk43iz3j12miixhm5wx1ky4lhkk13jiky1iiw2h1",
   connectionLimit:15,
   database:"app_progmydemo"
})
//4:创建web服务器
var server = express();
//5:配置跨域
//允许跨域程序端口
server.use(cors({
    //允许哪个程序列表 脚手架
    origin:[
      "http://progmydemo.applinzi.com","https://progmydemo.applinzi.com",
      "http://127.0.0.1:8080",
    "http://localhost:8080"
    ],
    //每次请求验证
    credentials:true
}));
//6:配置session对象
server.use(session({
   secret:"128位安全字符串",//加密条件
   resave:true,            //请求更新数据
   saveUninitialized:true  //保存初始化数据
}))
//7:指定静态目录  public
server.use(express.static("public")); 
//8:启动监听端口  4000
server.listen(5050);

// 主页轮播图
server.get("/carousel",(req,res)=>{
  var sql = "select img,d_id from pc_index_carousel;";
  pool.query(sql,(err,result)=>{
    res.send({code:1,msg:"查询成功",data:result})
  })
})


// 首页推荐列表
server.get("/indextext",(req,res)=>{
  var sql = "select * from pc_index_text;";
  pool.query(sql,(err,result)=>{
    res.send({code:1,msg:"查询成功",data:result});
  })
})



// 首页热门列表
server.get("/remen",(req,res)=>{
  var sql="select * from pc_detail order by d_click desc LIMIT 0,20;";
  pool.query(sql,(err,result)=>{
    res.send({code:1,msg:"查询成功",data:result})
  })
})

// 圈子
server.get("/quanzi",(req,res)=>{
  var sql="select * from pc_quan order by q_id desc;"
  pool.query(sql,(err,result)=>{
    res.send({code:1,msg:"查询成功",data:result})
  })
})


// 发帖内容
server.get("/fatie",(req,res)=>{
  var uid=req.session.uid;
  var title=req.query.title;
  var text=req.query.text;
  var time=req.query.time;
  var sql="select uname,phone,avatar from pc_user where uid=?;"
  pool.query(sql,[uid],(err,resu)=>{
    var {uname,phone,avatar}=resu[0];
    if(!uname&&!avatar){
      sql="INSERT INTO pc_quan VALUES (null,null,?,null,?,?,0,?,0,0,?)";
      pool.query(sql,[phone,title,text,time,uid],(err,result)=>{
        console.log("111111")
        res.send({code:1,msg:"发表成功",data:result})
      })
    }else if(!uname){
      sql="INSERT INTO pc_quan VALUES (null,null,?,?,?,?,0,?,0,0,?)";
      pool.query(sql,[phone,avatar,title,text,time,uid],(err,result)=>{
        console.log("222222")
        res.send({code:1,msg:"发表成功",data:result})
      })
    }else if(!avatar){
      sql="INSERT INTO pc_quan VALUES (null,?,?,null,?,?,0,?,0,0,?)";
      pool.query(sql,[uname,phone,title,text,time,uid],(err,result)=>{
        console.log("33333")
        res.send({code:1,msg:"发表成功",data:result})
      })
    }else{
      sql="INSERT INTO pc_quan VALUES (null,?,?,?,?,?,0,?,0,0,?)";
      pool.query(sql,[uname,phone,avatar,title,text,time,uid],(err,result)=>{
        console.log("4444")
        res.send({code:1,msg:"发表成功",data:result})
      })
    }
  })
})



// 圈子评论
server.get("/jieping",(req,res)=>{
  var qid=req.query.qid;
  var sql="select * from pc_quan_ping where q_id=? ORDER BY p_time DESC ;"
  pool.query(sql,[qid],(req,result)=>{
    if(result.length>0){
      res.send({code:1,msg:"查询成功",data:result})
    }else{
      res.send({code:0,msg:"暂无评论"})
    }
  })
})



// 评论量的增加
server.get("/pingci",(req,res)=>{
  var qid=req.query.qid;
  var sql="update pc_quan set q_ping=q_ping+1 where q_id=?"
  pool.query(sql,[qid],(req,result)=>{
    res.send({code:1,msg:"添加成功",data:result})
  })
})



// 点赞功能
server.get("/quanzan",(req,res)=>{
  var uid=req.query.uid;
  var qid=req.query.qid;
  var sql="select q_zan from pc_quan where q_id=?;"
  pool.query(sql,[qid,uid],(req,result)=>{
    var list=result[0].q_zan;
    list=list.split(",");
    var index=list.indexOf(uid.toString())
    if(index==-1){
      list.push(uid.toString())
      sql="update pc_quan set q_zan=? where q_id=?;"
      pool.query(sql,[list.toString(),qid],(req,resu)=>{
        res.send({code:1,msg:"点赞成功",data:resu})
      })
    }else if(index>-1){
      list.splice(index,1)
      sql="update pc_quan set q_zan=? where q_id=?;"
      pool.query(sql,[list.toString(),qid],(req,resu)=>{
        res.send({code:0,msg:"取消点赞",data:resu})
      })
    }
  })
})






// 添加浏览量
server.get("/add",(req,res)=>{
  var did=req.query.did;
  var sql="update pc_detail set d_click=d_click+1 where d_id=?;"
  pool.query(sql,[did],(req,result)=>{
    res.send({code:1,msg:"添加成功",data:result})
  })
})

server.get("/addping",(req,res)=>{
  var qid=req.query.qid;
  var sql="update pc_quan set q_lan=q_lan+1 where q_id=?;"
  pool.query(sql,[qid],(req,result)=>{
    res.send({code:1,msg:"添加成功",data:result})
  })
})


//功能一;完成用户登录验证
server.get("/login",(req,res)=>{
  //1:获取参数 uname upwd
  var n = req.query.uname;
  var p = req.query.upwd;
  var reg=/^1[3456789]\d{9}$/;
  //2:创建sql
  var sql;
  if(reg.test(n)==true){
    sql =" SELECT uid FROM pc_user WHERE phone = ? AND upwd = ?";
  }else{
    sql =" SELECT uid FROM pc_user WHERE uname = ? AND upwd = ?";
  }
  //3:发送sql并且结果返回脚手架
  pool.query(sql,[n,p],(err,result)=>{
     //4:如果发生严重错误抛出
     if(err)throw err;
     //5:登录成功用户名密码有错
     if(result.length==0){
       res.send({code:-1,msg:"用户名或密码有误"})
     }else{
       //6:登录成功
       //7:将登录成功用户id保存
       //session对象作为登录成功凭据
       //result=[{id:1}]
       //不写req.session.id error
       req.session.uid=result[0].uid;
       var uid=result[0].uid
       res.send({code:1,msg:"登录成功",data:uid});
     }
  })
})

// 功能二；注册并登录
server.get("/register",(req,res)=>{
  var phone=req.query.phone;
  var upwd=req.query.upwd;
  var sql=`SELECT uid FROM pc_user WHERE phone=?`;
  pool.query(sql,[phone],(err,result)=>{
    if(result.length>0){
      res.send({code:0,msg:"手机号码已注册！"})
    }else{
      var sql=`INSERT INTO pc_user VALUES (null,null,?,null,?,null, null,null);`
      pool.query(sql,[upwd,phone],(err,result)=>{
        req.session.uid=result.insertId;
        var uid=result.insertId;
        res.send({code:1,msg:"注册成功",data:uid})
      })
    }
  })
})

// 搜索信息
server.get("/sear",(req,res)=>{
  var pno=parseInt(req.query.pno)||1;
  var ps = 7;
  //x:sql
  var offset = (pno-1)*ps;
  var search=req.query.search;
  //  var sql=`SELECT * FROM xz_laptop_family WHERE fname LIKE '%${search}%' ORDER BY fname DESC LIMIT 0,8;`;
   var sql=`select * from pc_detail WHERE d_title LIKE '%${search}%' ORDER BY d_title ASC LIMIT ?,?;`
   pool.query(sql,[offset,ps],(err,result)=>{
    res.send({code:1,msg:"查询成功",data:result})
  })
})






// 注销登录
server.get("/outlogin",(req,res)=>{
  var log=req.session.uid;
  req.session.uid='';
  res.send({code:1,msg:"退出登录"})
})



// 查询个人信息
server.get("/news",(req,res)=>{
  //1:获取参数 uname upwd
  var uid=req.session.uid;
  if(!uid){
    res.send({code:0,msg:"请先登录"})
    return;
  }
  //2:创建sql
  var sql="SELECT * FROM pc_user WHERE uid = ?";
  pool.query(sql,[uid],(err,result)=>{
    res.send({code:1,msg:"查询成功",data:result})
  })
})

// 个人信息修改
server.get("/revise",(req,res)=>{
  var uid=req.session.uid;
  var {uname,sex,birthday,usign}=req.query;
  var sql="select uid from pc_user where uname=? AND uid!=?";
  pool.query(sql,[uname,uid],(err,result)=>{
    if(result.length>0){
      res.send({code:0,mgs:"用户名重复"})
    }else{
      sql="UPDATE pc_user SET uname=?,sex=?,birthday=?,usign=? WHERE uid=?;"
      pool.query(sql,[uname,sex,birthday,usign,uid],(err,result)=>{
        if(result.affectedRows>0){
          res.send({code:1,msg:"修改成功"})
        }
      })
    }
  })
})

// 圈子评论发表
server.get("/quanping",(req,res)=>{
  var uid=req.query.uid;
  var text=req.query.text;
  var qid=req.query.qid;
  var ptime=req.query.ptime;
  var sql="SELECT * FROM pc_user WHERE uid = ?"
  pool.query(sql,[uid],(err,resu)=>{
    if(resu.length>0){
      var {uname,phone,avatar}=resu[0];
      var uname=resu[0].uname;
      var phone=resu[0].phone;
      var avatar=resu[0].avatar;
      if(!uname&&!avatar){
        sql="INSERT INTO pc_quan_ping VALUES (null,null,?,null,?,0,?,?);"
        pool.query(sql,[phone,text,qid,ptime],(err,result)=>{
          res.send({code:1,msg:"没用户名，没头像"})
        })
      }else if(!uname){
        sql="INSERT INTO pc_quan_ping VALUES (null,null,?,?,?,0,?,?);"
        pool.query(sql,[phone,avatar,text,qid,ptime],(err,result)=>{
          res.send({code:1,msg:"没用户名"})
        })
      }else if(!avatar){
        sql="INSERT INTO pc_quan_ping VALUES (null,?,?,null,?,0,?,?);"
        pool.query(sql,[uname,phone,text,qid,ptime],(err,result)=>{
          res.send({code:1,msg:"没头像"})
        })
      }else{
        sql="INSERT INTO pc_quan_ping VALUES (null,?,?,?,?,0,?,?);"
        pool.query(sql,[uname,phone,avatar,text,qid,ptime],(err,result)=>{
          res.send({code:1,msg:"全有"})
        })
      }
    }
  })
})


// 课程信息
server.get("/deta",(req,res)=>{
  var did=req.query.did;
  var sql="select * from pc_detail where d_id=?"
  pool.query(sql,[did],(err,result)=>{
    res.send({code:1,msg:"查询成功",data:result})
  })
})


// 播放页面信息
server.get("/detail",(req,res)=>{
  var uid=req.session.uid;
  if(!uid){
    res.send({code:0,msg:"请先登录"})
    return;
  }
  var did=req.query.did;
  var sql="select * from pc_detail where d_id=?"
  pool.query(sql,[did],(err,result)=>{
    res.send({code:1,msg:"查询成功",data:result})
  })
})


// 查询个人信息
server.get("/news",(req,res)=>{
  //1:获取参数 uname upwd
  var uid=req.session.uid;
  if(!uid){
    res.send({code:0,msg:"请先登录"})
    return;
  }
  //2:创建sql
  var sql=" SELECT * FROM pc_user WHERE uid = ?";
  pool.query(sql,[uid],(err,result)=>{
    res.send({code:1,msg:"查询成功",data:result})
  })
})






// 播放信息
server.get("/ckeep",(req,res)=>{
  var uid=req.session.uid;
  if(!uid){
    res.send({code:0,msg:"请先登录"})
    return;
  }
  var {htitle,hoder,hclass,hvideo,hadd,himg,htime,did}=req.query;
  var sql="SELECT h_id FROM pc_user_history WHERE uid=? AND d_id=?;";
  pool.query(sql,[uid,did],(err,result)=>{
    if(result.length>0){
      sql="UPDATE pc_user_history SET h_oder=?,h_class=?,h_video=?,h_add=?,h_time=? WHERE uid=? AND d_id=?;"
      pool.query(sql,[hoder,hclass,hvideo,hadd,htime,uid,did],(err,result)=>{
        res.send(result)
      })
    }else{
      sql="INSERT INTO pc_user_history VALUES (null,?,?,?,?,?,?,?,?,?);"
      pool.query(sql,[htitle,hoder,hclass,hvideo,hadd,himg,htime,uid,did],(err,result)=>{
        res.send(result)
      })
    } 
  }) 
})


// 播放前查看有无历史记录
server.get("/lishij",(req,res)=>{
  var uid=req.session.uid;
  if(!uid){
    res.send({code:0,msg:"请先登录"})
    return;
  }
  var did=req.query.did;
  var sql="SELECT * FROM pc_user_history WHERE uid=? AND d_id=?;";
  pool.query(sql,[uid,did],(err,result)=>{
    res.send({code:1,msg:"查询成功",data:result})
  })
})

// 播放记录
server.get("/Keep",(req,res)=>{
  var uid=req.session.uid;
  if(!uid){
    res.send({code:0,msg:"请先登录"});
    return;
  }
  var sql="SELECT * FROM pc_user_history WHERE uid=? ORDER BY h_time DESC;";
  pool.query(sql,[uid],(err,result)=>{
    res.send({code:1,msg:"查找成功",data:result})
  })
})


server.get("/xiangping",(req,res)=>{
  var qid=req.query.qid;
  var sql="SELECT * FROM pc_quan WHERE q_id=?;";
  pool.query(sql,[qid],(err,result)=>{
    res.send({code:1,msg:"查找成功",data:result})
  })
})