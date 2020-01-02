<template>
  <div class="body">
    <van-sticky :offset-top="0" >
      <header class="header">
      <div class="head">
        <div class="left-icon">
          <img src="../assets/icon/返回.png" @click="fan" class="img-left">
          <div class="shizhan"><span>{{list.grade}}</span></div>
        </div>
        <div>
          <span  class="more" @click="showCont">
            <img src="../assets/icon/ziyuan.png" alt="">
            <div class="more_display" v-if="false">
                <a href="">
                  <img src="../assets/icon/主页.png" alt="">
                  回到首页</a>
                <a href="">
                  <img src="../assets/icon/个人中心.png" alt="">
                  个人中心</a>
                <a href="">
                  <img src="../assets/icon/反馈.png" alt="">
                  反馈问题</a>
                <a href="">
                <img src="../assets/icon/登录.png" alt="">
                  登录注册</a>
            </div> 
          </span>
          <span class="fenxiang"><img src="../assets/icon/fenxiang.png" alt=""></span>
        </div>
        <!-- <a href="" class="xiazai"><span>下载APP</span></a> -->
      </div>
    </header>
    </van-sticky>
    <div class="top-title">
      <span >{{list.grade}}课程</span>
      <p class="top-title_name">{{list.d_title}}</p>
      <p class="top-title_pic">￥348.00</p>
    </div>
    <div class="nav-detail2">
      <div class="nav-detail">
        <div class="nav-detail_1">
          <span class="nav-detail_1-title">促销</span>
          <div class="nav-detail_1-nr">
            <span class="nav-detail_1-hb">花呗支付</span>
            <span class="nav-detail_1-ye">已支持花呗支付</span>
          </div>
          <i class="nav-detail_1-sl"></i>
        </div>
        <div class="nav-detail_1">
          <span class="nav-detail_1-title">参数</span>
          <div class="nav-detail_1-nr">
            <span class="nav-detail_2-csnr">高级·17小时·502人学·10.00分</span>
          </div>
          <i class="nav-detail_1-sl"></i>
        </div>
        <div class="nav-detail_1 nav-detail-2">
          <span class="nav-detail_1-title">套餐</span>
          <div class="nav-detail_1-nr">
            <span class="nav-detail_2-csnr">套餐最高立省 ¥114，更多套餐有惊喜</span>
          </div>
          <i class="nav-detail_1-sl"></i>
        </div>
      </div>
    </div>
    <div class="pic-warp">
      <img src="../assets/pic/1.png" alt="">
      <img src="../assets/pic/2.png" alt="">
      <img src="../assets/pic/3.png" alt="">
      <img src="../assets/pic/4.png" alt="">
      <img src="../assets/pic/5.png" alt="">
    </div>
    <div class="section">
      <p class="section-title">章节</p>
      <div class="section-container">
        <div class="section-container-item">
          <p class="item-top">
            <span>第一章</span>
            <span class="item-name">章节介绍</span>
          </p>
          <div class="item-container">
            <i class="item-container-img"><img src="../assets/pic/阅读.png" alt=""></i>
            <p class="item-container-text">
              <span>1-1</span>
              <span>导学</span>
              <a href=""><span class="item-container-btn">试看</span></a>
            </p>
          </div>
        </div>
      </div>
    </div>
    <div class="teacher-wrap">
      <p class="wrap-title">讲师</p>
      <div class="teacher-container">
        <img src="../assets/pic/头像.jpg" alt="">
        <div>
          <p class="nickname">{{list.d_teacher}}</p>
          <p class="jobtitle">Web前端讲师</p>
        </div>
      </div>
    </div>
    <van-goods-action style="z-index:9999">
      <van-goods-action-icon :icon="shouc?'star':'star-o'" color="#ffeb3b" @click="shoucang" text="收藏"  />
      <van-goods-action-button @click="bo(list.d_id)" type="danger" text="立即学习"/>
  </van-goods-action>
  <div class="mask-box" @click="mask(list.d_id)" v-if="!show"></div>
  </div>
