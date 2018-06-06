from rest_framework.views import APIView
from rest_framework.response import Response
from django.shortcuts import HttpResponse
from api import models
import uuid



class AuthView(APIView):
    
    def post(self,request,*args,**kwargs):
        '''
        用户登录验证
        :param request: 
        :param args: 
        :param kwargs: 
        :return: 
        '''
        from api.tool.base_ret import BaseSet

        try:
            ret = BaseSet()
            user = request.data.get('user')
            pwd = request.data.get('pwd')

            user = models.Account.objects.filter(username=user, password=pwd).first()
            if not user:
                ret.code = 1001
                ret.error = '用户名或密码错误'
                print(ret.dict)

            uid = str(uuid.uuid4())
            models.UserAuthToken.objects.update_or_create(user=user, defaults={'token': uid})
            ret.token = uid
            print(ret.dict)
        except Exception as e:
            ret.code = 1002
            ret.error = '未知错误'
        return Response(ret.dict)


        # try:
        #     ret = {'code':1000}
        #     user = request.data.get('user')
        #     pwd = request.data.get('pwd')
        #
        #     user = models.Account.objects.filter(username=user,password=pwd).first()
        #     if not user:
        #         ret['code'] = 1001
        #         ret['error'] = '用户名或密码错误'
        #     else:
        #         uid = str(uuid.uuid4())
        #         models.UserAuthToken.objects.update_or_create(user=user,defaults={'token':uid})
        #         ret['token'] = uid
        #         print(ret)
        # except Exception as e:
        #     ret['code'] = 1002
        #     ret['error'] = '未知错误'
        # return Response(ret)
        
        
        
