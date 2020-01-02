<template>
  <div>
    <div>
      <van-sticky :offset-top="0">
      <div class="top">
        <div @click="fan" class="fanhui"></div>
        <span>  
          详情
        </span>
        <div class="kong"></div>
      </div>
      </van-sticky>
      <div class="padding">
        <div class="pl_c">
          <img :src="title==''?'':title.img==null?'http://progmydemo.applinzi.com/img/head/gua.png':'http://progmydemo.applinzi.com/'+title.img" alt="">
          <div class="pl_t">
            <p class="pl_t_yh">{{!title?'':title.uname==null?title.phone.replace(/^(\d{3})\d{4}(\d{4})$/,'$1****$2'):title.uname}}</p>
            <div>              
              <span class="pl_t_sj">{{title.q_time}}</span>
            </div>
          </div>
        </div>
        <div class="pl_nr">
          <span class="pl_nr_span">
            <div style="font-weight: bold; font-size:18px">{{title.q_title}}</div>
            {{title.q_text}}
          </span>
        </div> 
        <div class="pl_icon">
          <div class="er">
            <div @click="zan" class="erfu">
              <div class="dianzan" :class="{quzan:title!=''&&uid!=''&&title.q_zan.indexOf(uid)>-1}"></div>
              <span>{{!title?'':title.q_zan.length-1==0?0:title.q_zan.length-1}}</span>
            </div>
            <div class="pinglun"></div>
            <span>{{fuping==''?0:fuping.length}}</span>
          </div>
        </div>   
      </div>
      <div v-if="!show">
        <div class="pingx">评论详情</div>
          <div style="margin-bottom:56px">
            <div class="padding" v-for="(item,i) in fuping" :key="i">
            <div class="er_ping">
              <div class="er_tou">
                <img :src="item.p_img==null?'http://progmydemo.applinzi.com/img/head/gua.png':'http://progmydemo.applinzi.com/'+item.p_img" alt="">
                <div class="er_ming">
                  <span>{{!item.p_uname?item.p_phone.replace(/^(\d{3})\d{4}(\d{4})$/,'$1****$2'):item.p_uname}}</span>
                  <span class="pl_t_sj">{{item.p_time}}</span>
                </div>
              </div>
              <!-- <div class="pingzan">
                <div class="dianzan"></div>
                <span>999</span>
              </div> -->
            </div>
            <div class="er_text">
              <span>
                {{item.p_text}}
              </span>
            </div>
          </div>
        </div>
      </div>
      <div v-if="show" style="padding:9px;text-align:center;">
       发表评论 ，做一楼主人吧
      </div>
    </div>
    <div class="guding">
      <input v-model="text" @focus="pan" type="text">
      <button @click="fasong">发送</button>
    </div>
  </div>
