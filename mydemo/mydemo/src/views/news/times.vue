<template>
   <div class="hello">
      <span @click="showDataTime" style="display:inline-block;width:100%;">{{birthday==''||birthday===null?'请选择':birthday}}</span>
      <van-action-sheet v-model="showTime">
         <van-datetime-picker
         v-model="currentDate"
         :formatter="formatter"
         type="date"
         :min-date="minDate"
         :max-date="maxDate"
         @confirm="confirm"
         @cancel="cancel"
         />
      </van-action-sheet>
    </div>
</template>
<script>
export default {
   data() {
      return {
         showTime:false,
         dataTime: '请选择时间',
         currentDate:"",
         minDate: new Date(1877,1,1),
         maxDate: new Date(),
      }
   },
   props:["birthday"],
   created(){
      
   },
   methods: {
      // 处理控件显示的时间格式
      formatter(type, value) {
         // 格式化选择器日期
         if (type === 'year') {
            return `${value}年`
         } else if (type === 'month') {
            return `${value}月`
         } else if (type === 'day') {
            return `${value}日`
         } 
         return value
      },
      confirm(d) {
         this.showTime=false
         this.dataTime=d.getFullYear()+'-'+(Number(d.getMonth())+1)+'-'+d.getDate();
         this.$emit('dataByTime',this.dataTime)
         // this.starttime1 = new Date(this.currentDate).getTime() / 1000
      },
      cancel() {
         this.showTime = false
      },
      showDataTime() {
         if(this.birthday===null){
            console.log(this.birthday)
            this.currentDate=new Date()
         }else{

            var arr=this.birthday.split("-");
            this.currentDate=new Date(arr)
            this.showTime = true
         }
      },
   }
}
</script>