</template>
<script>
export default {
  data() {
    return {
      show:true,
      shouc:false,
      list:[],
      time:"",
      did:""
    }
  },
  created(){
    this.huodid();
  },
  // watch:{
  //   huodid(){
  //     if(this.huodid!=""){
  //       this.detail()
  //     }
  //   }
  // },
  beforeDestroy(){
    clearTimeout(this.time)
  },
  methods: {
    huodid(){
      if(!this.$route.query.did){
        
      }else{
        this.uid=this.$route.query.did;
        this.detail()
      }
    },
    add(){
      var url="add";
      var did=this.$route.query.did;
      var obj={did}
      this.time=setTimeout(()=>{
        this.axios.get(url,{params:obj}).then(res=>{
        })
        clearTimeout(this.time)
      },1000)
    },
    fan(){
      this.$router.go(-1)
    },
    bo(id){
      this.$router.push({path:"/Broad",query:{did:id}})
    },
    detail(){
      var url="deta";
      var did=this.$route.query.did;
      if(!did){
        this.$toast("回去");
        this.$router.go(-1)
      }
      var obj={did}
      this.axios.get(url,{params:obj}).then(res=>{
        this.list=res.data.data[0];
        this.add()
      })
    },
    shoucang(){
      if(this.shouc==false){
        this.shouc=true;
      }else{
        this.shouc=false
      }
    },
    showCont:function(){
      this.show = !this.show;
    },
    mask(){
      this.show=true;
    }
  }
}
</script>
<style scoped>
.mask-box{
  position: fixed;
    z-index: 1;
    top: 50px;
    left: 0;
    width: 100%;
    height:100%;
    background: rgba(43,51,59,.6);
}
.body{
  font: 12px "PingFang SC","微软雅黑","Microsoft YaHei",Helvetica,"Helvetica Neue",Tahoma,Arial,sans-serif;
  box-sizing: border-box
}
.header{
     width: 100%;
     height:60px;
     margin-top:-10px;
     margin-bottom:20px;
     padding:10px 0px;
     background:#fff;
     box-shadow: 0 2px 2px 0 rgba(28,31,33,.1);
     z-index: 9999;
}
 .left-icon{
      margin-left: 20px;
      margin-top: 10px;
      border-radius: 50%
}
.img-left{
      float: left;
      width:23px;
      height:23px;
      margin-top:3px;
      border-radius: 50%
}
.shizhan{
      margin-left: 15px;
      margin-top: 5px;
      float: left;
      color:#22a7f8;

}
.shizhan span{
  font-weight: 700;
  font-size: 18px; 
}
  .xiazai{
      width: 88px;
      height: 32px;
      margin-top: -16px;
      margin-right:15px;
      float: right;
      background: rgba(240,20,20,.05);
      border-radius: 20px;
      line-height: 33px;
  }
  .xiazai span{
      margin-left: 13px;
      text-align: center;
      font-weight: 700;
      color: rgb(32, 131, 212);
      font-size: 15px;
  }
  .fenxiang{
      margin-left: 15px;
      position:relative;
      float:right;
      width:28px;
      right:50px;

  }
  .fenxiang img{
      width: 28px;
      height: 28px;
      margin-right:10px;
      position: absolute;;

  }
  .more{
      margin-left: 10px;
      display:block;
      float:right;
      width:28px;
      position:relative;
      font-size:14px;
  }
  .more_display{
    width:125px;
    position: absolute;
    top:40px;
    right:0;
    text-align: center;
    padding: 10px 0;
    background:#fff;
    border-top:1px solid rgba(6, 10, 14, 0.16);
    border-bottom-left-radius: 15px;
    border-bottom-right-radius: 10px;
    z-index: 2;
  }
  .more_display a{
    display: block;
    padding:10px 0px;
    padding-left:20px;
    line-height: 15px;
      color:#2b333b

  }
  .more_display  a img{
    height:14px;
    width:14px;
  }
  .more img{
      width: 100%;
      height: 28px;  
    display: block;
    position: absolute;
  }
  .top-title{
    position:relative;  
    display: block;
    padding:0px 17px;
  }
  .top-title span{
    display:block;
    width:64px;
    height:24px;
    line-height: 24px;
    border-radius: 10px;
    font-size:12px;
    background:#22a7f8;
    color:#fff;
    text-align:center;
  }
  .top-title_name{
    margin-top: 3px;
    font-weight: 700;
    font-size: 24px;
    line-height: 24px;
    color: #2B333B;
    word-wrap: break-word;
    margin-bottom:0;
  }
  .top-title_pic{
    margin-top:3px;
    font-weight:700;
    font-size:16px;
    line-height: 24px;
    color:#22a7f8;
  }
  .nav-detail2{
    padding:0px 14px 17px;
  }
  .nav-detail{
    margin-top:19px;
    background:#f3f5f7;
    border-radius: 5px;
  }
  .nav-detail_1{
    padding:12px 10px;
    border-bottom:1px solid #d9dde1
  }
  .nav-detail_1-title{
    float: left;
    font-weight: 800;
  }
  .nav-detail_1-nr{
    margin-left:35px;
  }
  .nav-detail_2-csnr{
    overflow: hidden;
    display: -webkit-box;
    -webkit-line-clamp: 1;
    text-overflow: ellipsis;
    -webkit-box-orient: vertical;
  }  
  .nav-detail_1-hb{
    display: block;
    float: left;
    margin-right: 5px;
    height:18px;
    border-radius: 5px;
    background:rgba(0,140,200,.14);
    color:#22a7f8;
    text-align:center;

  }
  .nav-detail_1-sl{
    line-height:0.533333rem;
    float:right;
    font-size:.37333333rem;
    color:#71777d;
    margin-top:-14px;
  }
  .nav-detail_1-sl::before{
    content: "..."
  }
  .pic-warp {
    margin:0;
    padding:0;
  }
  .pic-warp img{
    width:100%;

  }
  .nav-detail-2{
    border:0;
  }
  .section{
    border-top:7px solid #f3f5f7;
    padding-bottom: 20px ;
    color:#000

  }
  .section-title{
    padding:17px; 
  }
  .section-container{
    padding: 0px 27px;
  }
  .item-top{
    line-height:1rem;
    font-size:14px;
  }
  .item-name{
    margin-left:9px;
  }
  .item-container{
    line-height: 1rem;
    color: #5f656b;
    position:relative
  }
  .item-container-img{
    float: left;
    margin-top:21px;
    width:18px;
    height:18px;
    line-height:18px;
    border-radius: 50%;
    background:#dee3e9;
    color:#fff;
    text-align:center;
    font-family: imwap !important;
    font-size:10px;
  }
  .item-container-img img{
    width:100%;
    height:100%;  
  }
  .item-container-img::before{
    content:""
  }
  .item-container-text{
    position:relative;
    display:block;
    margin-left:11px;
    padding: 2rem 1rem;
    /* width:25rem; */
    border-bottom:1px solid #d9dde1;
    line-height:1rem;
  }
  .item-container-btn{
    position:absolute;
    top:14;
    right:0 ;
    font-size:14;
    color:#71777d;
    background: rgba(0,140,200,.2);
    color: #22a7f8;
    border-radius: 10px;
    padding:3px 5px;
  }
  .teacher-wrap{
    padding-bottom:20px;
    margin-bottom: 50px;
  }
  .wrap-title{
    padding:20px 20px 16px 20px;
    font-size:14px;
    line-height:16px;
    color:#2b333b
  }
  .teacher-container{
    padding:0px 32px;
  }
  .teacher-container img{
    width:40px;
    height:40px;
    border-radius: 50%;
  }
  .teacher-container div{
    display: inline-block;
    margin-left:10px;
  }
  .nickname{
    margin-top:4px;
    font-weight: 700;
    font-size:16px;
    line-height:24px;
    color: #2b333b;
  }
  div /deep/ .van-icon-star:before{
    color:#efd806
  }
</style>