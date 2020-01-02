<template>
  <div class="main">
    <!-- 一楼 -->
    <div v-for="(item,i) in list" :key="i" @click="detail(item.d_id)" class="item">
      <!-- 左侧图片 -->
      <div class="item-left"><img :src="'http://progmydemo.applinzi.com/'+item.img" alt="" class="pics">
      </div>
      <!-- 中间文字 -->
      <div class="item-right">
        <h3 class="item-name">
          {{item.c_title}}
        </h3>
        <p class="item-name item-position">
          <span class="item-level">{{item.grade}}</span>
          <span class="dot">·</span>
          <span class="item-number"><img src="../../assets/icon/yh.png" alt="" class="item-image" 
          >{{item.people}}</span>
        </p>
      </div>
      <!-- 右侧小按钮 -->
      <div class="item-price-box">
        <!-- 价格标签 -->
        <a href=""><span>￥{{item.price}}</span></a>
      </div>
    </div>
    <!-- 更多按钮 -->
    <a href="" class="more">查看更多</a>
   </div>
</template>
<script>
export default {
  data(){
    return {
      list:[]
    }
  },
  created(){
    this.huo()
  },
  methods:{
    detail(id){
      this.$router.push({path:"/DropdownMenu",query:{did:id}})
    },
    huo(){
      var url="indextext";
      this.axios.get(url).then(res=>{
        this.list=res.data.data
      })
    }
  }
}
</script>
<style scoped>
  .main{margin-top:7px;}
/* 字体属性 */
.item{display: flex;align-items: center;margin-top: 5px;font:14px "PingFang SC","微软雅黑","Microsoft YaHei",Helvetica,"Helvetica Neue",Tahoma,Arial,sans-serif;color:#2d333b}
/* 主页图片属性 */
.pics{width: 100%;height:70px;border-radius: 10px;}
/* 主体左侧 */
.item-left{margin-left: 16px;width:24%;height: 100%;}
/* 主体右侧 */
.item-right{width:45%;height:70px;}
/* 标题属性 */
.item-name{font-size: 14px;overflow: hidden;margin:0 0 0 10px;line-height: 21px;width:100%;height: 45px;display: -webkit-box;-webkit-line-clamp: 2;text-overflow: ellipsis;-webkit-box-orient: vertical;}
/* 等级 */
.item-level{font-size:14px;color: #777;}
/* 圆点 */
.dot{font-size:20px;}
/* 人数图标 */
.item-image{width:15px;height:15px;margin-top:1px;}
/* 观看人数 */
.item-number{font-size:14px;color: #777;}
/* 价格标签 */
.item-price-box{margin-left:25px;width:15%;}
/* 价格字体 */
.item-price-box span{background:#e4e7e7;border-radius:20px;display:block;width:100%; height: 25px; color:#777;text-align:center;line-height: 25px;}
/* 更多 */
.more{display: block;height: 70px;color: #37F;font-size: 14px;text-align: center;line-height: 60px;}
</style>