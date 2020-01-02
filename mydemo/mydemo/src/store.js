import Vue from 'vue'
import Vuex from 'vuex'
Vue.use(Vuex);


const state={
  uname:sessionStorage.getItem('userID'),
  uid:sessionStorage.getItem('userID')
}
const mutations={
  gai(state,params){
    state.uname=params;
  }
}
const actions={
  gai:({commit})=>{
    commit('gai')
  }
}
export default new Vuex.Store({
  state,
  mutations,
  actions
})