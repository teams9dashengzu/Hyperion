from rest_framework.authentication import BaseAuthentication
from app01 import models
from rest_framework.exceptions import AuthenticationFailed

class LufAuth(BaseAuthentication):

    # 用户认证
    def authenticate(self, request):
        token = request.query_params.get('token')
        obj = models.UserAuthToken.objects.filter(token=token).first()
        print(token,obj)
        if not obj:
            raise AuthenticationFailed({'code':1001,'error':'认证失败'})
        return (obj.user.username,obj)