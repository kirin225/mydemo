import Vue from 'vue'
import App from './App'
import router from './router'
// 1.将vant和mint-ui组件引入全局
import Vant from 'vant';
// 2.单独引入vant和mint-ui的css样式
import 'vant/lib/index.css';
// 3.将axios引入全局
import axios from 'axios'
// 4.引入store到全局
import store from './store'
// import Router from 'vue-router'
// Vue.use(Router)
// const originalPush = Router.prototype.push
// Router.prototype.push = function push(location) {
//   return originalPush.call(this, location).catch(err => err)
// }

// 配置访问器基础地址
axios.defaults.baseURL="http://progmydemo.applinzi.com/"
// 将配置发送请求保存session信息
axios.defaults.withCredentials=true;
// 将axios注册vue
Vue.prototype.axios=axios;

Vue.config.productionTip = false
// 注册vant和mint-ui
Vue.use(Vant);
/* eslint-disable no-new */
new Vue({
  el: '#app',
  router,
  store,
  components: { App },
  template: '<App/>'
})
