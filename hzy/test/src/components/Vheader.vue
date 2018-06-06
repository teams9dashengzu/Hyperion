<template>
  <div id="app">



<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#">
        <router-link to="/index">主页</router-link>
        <router-link :to="{name:'course'}">课程</router-link>
        <router-link to="/micro">微职位</router-link>
        <router-link to="/news">新闻</router-link>   
        <span v-if="this.$store.state.token">
          <a>{{this.$store.state.username}}</a>
          <a @click="logout">注销</a>
        </span>
        <span v-else>
          <router-link to="/login">登录</router-link>
        </span>
      </a>
    </div>
  </div>
</nav>

<router-view/>

  </div>
</template>

<script>
export default {
  name: 'App',
  methods:{
    logout(){
      this.$store.commit('clearToken')
    }
  }
}
</script>

<style>

</style> 