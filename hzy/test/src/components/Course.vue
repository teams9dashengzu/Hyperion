template>
  <div>
    <h1>课程列表</h1>
    
<div class="model-wrap" style="width: 1150px; margin:0 auto" _v-d422088a="">
    <h3 class="course-model-tit" _v-d422088a="">项目实战&nbsp;你的同行都在学</h3>
    <p class="course-model-dec" _v-d422088a="">更全面的实战案例、更细致的讲解和课后辅导，让你的职业生涯能更轻松的完成进阶</p>
    <em style="width: 77px; border-top: 1px solid #7ED321; margin: 31px auto 78px" _v-d422088a=""></em>
</div>
    
    <div v-for="row in courseList">
      <div style="width: 350px;float: left">
        <!--<img v-bind:src="row.course_img"/>-->
        <h3><router-link :to="{name:'detail',params:{id:row.id}}">{{row.name}}</router-link></h3>
        <p>{{row.level}}</p>
        <p>{{row.brief}}</p>
        <p>{{row.course_type}}</p>
        <p>{{row.course_img}}</p>
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
