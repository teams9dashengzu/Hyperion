from rest_framework import serializers
from rest_framework.serializers import ModelSerializer
from app01 import models
# Create your views here.


# 课程序列化
class CourseSerializers(ModelSerializer):

    course_type = serializers.CharField(source="get_course_type_display")
    level = serializers.CharField(source="get_level_display")
    status = serializers.CharField(source="get_status_display")
    sub_category = serializers.CharField(source="sub_category.name")

    class Meta:
        model = models.Course
        fields = '__all__'

# 单门课程序列化
class CourseDetailSerializer(ModelSerializer):

    course = serializers.CharField(source='course.name')
    recommend_courses = serializers.SerializerMethodField()
    teachers = serializers.SerializerMethodField()
    course_chapter = serializers.SerializerMethodField()
    price_policy = serializers.SerializerMethodField()
    often_asked_question = serializers.SerializerMethodField()

    class Meta:
        model = models.CourseDetail
        fields = ['course','hours','course_slogan','video_brief_link','why_study','what_to_study_brief',
                  'career_improvement','prerequisite','recommend_courses','teachers','course_chapter',
                  'price_policy','often_asked_question']

    # M2M字段`推荐课程`进行处理
    def get_recommend_courses(self,row):
        queryset = row.recommend_courses.all()
        return [{'id':item.id,"name":item.name} for item in queryset]

    # M2M字段`课程讲师`进行处理
    def get_teachers(self,row):
        queryset = row.teachers.all()
        return [{'id':item.id,"name":item.name} for item in queryset]
    # M2M字段`课程章节`进行处理
    def get_course_chapter(self,row):
        queryset = row.course.course_chapters.all()
        return [{'id': item.id, "name": item.name} for item in queryset]
    # 字段`价格策略`进行处理
    def get_price_policy(self,row):
        queryset = row.course.price_policy.all()
            # print(item.get_valid_period_display())
        return [{'price':item.valid_period,'周期':item.get_valid_period_display()} for item in queryset]

    # 字段`常见问题`进行处理
    def get_often_asked_question(self,row):
        queryset = row.course.asked_question.all()
        ret = []
        inner = {}
        for item in queryset:
            ret.append(dict(id=item.id,answer=item.answer,question=item.question))
        return ret



