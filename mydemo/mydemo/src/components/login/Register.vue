<template>
  <main>
    <h3>注册</h3>
    <van-row>
      <!-- 手机号码输入框---开始 -->
      <van-col offset="3" span="4">
        <div class="tt divspan">+86</div>
      </van-col>
      <van-col span="14">
        <input type="text" class="txt divspan" v-model="phone" placeholder="手机号码">
      </van-col>
      <!-- 手机号码输入框---结束 -->
      <!-- 密码输入框---开始 -->
      <van-col offset="3" span="4">
        <div class="divspan">密码：</div>
      </van-col>
      <van-col span="14">
        <div class="posi">
          <input :type="showUpwd?'text':'password'" class="txt divspan" v-model="upwd" placeholder="请输入密码">
          <div :class="{upwdout:!showUpwd,upwdin:showUpwd}" class="showipwd" @click="pwd"></div>
        </div>
      </van-col>
      <!-- 密码输入框---结束 -->
      <!-- 验证码区域---开始 -->
      <van-col offset="7" span="6">
        <input type="text" class="txt divspan" v-model="ypwd" placeholder="验证码">
      </van-col>
      <van-col offset="1" span="7" style="text-align:right">
        <button class="btn" :class="{jiny:btn}" :disabled="btn" @click="yzm">{{miao}}</button>
      </van-col>
      <!-- 验证码区域结束 -->
    </van-row>
    <!-- 注册按钮---开始 -->
    <div class="zhuc">
      <van-row>
        <van-col span="18" offset="3">
          <van-button color="#22A7f8" @click="reg" size="large">注册</van-button>
        </van-col>
      </van-row>
    </div>
    <!-- 注册按钮---结束 -->
  </main>
</template>
<script>
import {mapActions} from 'vuex'
export default {
  data(){
    return {
      // 手机号码
      phone:"",
      // 密码
      upwd:"",
      // 储存弹出的验证码
      yan:"",
      // 验证码输入
      ypwd:"",
      // 禁用发送验证码按钮
      btn:false,
      // 验证码按钮内容
      miao:"发送验证码",
      showUpwd:false
    }
  },
  methods:{
    // 注册请求
    reg(){
      // 获取手机号码，密码，验证码，弹出验证码
      var phone=this.phone;
      var upwd=this.upwd;
      var ypwd=this.ypwd;
      var yan=this.yan;
      // 判断手机号码不能为空
      if(!phone){
        this.$dialog.alert({title:"提示信息",message:"手机号码不能为空！"}).then(()=>{});
        return;
      }
      // 验证手机号码格式是否正确
      var phoneReg=/^1[3456789]\d{9}$/;
      if(phoneReg.test(phone)!==true){
        this.$dialog.alert({title:"提示信息",message:"手机号码格式错误！"}).then(()=>{});
        return;
      }
      // 判断密码不能为空
      if(upwd==""){
        this.$dialog.alert({title:"提示信息",message:"密码不能为空！"}).then(()=>{});
        return;
      }
      // 判断验证码不能为空
      if(!ypwd){
        this.$dialog.alert({title:"提示信息",message:"验证码不能为空！"}).then(()=>{});
        return;
      }
      // 判断输入框验证码与弹出的验证码是否一致
      if(ypwd!==yan){
        this.$dialog.alert({title:"提示信息",message:"验证码错误！"}).then(()=>{});
        return;
      }
      // 定义url及要发送的内容
      var url="register";
      var obj={phone,upwd}
      // 发送请求
      this.axios.get(url,{params:obj}).then(res=>{
        // 判断手机号码是否已注册
        if(res.data.code=="1"){
          sessionStorage.setItem('userID',res.data.data);
          this.$store.state.uname=sessionStorage.getItem('userID');
          this.$store.state.uid=sessionStorage.getItem('userID');
          if(sessionStorage.getItem('userID')!=""&&this.$store.state.uid!=""&&this.$store.state.uname!=""){
            this.$toast("注册成功");
            this.$router.go(-1);
          }
        }else{
          this.$dialog.alert({title:"提示信息",message:"手机号码已注册！"}).then(()=>{});
          this.phone="";
          this.upwd="";
          this.ypwd=""
          return;
        }
      })
    },
    // 弹出验证码
    yzm(){
      // 判断手机号码不能为空
      var phone=this.phone;
      if(!phone){
        this.$dialog.alert({title:"提示信息",message:"手机号码不能为空！"}).then(()=>{});
        return;
      }
      // 验证手机号码格式是否正确
      var phoneReg=/^1[3456789]\d{9}$/;
      if(phoneReg.test(phone)!==true){
        this.$dialog.alert({title:"提示信息",message:"手机号码格式错误！"}).then(()=>{});
        return;
      }
      // 1.定义一个空数组
      var arr=[];
      // 2.循环遍历6次每次往空数组里面添加一个值
      for(var i=1;i<7;i++){
        arr.push(Math.floor(Math.random()*10))
      }
      // 将数组转为字符并赋值给弹出的验证码内容
      this.yan=arr.join("");
      // 禁用发送验证码按钮
      this.btn=true;
      // 弹出验证码
      this.$dialog.alert({title:"验证码",message:`${this.yan}`}).then(()=>{});
      // 定义验证码60秒后才可重新发送
      var a=60;
      // 设置定时器
      var id=setInterval(res=>{
        // 每秒让a减一
        a-=1;
        // 重新定义按钮内容
        this.miao=`${a}秒后重新发送`
        // 判断当a=0时清除定时器且启用按钮，重新定义按钮内容
        if(a==0){
          clearInterval(id);
          this.btn=false;
          this.miao="发送验证码"
        }
      },1000)
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
  /* 手机，密码，验证码输入框样式---开始 */
  .txt{
    outline: 0;
    border:0;
    border-bottom: 0.0625rem solid rgb(187, 187, 187);
    background-repeat:no-repeat;
    background-size:1.5rem 1.5rem;
    background-position:0.1875rem 0.25rem;
  }
  .divspan{
    width: 100%;
    height: 2.1rem;
    font-size: 1rem;
    padding-top:0.3rem;
    margin: 0.9375rem 0;
  }
  /* 手机，密码，验证码输入框样式---结束 */
  /* 国家区号后的小图标---开始 */
  .tt{
    line-height: 1.8rem;
    background-image: url('../../public/imgs/login/more.png');
    background-repeat:no-repeat;
    background-size:1rem 1rem;
    background-position:2rem 0.6875rem;
  }
  /* 国家区号后的小图标---结束 */
  /* 发送验证码按钮样式---开始 */
  .btn{
    margin: 0.4rem 0;
    width:100%;
    height: 2.4375rem;
    font-size: 0.875rem;
    background-color:#22A7f8;
    padding:0;
    outline: 0;
    border:0;
    border-radius: 0.1875rem;
    color:#fff;
    transition: .3s;
  }
  .jiny{
    background-color:rgb(141, 205, 245);
  }
  /* 发送验证码按钮样式---结束 */
  /* 注册按钮样式 */
  .zhuc{
    margin:1.875rem 0 3.75rem 0;
  }
  /* 密码的隐藏与显示样式---开始 */
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
  .showipwd{
    width:2rem;
    height: 2rem;
    position: absolute;
    right: 0;top:0;
    background-repeat:no-repeat;
    background-size:1.5rem 1.5rem;
    background-position:0.1875rem 0.25rem;
    margin: 0.9375rem 0;
    z-index: 1;
  }
  /* 密码的隐藏与显示样式---结束 */
</style>