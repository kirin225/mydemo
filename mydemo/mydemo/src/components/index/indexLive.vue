<template>
  <main>
    <div style="padding:1px 5px 5px">
      <div class="video" v-for="(item,i) in list" :key="i">
        <video width="100%" controls object-fit="contain" style="vertical-align: middle;" src="http://progmydemo.applinzi.com/video/videos.mp4"></video>
        <div class="title">
          <div class="touxi">
            <div class="tou"></div>
            <span>{{item.uname}}</span>
          </div>
          <div class="biao">{{item.title}}</div>
          <div class="gongneng">
            <div class="zandiv"><div class="zan"></div><span>{{item.zan}}</span></div>
            <div class="pingdiv"><div class="ping"></div><span>{{item.ping}}</span></div>
          </div>
        </div>
      </div>
    </div>
  </main>
</template>
<script>
export default {
  data(){
    return {
      list:[
        {uname:"东哥",title:"vue.js",zan:"666",ping:"999"},
        {uname:"亮哥",title:"node.js",zan:"541",ping:"504"},
        {uname:"然哥",title:"html+css",zan:"234",ping:"711"},
        {uname:"涛哥",title:"mint-ui",zan:"732",ping:"111"},
        {uname:"小新",title:"angular",zan:"232",ping:"2937"}
      ]
    }
  }
}
</script>
<style scoped>
  .video{
    width:100%;
    margin-top: 4px;
    padding: 4px;
    border-radius: 4px;
    overflow: hidden;
    background-color: #f3f3f3;
    vertical-align: middle;
  }
  .title{
    width: 100%;
    padding: 6px 6px 1px;
    display:flex;
    justify-content: space-between;
    align-items: center;
  }
  .touxi{
    display:flex;
    justify-content: space-between;
    align-items: center;
  }
  .touxi>span{
    font-size: 18px;
  }
  .tou{
    width: 42px;
    height: 42px;
    background-image: url('../../assets/pic/头像.jpg');
    background-size: 100%;
    background-repeat: no-repeat;
    border-radius: 50%;
    margin-right: 7px;
  }
  .biao{
    padding:3px 5px;
    border-radius: 4px;
    background-color:#c9c9c9
  }
  .gongneng{
    display: flex;
    align-items: center;
  }
  .zandiv{
    display: flex;
    align-items: center;
    margin-right: 17px;
  }
  .zan{
    width: 25px;
    height: 25px;
    background-image: url('../../public/imgs/index/zan.png  ');
    background-size: 100%;
    background-repeat: no-repeat;
  }
  .pingdiv{
    display: flex;
    align-items: center;
  }
  .ping{
    width: 25px;
    height: 25px;
    background-image: url('../../public/imgs/index/ping.png  ');
    background-size: 100%;
    background-repeat: no-repeat;
  }
</style>