<template>
  <main>
    <!-- 登录页面导航栏---开始 -->
    <div class="titlebar">
      <div class="bg">
        <eight :Keep="Keep"/>
        <div class="jilu">我的收藏</div>
      </div>
      <div class="qie">{{showLogin?'编辑':'登录'}}</div>
    </div>
    <!-- 登录页面导航栏---结束 -->
    
  </main>
</template>
<script>
import Eight from './Eight'
export default {
  data(){
    return {
      showLogin:true,
      Keep:"/Coll"
    }
  },
  components:{
    // 注册登录组件
    "eight":Eight,
  }
}
</script>
<style scoped>
  /* 导航栏样式---开始 */
  .titlebar{
    background-color: #22A7f8;
    display:flex;
    justify-content:space-between;
    align-items: center;
    padding:0.8rem 1rem;
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
    margin-left: 13px;
  }
  .qie{
    color: #fff;
  }
  /* 导航栏样式---结束 */
</style>