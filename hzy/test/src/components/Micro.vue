<template>
  <div>
    <h1>{{msg}}</h1>
    
  </div>
</template>

<script>
  export default {
    name: "index",
    data() {
      return {
        title:null
      }
    },
    mounted(){
      this.initMicro()
    },
    methods:{
      initMicro(){
        var that = this
        this.$axios.request({
          url:this.$store.state.apiList.micro,
          method:'GET',
          params:{
            token:this.$store.state.token
          }
        }).then(function (arg) {
          if(arg.data.code === 1000){
            that.title = arg.data.title
          }
        })

      }
    }
  }
</script>

<style scoped>

</style> 