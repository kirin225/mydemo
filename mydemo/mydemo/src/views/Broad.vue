<template>
  <main>
    <!-- 头部 -->
    <div class="titlebar">
      <!-- 2.将后台传来的xinxi放在对应的位置 -->
      <router-link to="" class="tui"><van-icon name="arrow-left"  color="#fff" size="1.4em" @click.native="$router.back(-1)"/></router-link>
      <span class="video_title">{{xinxi.d_title}}</span>
      <div style="width:22.4px;height:22.4px"></div>
    </div>
    <!-- 视频位置 -->
    <div class="video">
      <video :src="videourl==''?'':'http://progmydemo.applinzi.com/video/'+videourl" width="100%" autoplay="autoplay" controls="controls"></video>
    </div>
    <div class="text">
      <!-- 标题，演讲人，层级 -->
      <h3>{{xinxi.d_title}}</h3>
      <div class="bao"> 
        <van-row>
          <van-col class="title" span="5">演讲人</van-col>
          <van-col span="19">{{xinxi.d_teacher}}</van-col>
        </van-row>
      </div>
      <div class="bao"> 
        <van-row>
          <van-col class="title" span="5">层级</van-col>
          <van-col span="19">{{xinxi.grade}}</van-col>
        </van-row>
      </div>
    </div>
    <!-- 视频列表子组件 -->
    <flist @bobok="bobok" @fuz="fuz" @dataByVideo="dataByVideo" :jilu="jilu" :oder="xinxi"></flist>
  </main>
</template>
<script>
// 引入子组件flist
import flist from './flist'
export default {
  data(){
    return {
      // 后台信息存储
      xinxi:"",
      // 顶部视频路径存储
      videourl:"",
      // 发送的父子传参时的
      jilu:""
    }
  },
  created(){
    this.huodid();
  },
  components:{
    "flist":flist
  },
  methods:{
    huodid(){
      if(!this.$route.query.did){
        
      }else{
        this.kai();
        this.lishij();
      }
    },
    fuz(fuz){
      this.videourl=fuz;
    },
    lishij(){
      var did=this.$route.query.did;
      var url="lishij";
      var obj={did}
      this.axios.get(url,{params:obj}).then(res=>{
        this.jilu=res.data.data;
      })
    },
    bobok(bobok){
      this.videourl=bobok.add
    },
    dataByVideo(dataByVideo){
      this.videourl=dataByVideo.hadd;
      // console.log(this.videourl)
    },
    // 1.接收到路由传来参数did，发送axios请求
    kai(){
      if(sessionStorage.getItem('userID')==""||sessionStorage.getItem('userID')==null){
        this.$toast("请先登录")
        this.$router.push("/Login");
        return;
      }
      // did参数
      var did=this.$route.query.did;
      // 请求地址
      var url="detail";
      // 请求对象
      var obj={did}
      this.axios.get(url,{params:obj}).then(res=>{
        if(res.data.code==0){
          this.$router.push("/Login");
          return;
        }
        // 将接收的请求赋值给data中定义的xinxi
        this.xinxi=res.data.data[0];
        // console.log(this.xinxi.d_json)
      })
    }
  }
}
</script>
<style scoped>
  *{
    margin: 0;
    padding:0;
    color: #544e4c;
  }
  .titlebar{
      background-color: #22A7f8;
      display:flex;
      justify-content:space-between;
      align-items: center;
      padding:0.8rem 1rem;
      width: 100%;
      height: 48px;
      position: fixed;
      top:0;
      z-index: 1;
    }
  .tui{
    display:flex;
    
  }
  .video_title{
    overflow:hidden;
    height: 1.4em;
    -webkit-line-clamp:1;
    text-overflow:ellipsis;
    -webkit-box-orient: vertical;
    color:#fff;
    display:-webkit-box
  }
  .video{
    width:100%;
    margin-top: 48px
  }
  .text{
    padding: 8px 8px 0 8px;
    border-bottom: 7px solid #f3f3f3;
  }
  h4{
    color: #ff4e00;
    padding:4px 0;
  }
  .price{
    color:#BEBEBE;
    padding-bottom: 8px;
  }
  .bao{
    margin: 7px 0;
  }
  .title{
    color: #a5a5a5;
  }
</style>