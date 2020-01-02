<template>
  <main>
    <van-pull-refresh v-model="isLoading" @refresh="onRefresh">
      <div v-for="(item,i) in list" :key="i" class="display" @click="tiao(item.d_id)">
        <div class="top" :class="{down:(i+1)>3}">top{{i+1}}</div>
        <div style="height:73px">
          <img :src="item.d_img==''?'':'http://progmydemo.applinzi.com/'+item.d_img">
        </div>
        <div class="erji">
          <span>{{item.d_title}}</span>
          <span>{{item.d_hvtitle}}</span>
        </div>
        <div class="dianji">浏览量{{item.d_click}}</div>
      </div>
    </van-pull-refresh>
  </main>
</template>
<script>
export default {
  data(){
    return {
      list:[],
      isLoading:false
    }
  },
  created(){
    this.remen()
  },
  methods:{
    onRefresh() {
      setTimeout(() => {
        this.$toast('刷新成功');
        this.remen()
        this.isLoading = false;
      }, 500);
    },
    tiao(id){
      this.$router.push({path:"/DropdownMenu",query:{did:id}})
    },
    remen(){
      var url="remen";
      this.axios.get(url).then(res=>{
        this.list=res.data.data;
      })
    }
  }
}
</script>
<style scoped>
  .display{
    display: flex;
    align-items: center;
    background-color: #F3F3F3;
    margin: 4px;
    border-radius: 4px;
    padding:4px;
    position: relative;
  }
  .top{
    position: absolute;
    top:4px;left:4px;
    color:#f00;
    font-size: 13px;
    font-weight: bold;
    width:36px;
    height: 20px;
    padding:2px;
    background:rgba(255,255,255,0.7);
    border-radius: 1px;
  }
  .down{
    color: #000;
    font-weight: normal;
  }
  .display img{
    width: 104px;
    height: 100%;
    border-radius: 4px;
  }
  .erji{
    height: 73px;
    font-weight: bold;   
    padding: 2px 6px;
    font-size: 14px;
    display: flex;
    flex-direction:column;
    justify-content: space-between;
  }
  .erji>span:nth-child(2){
    display: block;
    width:142px;
    font-size: 12px;
    font-weight: normal;
    overflow: hidden;
    display: -webkit-box;
    -webkit-line-clamp: 2;
    text-overflow: ellipsis;
    -webkit-box-orient: vertical;
  }
  .dianji{
    position: absolute;
    font-size: 12px;
    bottom: 7px;
    right: 6px;
  }
</style>