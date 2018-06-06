import Vue from 'vue'
import Router from 'vue-router'
import HelloWorld from '@/components/HelloWorld'
import Index from '@/components/Index.vue'
import Course from '@/components/aboutCourse/Course.vue'
import Micro from '@/components/Micro.vue'
import News from '@/components/aboutNews/News.vue'
import Detail from '@/components/aboutCourse/Detail'
import Login from '@/components/Login'



Vue.use(Router)

export default new Router({
  routes: [
    {
      path: '/',
      name: 'HelloWorld',
      component: HelloWorld
    },
    {
      path: '/index',
      name: 'index',
      component: Index
    },
    {
      path: '/course',
      name: 'course',
      component: Course
    },
    {
      path: '/course/detail/:id',
      name: 'courseDetail',
      component: Detail
    },
    {
      path: '/Micro',
      name: 'micro',
      component: Micro,
      meta:{
        requireAuth:true
      }
    },
    {
      path: '/News',
      name: 'news',
      component: News
    },
    {
      path: '/login',
      name: 'login',
      component: Login
    },

  ],
  mode:'history'
})
