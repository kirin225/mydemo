import Vue from 'vue'
import Router from 'vue-router'
import Index from '@/components/Index'
import Login from '@/components/Login';
import Search from '@/views/Search';
import News from '@/views/News';
import Broad from '@/views/Broad';
import Keep from '@/components/index/Keep'
import Coll from '@/components/index/Coll'
import Down from '@/components/index/Down'
import DropdownMenu from '@/components/DropdownMenu'; 
import searchli from '@/components/searchli'
import indexLive from '@/components/index/indexLive'
import Fatie from '@/views/Fatie'
import pinlun from '@/views/pinlun'


Vue.use(Router);

export default new Router({
  // mode:'history',
  routes: [
    {path: '/pinlun',component: pinlun},
    {path: '/Fatie',component: Fatie},
    {path: '/indexLive',component: indexLive},
    {path: '/searchli',component: searchli,meta:{keepAlive:true}},
    {path: '/Down',component: Down},
    {path: '/Coll',component: Coll},
    {path: '/Keep',component: Keep},
    {path: '/Broad',name:'/Broad',component: Broad},
    {path: '/Search',component: Search},
    {path: '/News',component: News},
    {path: '/DropdownMenu',component:DropdownMenu},
    {path: '/Login',component: Login},
    {path: '/',component: Index,meta:{keepAlive:true}},
  ]
})
