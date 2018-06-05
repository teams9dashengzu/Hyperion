from django.shortcuts import render
from rest_framework.views import APIView
from app01 import models
from rest_framework.response import Response
from app01.serializers.course_serializers import CourseSerializers
from app01.serializers.course_serializers import CourseDetailSerializer
from app01.serializers.price_serizlizers import PricePolicySerializers
from rest_framework.viewsets import ViewSetMixin, ModelViewSet


# Create your views here.



class CourseView(ViewSetMixin, APIView):
    # 查询所有课程信息
    def list(self, request, *args, **kwargs):
        ret = {'code': 1000, 'data': None}
        try:

            queryset = models.Course.objects.all()
            ser = CourseSerializers(instance=queryset, many=True)
            ret['data'] = ser.data
        except Exception as e:
            print(e)
            ret['code'] = 1001
            ret['error'] = '获取课程失败'

        return Response(ret)

    # 查询单条课程
    def retrieve(self, request, *args, **kwargs):


        ret = {'code': 1000, 'data': None}

        try:
            # 课程ID=4,5,7  暂时只支持这些，爱看不看,而且只有4和7有章节数据
            pk = kwargs.get('pk')
            # 课程详细对象
            obj = models.CourseDetail.objects.filter(course=pk).first()

            ser = CourseDetailSerializer(instance=obj, many=False)
            #
            ret['data'] = ser.data

        except Exception as e:
            print(e)
            ret['code'] = 1001
            ret['error'] = '获取课程失败'

        return Response(ret)


class PricePolicyView(APIView):

    def get(self,request,*args,**kwargs):

        queryset = models.PricePolicy.objects.filter(pk=1).first()
        # print(queryset.content_object,type(queryset.content_object))

        # ser = PricePolicySerializers(instance=queryset, many=True)
        obj = models.Course.objects.filter(pk=4).first()
        for foo in obj.price_policy.all():print(foo)
        return Response("...")



