<template>
  <main>
    <div class="titlebar">
      <div style="width:20px;height:20px">
        <van-icon @click="revert" size="20px" name="arrow-left" />
      </div>
      <span v-if="qie">个人信息</span>
      <span v-if="!qie">修改信息</span>
      <div v-if="qie" @click="showhold">修改</div>
      <div v-if="!qie" @click="hold">保存</div>
    </div>
    <div v-if="qie" class="tong toux">
      <span>头像：</span>
      <img :src="avatar==''?'':avatar==null?'http://progmydemo.applinzi.com/img/head/gua.png':'http://progmydemo.applinzi.com/'+avatar">
    </div>
    <van-row>
      <div class="tong xinxi">
        <van-col span="6">
          <span>用户名：</span>
        </van-col>
        <van-col span="10">
          <span v-if="qie">{{uname}}</span>
          <input v-if="!qie" type="text" v-model="uname" :disabled="qie">
        </van-col>
      </div>
    </van-row>
    <van-row>
      <div class="tong xinxi">
        <van-col span="6">
          <span>性别：</span>
        </van-col>
        <van-col span="10">
          <span v-if="qie">{{sex==1?'男':sex==='0'?'女':''}}</span>
          <van-radio-group v-if="!qie" v-model="sex">
            <div class="radio">
              <van-radio name="1">男</van-radio>
              <van-radio name="0">女</van-radio>
            </div>
          </van-radio-group>
        </van-col>
      </div>
    </van-row>
    <van-row>
      <div class="tong xinxi">
        <van-col span="8">
          <span>出生年月：</span>
        </van-col>
        <van-col span="10">
          <span v-if="qie">{{birthday}}</span>
          <times v-if="!qie" @dataByTime="dataByTime" :birthday="birthday" ></times>
        </van-col>
      </div>
    </van-row>
    <van-row>
      <div class="qian">
        <van-col span="8">
          <span>个性签名：</span>
        </van-col>
        <van-col span="16">
          <textarea :disabled="qie" v-model="usign" :class="{textar:qie}" rows="6">轻轻的你走了，正如你轻轻地来。</textarea>
        </van-col>
      </div>
    </van-row>
    
  </main>
</template>
<script>
import times from './news/times'
import {mapActions} from 'vuex'
export default {
  data(){
    return {
      qie:true,
      avatar:"",
      uname:"",
      sex:"",
      birthday:"",
      usign:""
    }
  },
  components:{
    "times":times
  },
  created(){
    this.begin();
  },
  methods:{
    dataByTime(dataTime){
      this.birthday=dataTime;
    },
    begin(){
      var url="news";
      var obj={uid:5};
      var huihui={};
      this.axios.get(url,{params:obj}).then(res=>{
        huihui=res.data.data[0];
        this.avatar=huihui.avatar;
        this.uname=huihui.uname;
        this.sex=huihui.sex;
        this.birthday=huihui.birthday==""||huihui.birthday===null?"":huihui.birthday.toString();
        this.usign=huihui.usign;
      })
    },
    showhold(){
      this.$dialog.confirm({
        title: '提示信息',
        message: '是否编辑个人信息'
      }).then(() => {
        this.qie=false;
      }).catch(() => {
        // on cancel
      });
    },
    hold(){
      this.$dialog.confirm({
        title: '提示信息',
        message: '是否保存编辑'
      }).then(() => {
        var uname=this.uname;
        var sex=this.sex;
        var birthday=this.birthday;
        var usign=this.usign;
        if(!uname){
          this.$dialog.alert({
            title:"提示信息",
            message:"用户名不能为空"
          }).then(()=>{
          })
          return;
        }
        var url="revise";
        var obj={uname,sex,birthday,usign}
        this.axios.get(url,{params:obj}).then(res=>{
          if(res.data.code==0){
            this.$toast("用户名重复");
            return;
          }else if(res.data.code==1){
            this.$toast("修改成功");
            this.$store.state.uname+=1;
            this.qie=true;
          }
        })
      }).catch(() => {
        // on cancel
      });
    },
    revert(){
      if(this.qie==false){
        this.$dialog.confirm({
          title: '提示信息',
          message: '编辑内容还未保存是否退出'
        }).then(() => {
          this.$router.go(-1);
        }).catch(() => {
          // on cancel
        });
      }else{
        this.$router.go(-1);
      }
    }
  }
}
</script>
<style scoped>
   .titlebar{
    background-color: #22A7f8;
    display:flex;
    justify-content:space-between;
    align-items: center;
    padding:0.8rem 1rem;
    color: #fff;
  }
  .bg{
    display: flex;
    align-items: center;
  }
  .tong{
    width: 100%;
    display: flex;
    align-items: center;
    padding: 7px 24px;
    font-size: 16px;
    border-bottom:1px solid #E5E5E5;
    color:#686868;
  }
  .toux{
    justify-content: space-between;
  }
  .toux>img{
    width: 60px;
    height: 60px;
    border-radius: 50%;
  }
  .xinxi{
    height: 50px;
  }
  .qian{
    width: 100%;
    display: flex;
    padding: 7px 24px;
    font-size: 16px;
    color:#686868;
  }
  input{
    outline: 0;
    border:0;
    padding-top: 3px;
    width:150px;
  }
  input:disabled {
    color: rgb(84, 84, 84);
    cursor: default;
    background-color:#fff;
  }
  textarea:disabled {
      color: rgb(84, 84, 84);
      cursor: default;
      background-color: #fff;
  }
  textarea{
    height:145px;
    width:100%;
  }
  .textar{
    border-width:0;
  }
  .radio{
    display:flex;
    justify-content: space-between;
  }
</style>