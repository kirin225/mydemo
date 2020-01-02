<template>
  <main>
    <!-- 登录页面导航栏---开始 -->
    <div class="titlebar">
      <div v-if="!show" class="bg">
        <eight :Keep="Keep"/>
        <div class="jilu">历史记录</div>
      </div>
      <div v-if="show">
      </div>
      <div class="qie" @click="bian">{{show?'取消':'编辑'}}</div>
    </div>
      <!-- <van-button type="info" @click="toggleAll">反选</van-button> -->
      <van-checkbox-group class="margin" :class="{bottom:show}" v-model="result" ref="checkboxGroup">
        <div v-for="(item,i) of list" :key="i">
          <router-link class="text" :to="show?'':{path:'/Broad',query:{did:item.d_id}}">
            <div :class="{padding:show}">
              <van-checkbox v-if="show" :name="item.h_id"></van-checkbox>
            </div>
            <div style="height:80px;position:relative;">
              <div class="bofang"></div>
              <img style="width:120px;height:80px;border-radius:3px" :src="'http://progmydemo.applinzi.com/'+item.h_img">
            </div>
            <div class="nei">
              <p>{{item.h_title}}</p>
              <p>{{item.h_oder}}</p>
              <p>{{item.h_class}}</p>
            </div>
            <div v-if="!show" class="time">{{item.h_time}}</div>
          </router-link>
        </div>
      </van-checkbox-group>
      <p v-if="list==''" style="text-align:center">暂无历史播放记录</p>
      <div v-if="show" class="gong">
        <div><span>全选</span></div>
        <div><span>删除</span></div>
      </div>
  </main>
</template>
<script>
import Eight from './Eight'
export default {
  data(){
    return {
      checked:false,
      show:false,
      result:[],
      showLogin:true,
      Keep:"/Keep",
      list:""
    }
  },
  created(){
    this.lishi()
  },
  methods:{
    bian(){
      if(this.show==false){
        this.show=true;
      }else{
        this.show=false;
      }
    },
    time(i){
      var old=parseInt(i);
      var lian=new Date(parseInt(i));
      var oldday=new Date(parseInt(i)).getDate();
      var now=new Date().getTime();
      var nowday=new Date().getDate()
      var time=(now-old)/1000;
      var text;
      if(time>0&&time<60){
        text=time<1?'1秒前':`${Math.floor(time)}秒前`;
      }else if(time>=60&&time<60*60){
        text=`${Math.floor(time/60)}分钟前`;
      }else if(time>=60*60&&time<60*60*24){
        if((nowday-oldday)>0){
          text=`昨天 ${lian.getHours()}:${lian.getMinutes()}`
        }else{
          text=`${Math.floor(time/60/60)}小时前`;
        }
      }else if(time>=60*60*24&&time<60*60*24*2){
        text="2天前"
      }else if(time>=60*60*24*2&&time<60*60*24*3){
        text="3天前"
      }else if(time>=60*60*24*3&&time<60*60*24*4){
        text="4天前"
      }else{
        text=`${lian.getFullYear()}年${lian.getMonth()}月${lian.getDate()}日`
      }
      return text;
    },
    lishi(){
      if(sessionStorage.getItem('userID')==""||sessionStorage.getItem('userID')==null){
        this.show=false;
        this.$toast("请先登录");
        this.$router.push("/Login");
        return;
      }else{
        var url=this.Keep;
        this.axios.get(url).then(res=>{
          if(res.data.code==0){
            this.$toast("请先登录")
            this.$router.push("/Login");
            return;
          }else{
            this.list=res.data.data;
            var obj=res.data.data;
            for(var arr in obj){
              obj[arr].h_time=this.time(obj[arr].h_time)
            }
          }
        })
      }
    },
  },
  components:{
    // 注册登录组件
    "eight":Eight,
  }
}
</script>
<style scoped>
  *{
    padding: 0;
    margin:0;
  }
  /* 导航栏样式---开始 */
  .titlebar{
    background-color: #22A7f8;
    display:flex;
    justify-content:space-between;
    align-items: center;
    padding:0.8rem 1rem;
    position: fixed;
    top:0;
    width: 100%;
    z-index: 2;
  }
  .titlebar>a{
    color:#fff;
  }
  .tui{
    display:flex;
  }
  .bg{
    display: flex;
    align-items: center;
    color: #fff;
  }
  .jilu{
    margin-left: 3px;
  }
  .qie{
    color: #fff;
  }
  /* 导航栏样式---结束 */
  .margin{
    margin-top:50px;
  }
  .bottom{
    margin-bottom: 54px;
  }
  .text{
    margin: 4px 2px;
    display:flex;
    padding:4px;
    color: rgb(59, 59, 59);
    font-size: 13px;
    background-color:#f3f3f3; 
    position: relative;
    border-radius: 2px;
    overflow: hidden;
  }
  .text>div>p:first-child{
    font-weight: bold;
  }
  .text>div>p:nth-child(2){
    font-size: 12px;
  }
  .text>div>p:nth-child(3){
    font-size: 12px;
    width: 130px;
    display: block;
    white-space: nowrap;
    overflow: hidden;
    text-overflow: ellipsis;
  }
  .nei{
    display: flex;
    flex-direction:column;
    justify-content: space-between;
    padding:2px 10px 2px 8px;
  }
  .time{
    position: absolute;
    right: 2px;
    bottom: 6px;
  }
  .bofang{
    width:120px;
    height: 80px;
    background-image: url('../../public/imgs/broad/bofang.png');
    background-repeat: no-repeat;
    background-position: 44px 24px;
    z-index: 1;
    position: absolute;
    background-color: rgba(0,0,0,.4);
    border-radius: 3px;
  }
  .padding{
    padding: 6px;
    display: flex;
    align-items: center;
  }
  div /deep/ .van-icon{
    border:2px solid #e5e5e5;
  }
  div /deep/ .van-checkbox__icon--checked .van-icon {
    border-color: #1989fa;
  }
  .gong{
    width: 100%;
    height: 50px;
    background-color:#e5e5e5; 
    display:flex;
    justify-content: space-between;
    position: fixed;
    bottom: 0;
    z-index: 2;
  }
  .gong>div{
    width: 50%;
    padding: 15px;
    text-align: center;
  }
</style>