<template>
  <div>
     <div class="guding">
      <van-row>
        <van-col offset="1" span="19">
          <div class="res">
            <input class="inputs" v-model="text" @focus="tiao" type="text" maxlength="18">
          </div>
        </van-col>
        <van-col style="line-height:2.125rem" offset="1" span="3">
          <router-link to="/"><span class="quxiao">取消</span></router-link>
        </van-col>
      </van-row>
    </div>
    <div style="margin-top:61px">
      <van-list
        v-model="loading"
        :finished="finished"
        finished-text="没有更多了"
        @load="onLoad"
        :offset="1"
        class="c1"
      >
        <van-cell v-for="(item,i) in list" :key="i" @click="bo(item.d_id)">
          <div class="list_one">
            <div style="height:80px">
              <img :src="'http://progmydemo.applinzi.com/'+item.d_img" alt="" class="list_one_img">
            </div>
            <div class="list_one_msg">
              <p class="list_one_title">
                {{item.d_title}}
              </p>
              <p class="list_one_xq">{{item.d_hvtitle}}</p>
              <p class="list_one_shuju">
                <span>{{item.grade}}</span>
                <span>&nbsp;&nbsp;{{item.d_teacher}}在学</span>
              </p>
            </div>
          </div>
        </van-cell>
    </van-list>
    </div>
  </div>
</template>
<script>
export default {
  data(){
    return {
      loading: false,   //是否处于加载状态
      finished: false,  //是否已加载完所有数据
      ye:0,
      list:[],
      text:""
    }
  },
  methods:{
    onLoad(){
      var search=this.$route.query.text;
      this.text=search;
      var url="sear";
      var pno=this.ye+=1;
      var obj={search,pno}
      setTimeout(() => {
        this.axios.get(url,{params:obj}).then(res=>{
          if(res.data.data.length>0){
            this.list.push(...res.data.data)
            this.loading = false;
            if(res.data.data.length<7){
              this.finished = true;
            }
          }else{
            this.finished = true;
          }
        })
      }, this.ye==1?100:800);
    },
    bo(id){
      this.$router.push({path:"/DropdownMenu",query:{did:id}})
    },
    tiao(){
      this.$router.push("/Search")
    },
  }
}
</script>
<style scoped>
  .list_one{
    width: 100%;
    display: flex;
    padding:5px 6px;
  }
  .list_one_img{
    width: 120px;
    height: 100%;
    border-radius: 5px
  }
  .list_one_title{
    font-size: 13px;
    font-weight: bold;
    margin: 0;
  }
  .list_one_xq{
    font-size:11px;
    overflow: hidden;
    display: -webkit-box;
    -webkit-line-clamp: 2;
    text-overflow: ellipsis;
    -webkit-box-orient: vertical;
    margin: 0;
  }
  .list_one_msg{
    padding: 4px 9px;
    display:flex;
    flex-direction:column;
    justify-content: space-between;
  }
  .list_one_shuju{
    font-size: 10px;
    margin: 0;
  }
  .inputs{
    border:0;
    outline: 0;
    width: 100%;
    height: 2.125rem;
    border-radius:1.0625rem;
    background-image: url('../public/imgs/index/search.png');
    background-repeat: no-repeat;
    background-size: 1.3125rem 1.3125rem;
    background-position: 0.625rem 0.375rem; 
    color:#707070;
    padding:0.1875rem 3rem 0 3rem;
  }
  .guding{
    width: 100%;
    padding:0.8125rem 0.625rem;
    background-color: #22A7f8;
    color: #fff;
    position:fixed;
    top:0;left: 0;
    z-index: 1;
  }
  .res{
    position: relative;
  }
  .quxiao{
    color: #fff
  }
  div /deep/ .van-cell{
    line-height:normal;
    padding:0;
  }
</style>