</template>
<script>
import {mapActions} from 'vuex'
export default {
  data() {
    return {
       show:false,
       title:"",
       uid:"",
       time:"",
       text:"",
       fuping:""
    };
  },
  created(){
    this.huoqid();
  },
  beforeDestroy(){
    clearTimeout(this.time)
  },
  methods: {
    pingci(){
      var url="pingci";
      var qid=this.$route.query.qid;
      var obj={qid};
      this.axios.get(url,{params:obj}).then(res=>{
      })
    },
    shouping(){
      var url="jieping";
      var qid=this.qid;
      var obj={qid};
      this.axios.get(url,{params:obj}).then(res=>{
        if(res.data.code==0){
          this.show=true;
        }else if(res.data.code==1){
          this.fuping=res.data.data;
          var obj=res.data.data;
          for(var arr in obj){
            this.fuping[arr].p_time=this.guolvtime(obj[arr].p_time);
          this.show=false;
          }
        }
      })
    },
    zan(){
      if(!sessionStorage.getItem('userID')){
        this.$toast("请先登录")
        return;
      }else{
        var url="quanzan";
        var qid=this.$route.query.qid;
        var obj={qid:qid,uid:sessionStorage.getItem('userID')};
        this.axios.get(url,{params:obj}).then(res=>{
          if(res.data.code==1){
            this.title.q_zan.push(sessionStorage.getItem('userID'))
            this.$toast('点赞成功');
          }else if(res.data.code==0){
            var index=this.title.q_zan.indexOf(sessionStorage.getItem('userID'));
            this.title.q_zan.splice(index,1)
            // console.log(this.list[i].q_zan)
            this.$toast('取消点赞')
          }
        })
      }
    },
    pan(){
      if(!this.uid){
        this.$router.push("/Login");
        return;
      }
    },
    fasong(){
      if(!this.uid){
        this.$router.push("/Login");
        return;
      }
      if(!this.text){
        this.$toast("内容不能为空");
        return;
      }
      var url="quanping"
      var uid=this.uid;
      var text=this.text;
      var qid=this.$route.query.qid;
      var ptime=new Date().getTime();
      var obj={uid,text,qid,ptime};
      this.axios.get(url,{params:obj}).then(res=>{
        if(res.data.code==1){
          this.shouping();
          this.pingci();
          this.text="";
          this.$toast("发表成功");
        }
      })
    },
    add(){
      var url="addping";
      var qid=this.$route.query.qid;
      var obj={qid}
      this.time=setTimeout(()=>{
        this.axios.get(url,{params:obj}).then(res=>{
        })
        clearTimeout(this.time)
      },6000)
    },
    huoqid(){
      if(!this.$route.query.qid){
        
      }else{
        this.qid=this.$route.query.qid;
        this.uid=sessionStorage.getItem('userID');
        this.zhuti();
      }
    },
    zhuti(){
      var qid=this.$route.query.qid;
      var url="xiangping";
      var obj={qid}
      this.axios.get(url,{params:obj}).then(res=>{
        if(res.data.code==1){
          this.title=res.data.data[0];
          this.title.q_time=this.guolvtime(this.title.q_time);
          this.title.q_zan=this.guolvzan(this.title.q_zan);
          this.add()
          this.shouping()
        }
      })
    },
    fan(){
      this.$router.go(-1)
    },
    guolvzan(arr){
      var list=arr.split(",");
      return list;
    },
    guolvtime(i){
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
  }
}
</script>
<style scoped>
  .top{
    width: 100%;
    display: flex;
    justify-content: space-between;
    background: -webkit-gradient(linear, 0 0,100% 0, from(#00c9ff), to(rgb(34,167,248)));
    padding:13px;
    color: #fff;
  }
  .fanhui{
    width: 20px;
    height: 20px;
    background-image: url("../assets/icon/返回1.png");
    background-repeat: no-repeat;
    background-size: 20px;
  }
  .kong{
    width: 20px;
    height: 20px;
  }
  .pl_t_q{
    font-size: .8rem
  }
  .padding{
    background-color: #f3f3f3;
    margin: 6px 7px 0;
    padding: 9px 9px 0;
    border-radius: 6px;
    position: relative;
  }
  .pl_nr{
    margin-top:.7rem;
  }
  .pl_nr_span{
    font-size: 14px;
    line-height: 1.5rem;
    color:#2c3e50;
  }
  .pl_icon{
    /* height:3rem; */
    width: 100%;
    margin:.5rem 0;
    position:relative
  }
  .dianzan{
    display: inline-block;
    width: 36px;
    height: 36px;
    background-image: url('../public/imgs/index/zan.png');
    background-repeat: no-repeat;
    background-size: 26px 26px;
    background-position: 5px 3px;
  }
  .quzan{
    background-image: url('../public/imgs/index/zan_active.png');
  }
  .pinglun{
    display: inline-block;
    width: 36px;
    height: 36px;
    background-image: url('../public/imgs/index/ping.png');
    background-repeat: no-repeat;
    background-size: 26px 26px;
    background-position: 5px 3px;
  }
  .er{
    display: flex;
    align-items: center;
  }
  .erfu{
    display: flex;
    align-items: center;
    margin-right: 26px;
  }
  .pl_c{
    width: 100%;
    display: flex;
  }
  .pl_c img{
    border-radius: 50%;
    height:2.7rem;
    width:2.7rem
  }
  .pl_t{
    margin-left: 1rem;
    display: flex;
    flex-direction: column;
    justify-content: space-between;
  } 
  .pl_t_yh{
  margin:0;
  /* line-height:2rem; */
  font-size:1.1rem;
  }
  .pl_t_sj{
    color:#a09999;
    font-size: .9rem;
  }

  .pingx{
    margin: 4px 7px;
    border-radius: 6px;
    padding:0 6px;
  }
  .er_ping{
    display: flex;
    justify-content: space-between;
    align-items: center;

  }
  .er_tou{
    display: flex;
  }
  .er_tou img{
    border-radius: 50%;
    height:2.7rem;
    width:2.7rem;
  }
  .er_ming{
    font-size: 14px;
    margin-left: 10px;
    display: flex;
    flex-direction: column;
    justify-content: space-between;
  }
  .pingzan{
    display: flex;
    align-items: center;
    position: relative;
  }
  .er_text{
    padding: 7px 10px;
  }
  .guding{
    width: 100%;
    padding: 12px 20px;
    display: flex;
    justify-content: space-between;
    align-items: center;
    background-color: #f3f3f3;
    position: fixed;
    bottom: 0;
  }
  input{
    height: 28px;
    border-radius: 3px;
    border: 1px solid rgb(131, 128, 128);
  }
  button{
    border-radius: 5px;
    background-color: #00c9ff;
    color: #fff;
    border:0;
    height: 30px;
    width: 60px;
  }
</style>