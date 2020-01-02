<template>
  <div>
    <!-- 顶部按钮及搜索框 -->
    <van-sticky>
      <div class="header">
        <!-- 顶部第一张图片 -->
        <div class="eight"><eight class="eig"></eight></div>
        <!-- <img src="../assets/icon/gengduo.png" id="icon"/> -->
        <!-- 搜索框 -->
        <van-search placeholder="请输入搜索关键词" class="input" @focus="sousuo"/>
        <!-- 顶部后三张图片 -->
        <!-- <img src="../assets/icon/my.png" class="icon"/> -->
        <img @click="shoucang" src="../assets/icon/shoucang.png" class="icon"/>
        <img @click="keep" src="../assets/icon/bofangjilu.png" class="icon"/>
      </div>
    </van-sticky>
      <!-- 导航栏 -->
      <div>
        <van-tabs v-model="active" :swipeable="true" fixed z-index="10000" :animated="true">
          <van-tab title="直播">
            <index-live></index-live>
          </van-tab>
          <van-tab title="推荐">
            <div class="banner">
               <!-- 滚动条 -->
              <div class="Nbar">
                <van-notice-bar text="学习吧开课啦！！我们这里有好多好多的知识和技能等你来发掘哦！！！快和我一起来学习吧！！~~" left-icon="volume-o"  background="#ecf9ff" color="#1989fa"/>
              </div>
              <!-- 图片间隔，圆点颜色 -->
              <van-swipe :autoplay="3000" indicator-color="white">
                <!-- 轮播图小图 -->
                <van-swipe-item v-for="(item,i) in lunbo" :key="i">
                  <router-link :to="{path:'/DropdownMenu',query:{did:item.d_id}}"><img :src="'http://progmydemo.applinzi.com/'+item.img" class="pic"></router-link>
                </van-swipe-item>
              </van-swipe>
            </div>
            <!-- 主体内容 -->
            <a href="" class="wenzi">精品推荐</a>
            <index-text></index-text>  
          </van-tab> 
          <van-tab title="热门">
            <remen></remen>
          </van-tab>
          <van-tab title="圈子">
            <quanzi></quanzi>
          </van-tab> 
        </van-tabs>
      </div>
   <!-- 轮播图 -->
    <div v-if="active==3" @click="pinglun" class="fabiao"></div>
  </div>
</template>
<script>
import eight from './index/Eight'
import indexLive from './index/indexLive'
import indexText from './index/indexText'
import quanzi from './index/Quanzi'
import remen from './index/remen'
export default {
  data () {
    return {
      active: 1,
      lunbo:[]
    };
  },
  created(){
    this.carousel();
  },
  methods:{
    pinglun(){
      this.$router.push("/Fatie")
    },
    shoucang(){
      this.$router.push("/Coll")
    },
    keep(){
      this.$router.push("/Keep")
    },
    sousuo(){
      this.$router.push("/Search")
    },
    carousel(){
      var url="carousel"
      this.axios.get(url).then(res=>{
        this.lunbo=res.data.data;
      })
    }
  },
  components:{
    "eight":eight,
    "indexLive":indexLive,
    "indexText":indexText,
    "quanzi":quanzi,
    "remen":remen
  }
}
</script>
<style scoped>
/* 顶部第一张图片的样式 */
#icon{width: 25px;height: 25px;margin-top: 3px;margin-left: 10px;}
/* 顶部后三张图片的样式 */
.icon{width: 30px;height: 30px;}
/* 搜索框样式 */
.input{width: 200px;height: 30px;} 
/* 顶部布局 */
.header{display:flex;justify-content: space-between;padding: 14px;background:#fff};
/* 轮播图样式 */
.banner{width: 100%;height: 20%;}
/* 轮播图片属性 */
.pic{width: 100%;height: 200px;}
/* 文字样式 */
.wenzi{font-size: 16px;margin-left: 16px;color: rgb(17, 155, 197);}
.eight{
  margin-left:12px;
  width:28px;
  height:28px;
  border-radius:50%;
  background-color:#2d333b;
  position: relative;
}
.eig{
  position: absolute;
  top:3px;left: 4px;
}
.fabiao{
  position: fixed;
  bottom:22px;
  right: 26px;
  width: 45px;
  height: 45px;
  background-image: url('../public/imgs/index/fabiao.png');
  background-position: 9px 9px;
  background-repeat: no-repeat;
  background-size: 27px 27px;
  background-color: #22A7f8;
  border-radius: 50%;
  z-index: 10;
}
</style>