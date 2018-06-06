from rest_framework.views import APIView
from rest_framework.response import Response
from api import models
from rest_framework.viewsets import GenericViewSet, ViewSetMixin,ModelViewSet
from api.serializers.news import NewsSerializer,NewsDetailSerializer
from api.auth.auth import LuffyAuth
from rest_framework.views import APIView
from rest_framework.response import Response
from api import models



class NewsView(ViewSetMixin,APIView):
    
    def list(self,request,*args,**kwargs):
        ret = {'code': 1000, 'data': None}

        try:
            queryset = models.Article.objects.all()
            print(queryset)
            ser = NewsSerializer(instance=queryset, many=True)
            
            ret['data'] = ser.data
        except Exception as e:
            ret['code'] = 1001
            ret['error'] = '获取新闻失败'

        print('收到一大波新闻请求')
        return Response(ret)

    
    def retrieve(self,request,*args,**kwargs):
        ret = {'code': 1000, 'data': None}

        try:
            pk = kwargs.get('pk')

            obj = models.Article.objects.filter(id=pk).first()
            print(obj)

            ser = NewsDetailSerializer(instance=obj, many=False)
            # print('新闻详情', ser.data)
            ret['data'] = ser.data

        except Exception as e:
            ret['code'] = 1001
            ret['error'] = '获取新闻详情失败'

        print('收到一个新闻详情请求')
        return Response(ret)

    
    