<template>
  <main class="clor">
    <!-- 弹出层触发地点 -->
    <div class="gend" @click="showPopup"></div>
    <!-- 弹出层样式---开始 -->
    <van-popup :style="{height:'100%',width:'70%'}" :round="true" :overlay-style="{backgroundColor:'rgba(0,0,0,0.5)',overflow:'hidden'}" position="left" v-model="show">
      <div class="xinxi">
        <router-link :to="xinxi?'/News':'/Login'" class="toux">
          <van-image
          width="3.8rem"
          height="3.8rem"
          round
          fit="cover"
          :src="xinxi==false?'https://img.yzcdn.cn/vant/cat.jpeg':ziliao.avatar===null?'http://progmydemo.applinzi.com/img/head/gua.png':'http://progmydemo.applinzi.com/'+ziliao.avatar"
          />
        </router-link>
        <div class="scan"></div>
        <div v-if="!xinxi" class="geren">
          点击头像登录
        </div>
        <div v-if="xinxi" class="geren">
          <p>{{ziliao.uname===null?ziliao.phone:ziliao.uname}}</p>
          <p>{{ziliao.usign}}</p>
        </div>
      </div>
      <div class="list">
        <ul>
          <li :class="{listbg:list=='/'}" data-id="/" @click="an">首页</li>
          <li :class="{listbg:list=='/Keep'}" data-id="/Keep" @click="an">历史记录</li>
          <li :class="{listbg:list=='/Down'}" data-id="/Down" @click="an">下载管理</li>
          <li :class="{listbg:list=='/Coll'}" data-id="/Coll" @click="an">我的收藏</li>
        </ul>
      </div>
      <div v-if="xinxi" class="dibu" @click="outlogin">
        <span>退出登录</span>
      </div>
    </van-popup>
    <!-- 弹出层样式---结束 -->
  </main>
</template>
<script>
import {mapActions} from 'vuex'
export default {
  data(){
    return {
      show: false,
      activeKey:0,
      list:this.Keep||"/",
      xinxi:false,
      ziliao:[]
    }
  },
  props:["Keep"],
  created(){
    this.login()
  },
  watch:{
    '$store.state.uname'(){
      if(sessionStorage.getItem('userID')!=""&&sessionStorage.getItem('userID')!=null){
        this.login()
      }else{
        this.xinxi=false;
      }
    }
  },
  methods: {
    login(){
      if(sessionStorage.getItem('userID')==""||sessionStorage.getItem('userID')==null){
        this.xinxi=false;
        return;
      }
      // console.log(sessionStorage.getItem('userID'))
      var url="news";
      this.axios.get(url).then(res=>{
        if(res.data.code==0){
          this.xinxi=false
        }else{
          this.ziliao=res.data.data[0];
          this.xinxi=true;
        }
      })
    },
    showPopup() {
      this.show = true;
    },
    an(e){
      var olist=this.list;
      var nlist=e.target.dataset.id;
      if(!nlist){}else{
        if(olist!==nlist){
          this.list=e.target.dataset.id
          this.$router.push(this.list)
        }
      }
    },
    outlogin(){
      this.axios.get('outlogin').then(res=>{
        this.$store.state.uname="";
        this.$store.state.uid="";
        sessionStorage.clear();
        if(this.$store.state.uname==""&&this.$store.state.uid=="")
        this.$toast("请登录");
        this.$router.push('/Login');
      })
    }
  }
}
</script>
<style scoped>
  .gend{
    width: 20px;
    height: 20px;
    border-radius: 50%;
    background-image: url('../../public/imgs/index/genduo.png');
    background-repeat: no-repeat;
    background-size: 18px 18px;
    background-position: 1px 2px;
  }
  .clor{
    color:#707070;
  }
  .van-popup--left.van-popup--round{
    border-radius:0 0.5625rem 0.5625rem 0;
  }
  .xinxi{
    width: 100%;
    height:8.5rem;
    background-color:#F3F3F3;
    position: relative;
    top:0; left:0;
  }
  .scan{
    width:32px;
    height:32px;
    border-radius: 50%;
    border:0.125rem solid #808080;
    background-image: url('../../public/imgs/index/scan.png');
    background-repeat: no-repeat;
    background-size: 1rem 1rem;
    background-position:0.35rem 0.35rem;
    position: absolute;
    top:12px; right:20px;
  }
  .toux{
    display: block;
    width:3.81rem;
    height: 3.81rem;
    border-radius: 50%;
    position: absolute;
    top:12px; left:16px;
  }
  .geren{
    width: 100%;
    position: absolute;
    top:5.2rem;left: 0;
    padding:0 12px;
  }
  .list{
    margin-top:6px;
    list-style: none;
  }
  .list>ul>li{
    width: 100%;
    height: 40px;
    line-height: 40px;
    padding-left: 12px;
  }
  .listbg{
    background-color: #F3F3F3;
  }
  .dibu{
    width: 100%;
    height: 3rem;
    line-height:3rem;
    background-color: #F3F3F3;
    padding-left: 48px;
    position: absolute;
    bottom:0;left: 0;
    background-image: url('../../public/imgs/index/out-login.png');
    background-repeat:no-repeat;
    background-size:24px 24px;
    background-position: 16px 11px;
  }
  p{
    margin: 0;
    font-size: 14px;
  }
  .xinxi p:nth-child(2){
    font-size: 12px;
  }
</style>