<template>
  <div id="app">
    <Vheader></Vheader>
    <!-- <router-link to="/index">主页</router-link>
    <router-link :to="{name:'course'}">课程</router-link>
    <router-link to="/micro">职位</router-link>
    <router-link to="/news">新闻</router-link>   
    <div v-if="this.$store.state.token">
      <a>{{this.$store.state.username}}</a>
      <a @click="logout">注销</a>
    </div>
    <div v-else >
       <router-link to="/login">登录</router-link>
    </div>

    <router-view/> -->
  </div>
</template>

<script>
import Vheader from './components/Vheader.vue'

export default {
  name: 'App',
  methods:{
    logout(){
      this.$store.commit('clearToken')
    }
  },
  components:{
    Vheader
  }
}
</script>

<style>

</style> 
