from api import models

from rest_framework import serializers

class CourseSerializer(serializers.ModelSerializer):
    '''
    课程序列化
    '''
    level = serializers.CharField(source='get_level_display')
    course_type = serializers.CharField(source='get_course_type_display')
    video_brief_link = serializers.CharField(source='coursedetail.video_brief_link')
    class Meta:
        model = models.Course
        fields = ['id','name','brief','course_img','level','course_type',
                  'video_brief_link']
        
        
class CourseDetailSerializer(serializers.ModelSerializer):
    '''
    课程详细序列化
    '''
    

    name = serializers.CharField(source='course.name')

    sub_category = serializers.CharField(source='course.sub_category')

    course_img = serializers.CharField(source='course.course_img')
    course_type = serializers.CharField(source='course.get_course_type_display')
    degree_course = serializers.CharField(source='course.degree_course')
    brief = serializers.CharField(source='course.brief')
    level = serializers.CharField(source='course.get_level_display')
    pub_date = serializers.CharField(source='course.pub_date')
    period = serializers.CharField(source='course.period')
    order = serializers.CharField(source='course.order')
    attachment_path = serializers.CharField(source='course.attachment_path')
    status = serializers.CharField(source='course.get_status_display')
    template_id = serializers.CharField(source='course.template_id')



    # 多对多
    recommends = serializers.SerializerMethodField()
    teachers = serializers.SerializerMethodField()
    price_policy = serializers.SerializerMethodField()
    asked_question = serializers.SerializerMethodField()


    class Meta:
        model = models.CourseDetail
        fields = ['name','hours','course_slogan','video_brief_link',
                  'why_study','what_to_study_brief','career_improvement',
                  'prerequisite','recommends','teachers','course_img','course_type',
                  'degree_course','brief','level','pub_date','period',
                  'order','attachment_path','status','template_id',
                  'sub_category','price_policy','asked_question']
        
    def get_recommends(self,obj):
        # 获取推荐的所有课程
        queryset = obj.recommend_courses.all()

        return [{'id':row.id,'title':row.name} for row in queryset]
    
    def get_teachers(self,obj):
        # 获取课程的所有讲师
        queryset = obj.teachers.all()

        return [{'name':row.name,'讲师简介':row.brief} for row in queryset]

    def get_price_policy(self,obj):
        # 获取课程的价格策略
        queryset = obj.course.price_policy.all()

        return [{'object_id':row.object_id,'price':row.price} for row in queryset]

    def get_asked_question(self,obj):
        # 获取课程的常见问题
        queryset = obj.course.asked_question.all()

        return [{'object_id':row.object_id,'question':row.question,'answer':row.answer} for row in queryset]




    
    
    
    
    
    
    