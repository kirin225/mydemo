<template>
  <main>
    <h3>账号登录</h3>
    <!-- 输入框---开始 -->
    <van-row>
      <!-- 手机号码输入框---开始 -->
      <van-col span="18" offset="3">
        <input type="text" class="txt phone" v-model="uname" placeholder="用户名/手机号码">
      </van-col>
    </van-row>
    <!-- 手机号码输入框---结束 -->
    <!-- 密码输入框---开始 -->
    <van-row>
      <van-col span="18" offset="3">
        <div class="posi">
          <input :type="showUpwd?'text':'password'" v-model="upwd" class="txt upwd" placeholder="请输入密码">
          <!-- 密码的显示与隐藏 -->
          <div :class="{upwdout:!showUpwd,upwdin:showUpwd}" class="showipwd" @click="pwd"></div>
        </div>
      </van-col>
    </van-row>
    <!-- 密码输入框---结束 -->
    <!-- 输入框---结束 -->
    <!-- 登录按钮--开始 -->
    <van-row>
      <van-col span="18" offset="3">
        <van-button type="primary" class="btn" size="large" color="#22A7f8" @click="log">登录</van-button>
      </van-col>
    </van-row>
    <!-- 登录按钮---结束 -->
    <div>
      <van-row>
        <van-col span="18" offset="3">
          <div class="note"><span>手机短信登录</span><span>忘记密码</span></div>
        </van-col>
      </van-row>
    </div>
    <!-- 其他登录方式子组件---开始 -->
    <div class="logins">
      <van-row>
        <van-col span="18" offset="3">
          <van-divider :style="{ color: '#2c3e50', borderColor: '#2c3e50'}">
            社交账号登录
          </van-divider>
        </van-col>
      </van-row>
      <van-row>
        <van-col class="other" span="18" offset="3">
          <div class="bg qq"></div>
          <div class="bg weixin"></div>
          <div class="bg xsin"></div>
        </van-col>
      </van-row>
    </div>
    <!-- 其他登录方式子组件---结束 -->
  </main>
</template>
<script>
import {mapActions} from 'vuex'
export default {
  data(){
    return {
      uname:"",
      upwd:"",
      showUpwd:false
    }
  },
  methods:{
    // 登录请求
    log(){
      // 获取用户名或手机号
      var u=this.uname;
      // 获取密码
      var p=this.upwd;
      // 判断用户名或者密码是否为空
      if(u==""){
        this.$dialog.alert({title:"提示信息",message:"请输入用户名或手机号！"}).then(()=>{});
        return;
      }
      // 判断密码是否为空
      if(p==""){
        this.$dialog.alert({title:"提示信息",message:"请输入密码！"}).then(()=>{});
        return;
      }
      // 前台验证用户名格式是否正确
      var userReg=/^[a-zA-Z]{3,15}$/;
      // 验证手机号码格式是否正确
      var phoneReg=/^1[3456789]\d{9}$/
      // 验证密码格式是否正确
      var upwdReg=/^[a-z0-9]{3,12}$/; 
      // 判断用户名或者密码其中一个是否有一个符合格式，且判断密码是否符合格式
      if((userReg.test(u)!=true||phoneReg.test(u)!=true)&&upwdReg.test(p)!=true){
        this.$dialog.alert({title:"提示信息",message:"账号或密码错误！"}).then(()=>{});
        this.uname="";
        this.upwd="";
        return;
      }
      // 请求路径
      var url="login";
      // 发送的值
      var obj={uname:u,upwd:p};
      // 发送请求
      this.axios.get(url,{params:obj}).then(res=>{
        // 判断是否登录成功
        if(res.data.code<0){
          this.$dialog.alert({title:"提示信息",message:"账号或密码错误！"}).then(()=>{});
          this.uname="";
          this.upwd="";
          return;
        }else{
          // 跳转Product组件
          sessionStorage.setItem('userID',res.data.data);
          this.$store.state.uid=sessionStorage.getItem('userID');
          this.$store.state.uname=sessionStorage.getItem('userID');
          if(sessionStorage.getItem('userID')!=""&&this.$store.state.uname!=""&&this.$store.state.uid!=""){
            this.$router.go(-1);
            this.$toast("登录成功");
          }
        }
      })
    },
    // 密码隐藏与显示的切换
    pwd(){
      // 如果当前密码为隐藏状态
      if(this.showUpwd==false){
        // 就给当前的密码赋值为状态为显示
        this.showUpwd=true;
      }else{
        // 否则就给当前密码赋值为隐藏状态 
        this.showUpwd=false;
      }
    }
  }
}
</script>
<style scoped>

  /* 登录标题 */
  h3{
    font-size:1.5rem;
    margin-top:2.3rem;
    text-align: center; 
    font-weight: normal;
  }
  /* 手机及密码输入框样式---开始 */
  .txt{
    padding:0.3rem 2.1rem 0rem 2.1rem;
    width: 100%;
    height: 2.1rem;
    font-size: 1rem;
    outline: 0;
    border:0;
    border-bottom: 0.0625rem solid rgb(187, 187, 187);
    background-repeat:no-repeat;
    background-size:1.5rem 1.5rem;
    background-position:0.1875rem 0.25rem;
    margin: 0.9375rem 0;
  }
  .phone{
    background-image:url('../../public/imgs/login/phone.png');
  }
  .upwd{
    background-image:url('../../public/imgs/login/upwd.png');
  }
  /* 手机及密码输入框样式---结束 */
  /* 密码显示及隐藏样式---开始 */
  .showipwd{
    width:2rem;
    height: 2rem;
    position: absolute;
    right: 0;top:0px;
    background-repeat:no-repeat;
    background-size:1.5rem 1.5rem;
    background-position:0.1875rem 0.25rem;
    margin: 0.9375rem 0;
    z-index: 1;
  }
  .posi{
    position: relative;
    top:0rem; right:0rem;
  }
  .upwdout{
    background-image:url('../../public/imgs/login/upwd-out.png');
  }
  .upwdin{
    background-image:url('../../public/imgs/login/upwd-in.png');
  }
  /* 密码显示及隐藏样式---结束 */
  /* 登录按钮样式---开始 */
  .btn{
    margin:0.7rem 0 0.9375rem 0;
  }
  /* 登录按钮样式---结束 */
  .note{
    width: 100%;
    display: flex;
    justify-content:space-between;
    align-items: center;
  }
  
  /* 其他登录方式样式---开始 */
  .logins{
    margin:4rem 0rem 2rem 0rem;
  }
  .qq{
    background-image: url('../../public/imgs/login/qq.png');
    background-repeat: no-repeat;
  }
  .weixin{
    background-image: url('../../public/imgs/login/weixin.png');
    background-repeat: no-repeat;
  }
  .xsin{
    background-image: url('../../public/imgs/login/xsin.png');
    background-repeat: no-repeat;
  }
  .bg{
    display: inline-block;
    text-align: center;
    width: 2rem;
    height: 2rem;
  }
  .other{
    margin-top:1rem;
    margin-bottom:0.5rem;
    display: flex;
    justify-content:space-around;
    padding:0 1rem;
    align-items: center;
  }
/* 其他登录方式样式---结束 */
</style>