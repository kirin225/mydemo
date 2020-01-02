<template>
  <main>
    <!-- 登录页面导航栏---开始 -->
    <div class="titlebar">
      <router-link to="/" class="tui"><van-icon name="cross" size="1.4em"/></router-link>
      <div class="qie" @click="qie">{{showLogin?'注册':'登录'}}</div>
    </div>
    <!-- 登录页面导航栏---结束 -->
    <other-logins v-if="showLogin"></other-logins>
    <reg-ister v-if="!showLogin"></reg-ister>
  </main>
</template>
<script>
import Otherlogins from './login/Otherlogins'
import Register from './login/Register'
export default {
  data(){
    return {
      showLogin:true
    }
  },
  methods:{
    qie(){
      if(this.showLogin==true){
        this.showLogin=false;
      }else{
        this.showLogin=true;
      }
    }
  },
  components:{
    // 注册登录组件
    "otherLogins":Otherlogins,
    "regIster":Register,
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
  .qie{
    color: #fff;
  }
  /* 导航栏样式---结束 */
</style>