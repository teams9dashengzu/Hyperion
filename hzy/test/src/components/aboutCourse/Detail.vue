<template>
  <div>
    <h1>课程详细页面</h1>
    <div>

      <div class="row">
        <div class="container">
          <div class="text-center">
              <span>{{detail.course_type}}</span>
              <h3 style="margin-top: 32px;margin-bottom: 43px">{{detail.name}}</h3>
              
              <span>{{detail.course_slogan}}</span>
              <h4>这里放一个视频链接地址</h4>
              <hr>
          </div>
        </div>
      </div>
      
      <div class="row">
        <div class="container">
          <div class="col-sm-6 col-sm-offset-3">
            <ul class="nav nav-tabs nav-justified">
            <li role="presentation" class="active" v-on:click="switch1"><a href="#">课程概述</a></li>
            <li role="presentation" v-on:click="switch2"><a href="#">常见问题</a></li>
            </ul>
          </div>
        </div>
      </div>
      
      <div class="row course-info">
        <div class="container">
          <div class="text-center">
              <h2 style="margin-top: 70px">课程概述</h2>
              <p>{{detail.brief}}</p>
              <p><strong>{{detail.level}}</strong></p>

             
                 <div class="row">
                  <div class="container">
                      <div>
                        <ul v-for="period in periods">
                          <li class="course-li">
                            <p>$  {{detail.price_policy[0].price}}</p>
                            {{period}}
                            
                          </li>
                        </ul>
                      </div>
                  </div>              
                 </div>
                     
                     
                
              
              
              
                    <p>{{detail.why_study}}</p>
                    <p>{{detail.what_to_study_brief}}</p>
                    <p>{{detail.teachers[0].name}}</p>
                    <p>{{detail.teachers[0].讲师简介}}</p>
                    <hr>
              

              
          </div>
        </div>
      </div>

      <div class="course-question row my-display" >
        <div class="container">
            <h3 style="margin-bottom: 50px">课程常见问题</h3>
            <p style="margin-bottom: 20px">Q:{{detail.asked_question[0].question}}</p>
            <p>A:{{detail.asked_question[0].answer}}</p>
        </div>
        
      </div>

      

      

    </div>
  </div>
</template>

<script>


export default {
  name: "index",
  data() {
    return {
      periods:['有效期1个月','有效期2个月','有效期3个月','有效期4个月'],
      detail:{
        name:null,
        course_type:null,
        course_slogan:null,
        video_brief_link:null,
        brief:null,
        level:null,
        why_study:null,
        what_to_study_brief:null,
        title:null,
        teachers:null,
        price_policy:null,
        asked_question:null,
      }
    }
  },
  mounted(){
    var nid = this.$route.params.id
    this.initDetail(nid)
  },
  methods:{
    initDetail(nid){

      var that = this
      this.$axios.request({
        url:'http://127.0.0.1:8000/api/v1/course/detail/'+ nid +'/',
        method:'GET'
      }).then(function (arg) {
        if(arg.data.code === 1000){
          that.detail = arg.data.data
        }else{
          alert(arg.data.error)
        }
      })
    },
    changeDetail(id){
      this.initDetail(id)
      this.$router.push({name:'detail',params:{id:id}})
    },
    switch2(){
      var obj1 = this.$(".course-info");
      var obj2 = this.$(".course-question")
      obj1.addClass("my-display");
      obj2.removeClass("my-display")
     
    },
    switch1(){
      var obj1 = this.$(".course-info");
      var obj2 = this.$(".course-question")
      obj1.removeClass("my-display");
      obj2.addClass("my-display")
    }
  },
}
</script>

<style scoped>

.course-li {
  float: left;
  list-style:none;

  width: 160px;
  height: 112px;
  border: 1px solid #979797;
  cursor: pointer;
  margin-right: 60px;
  margin-bottom: 60px;
  padding:30px;
}

.my-display {
  display: none;
}

</style>