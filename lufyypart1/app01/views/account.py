from rest_framework.views import APIView
from app01 import models
import uuid
from rest_framework.response import Response

class AuthView(APIView):
    ""
    def post(self,request,*args,**kwargs):
        # 用户登录认证
        ret = {'code':1000}
        username = request.data.get('username')
        password = request.data.get('password')

        user = models.Account.objects.filter(username=username, password=password).first()
        if not user:
            # 用户名或密码错误
            ret['code'] = 1001
            ret['error'] = '用户名或密码错误'
        else:
            # 生成uuid 保存至token中
            uid = str(uuid.uuid4())
            models.UserAuthToken.objects.update_or_create(user=user, defaults={'token': uid})
            ret['token'] = uid
        return Response(ret)