<template>
  <div>
    <van-collapse v-model="activeNames">
      <van-collapse-item v-for="(item,i) in list" :key="i" :title="item.oder" :name="`${i}`">
        <div v-for="(ite,a) in item.joint" :key="a">
          <p @click="dian(item.oder,ite.class,ite.video,ite.add)" :class="{xuanp:xuan==ite.video,qiep:xuan==ite.video}">
            <span>·</span>{{ite.class}}
          </p>
        </div>
      </van-collapse-item>
    </van-collapse>
  </div>
</template>
<script>
export default {
  props:["oder","jilu"],
  data(){
    return{
      list:[],
      xuan:1,
      activeNames: [],
      oders:"",
      dataVideo:{},
      bobok:{},
      fuz:""
    }
  },
  watch:{
    oder(){
      if(this.oder!=""){
        this.flist();
      }
    },
    list(){
      // console.log(this.jilu)
      if(this.jilu==""){
        this.bofang();
      }else{
        this.xuan=this.jilu[0].h_video;
        this.fuzuj()
      }
    }
  },
  methods:{
    fuzuj(){
      this.fuz=this.jilu[0].h_add;
      this.$emit('fuz',this.fuz);
      var hoder=this.jilu[0].h_oder;
      var hclass=this.jilu[0].h_class;
      var hvideo=this.jilu[0].h_video;
      var hadd=this.fuz;
      this.dian(hoder,hclass,hvideo,hadd)
    },
    bofang(){
      this.bobok=this.list[0].joint[0];
      this.xuan=this.list[0].joint[0].video;
      var bobok=this.bobok;
      this.$emit("bobok",bobok)
      var hoder=this.list[0].oder;
      var hclass=bobok.class;
      var hvideo=bobok.video;
      var hadd=bobok.add;
      this.dian(hoder,hclass,hvideo,hadd)
    },
    dian(hoder,hclass,hvideo,hadd){
      this.xuan=hvideo;
      var htitle=this.oder.d_title;
      var himg=this.oder.d_img;
      var htime=new Date().getTime();
      var did=this.oder.d_id;
      var obj={htitle,hoder,hclass,hvideo,hadd,himg,htime,did};
      var url="ckeep";
      this.axios.get(url,{params:obj}).then(res=>{
        this.dataVideo={}
        this.dataVideo={hvideo,hadd}
        this.$emit('dataByVideo',this.dataVideo)
      })
    },
    flist(){
      var url=this.oder.d_json;
      this.axios.get(url).then(res=>{
        this.list=res.data;
        for(var arr in res.data){
          this.activeNames.push(`${arr}`)
          // console.log(this.activeNames)
        }
      })
    }
  }
}
</script>
<style scoped>
  *{
    padding: 0;
  }
  h4{
    margin: 0;
    padding: 5px 8px 5px 12px;
  }
  p{
    margin: 0;
    padding: 5px 8px 5px 34px;
    display: block;
    background:url('../public/imgs/broad/bo.png') no-repeat;
    background-size:18px 18px;
    background-position: 13px 6px;
  }
  .qiep{
    background:url('../public/imgs/broad/zan.png') no-repeat;
    background-size:18px 18px;
    background-position: 13px 6px;
  }
  div /deep/ .van-collapse-item__content {
    padding: 5px;
    color: rgb(124, 124, 124);
    font-size: 13px;
    line-height: 1.5;
    background-color: #fff;
  }
  .xuanp{
    color: #22A7f8
  }
</style>
