<template>
<div>
    <h1 class="text-center" style="margin-bottom: 100px;
    margin-top: 50px;color: blue">
        <strong>课程列表</strong>
    </h1>


    <div class="text-center" style="width: 1150px; margin:0 auto" _v-d422088a="">
        <h3>项目实战&nbsp;你的同行都在学</h3>
        <p>更全面的实战案例、更细致的讲解和课后辅导，让你的职业生涯能更轻松的完成进阶</p>
        <em style="width: 77px; border-top: 1px solid #7ED321; margin: 31px auto 78px" _v-d422088a=""></em>
    </div>
    <hr style="width:150px;height: 1px;background-color:#7ED321; ">
    <div class="row">
        <div class="container">
            <div v-for="row in courseList">
                <div v-if="row.course_type==='学位课程'">

                    <div class="col-sm-6 col-md-4">
                        <div class="thumbnail">
                            <img :src="row.course_img" alt="...">
                            <div class="caption">
                                <h3><router-link :to="{name:'courseDetail',params:{id:row.id}}"><a>{{row.name}}</a></router-link></h3>
                                <p>{{row.video_brief_link}}</p>
                                <p>{{row.level}}</p>
                                <p><a href="#" class="btn btn-primary" role="button">咨询</a> <a href="#"
                                                                                               class="btn btn-default"
                                                                                               role="button">查看</a></p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>


    <div class="text-center" style="width: 1150px; margin:0 auto" _v-d422088a="">
        <h3>精品课程&nbsp;全面提升能力</h3>
        <p>更全面的实战案例、更细致的讲解和课后辅导，让你的职业生涯能更轻松的完成进阶</p>
        <em style="width: 77px; border-top: 1px solid #7ED321; margin: 31px auto 78px" _v-d422088a=""></em>
    </div>
    <hr style="width:150px;height: 1px;background-color:#7ED321; ">
    <div class="row">
        <div class="container">
    <div v-for="row in courseList">
        <div v-if="row.course_type==='付费'">

            
                    <div class="col-sm-6 col-md-4">
                        <div class="thumbnail">
                            <img :src="row.course_img" alt="...">
                            <div class="caption">
                                <h3>{{row.name}}</h3>
                                <p>{{row.brief}}</p>
                                <p>{{row.level}}</p>
                                <p><a href="#" class="btn btn-primary" role="button">咨询</a> <a href="#"
                                                                                               class="btn btn-default"
                                                                                               role="button">查看</a></p>
                            </div>
                        </div>
                    </div>
                </div>
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
        courseList:[

        ]
      }
    },
    mounted:function () {
      // vue页面刚加载时自动执行
      this.initCourse()
    },
    methods:{
      initCourse:function () {
        /*
        this.courseList = [
          {id:1,title:'Python全栈'},
          {id:2,title:'Linux运维'},
          {id:3,title:'金融分析'},
        ]
        */


        // 通过ajax向接口发送请求，并获取课程列表
        // axios 发送ajax请求
        // npm install axios --save
        // 第一步：在main.js中配置
        // 第二步：使用axios发送请求
        var that = this

        this.$axios.request({
          url:'http://127.0.0.1:8000/api/v1/course/',
          method:"GET"
        }).then(function (ret) {
          // ajax请求发送成功后，获取的响应内容
          console.log(ret.data)
          if(ret.data.code === 1000){
            that.courseList = ret.data.data

          }
        }).catch(function (ret) {
          // ajax请求失败之后，获取响应的内容
        })



      }
    }
  }
</script>

<style scoped>

</style>
