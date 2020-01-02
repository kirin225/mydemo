<template>
  <main style="padding:0 4px">
    <van-pull-refresh v-model="isLoading" @refresh="onRefresh">
      <div v-for="(item,i) in list" :key="i" @click="tiaoping(item.q_id)" class="kuang">
        <div class="po">
          <van-image
          width="2.8rem"
          height="2.8rem"
          round
          fit="cover"
          :src="item.img==null?'http://progmydemo.applinzi.com/img/head/gua.png':'http://progmydemo.applinzi.com/'+item.img"
          />
          <div class="uname">
            <span>{{!item?'':item.uname==null?item.phone.replace(/^(\d{3})\d{4}(\d{4})$/,'$1****$2'):item.uname}}</span>
            <span>{{item.q_time}}</span>
          </div>
        </div>
        <div class="text">
          <div class="title">{{item.q_title}}</div>
          {{item.q_text}}
        </div>
        <div class="gongneng">
          <span>浏览{{item.q_lan}}次</span>
          <div class="er">
            <div  @click.stop @click="zan(item.q_id,i)" class="erfu">
              <div class="dianzan" :class="{quzan:uid!=''&&item.q_zan.indexOf(uid)!=-1}"></div>
              <span>{{item.q_zan.length-1==0?0:item.q_zan.length-1}}</span>
            </div>
            <div class="pinglun"></div>
            <span>{{item.q_ping}}</span>
          </div>
        </div>
      </div>
    </van-pull-refresh>
  </main>
</template>
<script>
import {mapActions} from 'vuex'
export default {
  data(){
    return {
      list:[],
      isLoading:false,
      uid:""
    }
  },
  created(){
    this.huo();
  },
  watch:{
    '$store.state.uid'(){
      this.$store.state.uid=sessionStorage.getItem('userID');
      this.uid=sessionStorage.getItem('userID');
    }
  },
  methods:{
    tiaoping(qid){
      this.$router.push({path:"/pinlun",query:{qid:qid}})
    },
    huo(){
      this.uid=sessionStorage.getItem('userID');
      var url="quanzi";
      this.axios.get(url).then((res=>{
        this.list=res.data.data;
        console.log(this.list)
        var obj=res.data.data;
          for(var arr in obj){
            this.list[arr].q_time=this.guolvtime(obj[arr].q_time);
            this.list[arr].q_zan=this.guolvzan(obj[arr].q_zan);
          }
      }))
    },
    zan(qid,i){
      if(!this.uid){
        this.$toast("请先登录")
        return;
      }else{
        var url="quanzan";
        var obj={qid,uid:this.uid};
        this.axios.get(url,{params:obj}).then(res=>{
          if(res.data.code==1){
            this.list[i].q_zan.push(this.uid)
            this.$toast('点赞成功');
          }else if(res.data.code==0){
            var index=this.list[i].q_zan.indexOf(this.uid);
            this.list[i].q_zan.splice(index,1)
            // console.log(this.list[i].q_zan)
            this.$toast('取消点赞')
          }
        })
      }
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
    onRefresh() {
      setTimeout(() => {
        this.$toast('刷新成功');
        this.huo()
        this.isLoading = false;
      }, 500);
    },
  }
}
</script>
<style scoped>
  .kuang{
    width: 100%;
    border-radius: 6px;
    background-color: #f3f3f3;
    padding: 8px;
    margin: 5px 0;
  }
  .po{
    display:flex;
  }
  .uname{
    display: inline-block;
    display: flex;
    flex-direction:column;
    justify-content: space-between;
    padding: 3px 9px;
  }
  .text{
    padding: 7px 7px 0 7px;
    text-align: justify;
    overflow: hidden;
    display: -webkit-box;
    -webkit-line-clamp: 4;
    text-overflow: ellipsis;
    -webkit-box-orient: vertical;
    font-size: 14px;
  }
  .gongneng{
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 6px 9px 0 4px;
    font-size: 14px;
  }
  .dianzan{
    display: inline-block;
    width: 24px;
    height: 22px;
    background-image: url('../../public/imgs/index/zan.png');
    background-repeat: no-repeat;
    background-size: 22px 22px;
  }
  .quzan{
    background-image: url('../../public/imgs/index/zan_active.png');
  }
  .title{
    font-size: 17px;
    font-weight: bold;
  }
  .pinglun{
    display: inline-block;
    width: 24px;
    height: 24px;
    background-image: url('../../public/imgs/index/ping.png');
    background-repeat: no-repeat;
    background-size: 22px 22px;
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
</style>