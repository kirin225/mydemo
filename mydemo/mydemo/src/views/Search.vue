<template>
  <main>
    <div class="guding">
      <van-row>
        <van-col offset="1" span="19">
          <div class="res">
            <input class="inputs" v-model="text" v-focus type="text" @keyup.enter="searchtiao(text)"  maxlength="18">
            <div v-if="text!==''" @click="del" class="del"></div>
          </div>
        </van-col>
        <van-col style="line-height:2.125rem" offset="1" span="3">
          <router-link class="quxiao" to="/">取消</router-link>
        </van-col>
      </van-row>
    </div>
    <ul class="neirong">
      <li class="snei" v-for="(item,i) of list" :key="i" @click="searchtiaoli(item.d_title)">
        <span class="dtitle">{{item.d_title}}</span>
      </li>
    </ul>
    <div class="lieb" v-if="list==''">{{text!==""?`未搜索到与${text}的相关内容`:"请输入要搜索的内容"}}</div>
  </main>
</template>
<script>
export default {
  data(){
    return {
      text:"",
      list:"",
      timer:"",
      yin:true,
      ce:""
    }
  },
  directives: {
    focus: {
      // 指令的定义
      inserted: function (el) {
        el.focus()
      }
    }
  },
  watch:{
    text(){
      if(this.text!==""){
        this.search();
      }else{
        this.list=""
      }
    }
  },
  methods:{
    searchtiaoli(i){
      this.$router.push({path:"/searchli",query:{text:i}})
    },
    searchtiao(i){
      this.$router.push({path:"/searchli",query:{text:i}})
    },
    del(){
      this.text="";
    },
    search(){
      var search=this.text;
      var url="sear";
      var obj={search}
      clearTimeout(this.timer)
      this.timer = setTimeout(()=>{
      this.axios.get(url,{params:obj}).then(res=>{
        if(res.data.data!==[]){
          if(this.text!==""){
            this.list=res.data.data;
          }else{
            this.list=""
          }
        }
      })
      }, 400)
    }
  }
}
</script>
<style scoped>
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
    position: absolute;
    top:0;left: 0;
  }
  .res{
    position: relative;
  }
  .del{
    width: 1.3125rem;
    height: 1.3125rem;
    background-image: url('../public/imgs/index/del.png');
    background-repeat: no-repeat;
    background-size: 1.3125rem 1.3125rem;
    position: absolute;
    right:0.8125rem;
    top: 0.4375rem;
  }
  .neirong{
    margin-top:3.75rem;
  }
  .quxiao{
    color: #fff
  }
  .snei{
    width: 100%;
    height: 3.0625rem;
    line-height: 3.0625rem;
    border-bottom: 0.0625rem solid #E5E5E5;
    background-image: url('../public/imgs/index/searchtxt.png');
    background-repeat: no-repeat;
    background-size:1.3125rem 1.3125rem;
    background-position:1.4375rem 1.125rem; 
    padding-left: 3.3125rem;
    color: #707070;
    padding-top:0.3125rem;
  }
  .lieb{
    padding:1.875rem;
    width: 100%;
    text-align: center;
    color:#707070;
  }
  .dtitle{
    overflow: hidden;
    display: -webkit-box;
    -webkit-line-clamp: 1;
    text-overflow: ellipsis;
    -webkit-box-orient: vertical;
  }
</style>