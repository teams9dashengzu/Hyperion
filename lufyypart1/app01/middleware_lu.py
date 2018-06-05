
from django.utils.deprecation import MiddlewareMixin

class Middleware_lu(MiddlewareMixin):

    def process_response(self,request,response):
        # 添加响应头

        # 允许你的域名来获取我的数据
        # response['Access-Control-Allow-Origin'] = "*"

        # 允许你携带Content-Type请求头
        # response['Access-Control-Allow-Headers'] = "Content-Type"

        # 允许你发送DELETE,PUT
        # response['Access-Control-Allow-Methods'] = "DELETE,PUT"
        response['Access-Control-Allow-Origin'] = "*"

        if request.method == "OPTIONS":
            response['Access-Control-Allow-Headers'] = "Content-Type"
            response['Access-Control-Allow-Methods'] = "PUT,DELETE"

        return response