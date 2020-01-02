<template>
  <main>
    <div class="titlebar">
      <div @click="quxiao">取消</div>
      <span>发帖</span>
      <div @click="fasong">发送</div>
    </div>
    <div class="text">
      <div>
        <div>标题：</div>
        <div><textarea cols="30" v-model="title" rows="2"></textarea></div>
      </div>
      <div>
        内容：
        <div><textarea cols="30" v-model="text" rows="10"></textarea></div>
      </div>
    </div>
  </main>
</template>
<script>
export default {
  data(){
    return {
      title:"",
      text:"",
      uid:""
    }
  },
  created(){
    this.vuex()
  },
  watch:{
    '$store.state.uid'(){
      this.$store.state.uid=sessionStorage.getItem('userID');
      this.uid=sessionStorage.getItem('userID');
    }
  },
  methods:{
    vuex(){
      this.uid=sessionStorage.getItem('userID');
      if(!this.uid){
        this.$router.push("/Login")
      }
    },
    fasong(){
      var title=this.title;
      var text=this.text;
      // var 
    },
    quxiao(){
      if(this.title==""&&this.text==""){
        this.$router.go(-1)
      }else{
        this.$dialog.confirm({
          title: '信息提醒',
          message: '是否关闭发贴页面'
        }).then(() => {
          // on confirm
          this.$router.go(-1)
        }).catch(() => {
          // on cancel
        });
      }
    },
    fasong(){
      var title=this.title;
      var text=this.text;
      if(!title){
        this.$toast("标题不能为空");
        return;
      }
      if(!text){
        this.$toast("内容不能为空");
        return;
      }
      var url="fatie";
      var time=new Date().getTime();
      var obj={title,text,time}
      this.axios.get(url,{params:obj}).then(res=>{
        if(res.data.code==1){
          this.$toast("发表成功");
          console.log(res)
          this.$router.go(-1);
        }
      })
    }
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
    color: #fff;
  }
  textarea{
    width:100%;
    border-radius: 4px;
    padding: 9px;
    margin: 6px 0 ;
  }
  .text{
    padding:9px;
  }
</style>