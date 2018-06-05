from rest_framework.viewsets import ViewSetMixin
from rest_framework.views import APIView
from app01 import models
from app01.serializers.article_serializers import ArticleSerializers,ArticleDetailSerializers,CommentSerializers
from rest_framework.response import Response
from app01.auth.auth import LufAuth
from django.contrib.contenttypes.models import ContentType
from django.db import transaction

class ArticleView(ViewSetMixin,APIView):
    # 对全部文章进行显示
    def list(self, request, *args, **kwargs):

        ret = {'code':1000,'data':None}
        try:
            article = models.Article.objects.all()
            ser = ArticleSerializers(instance=article,many=True)
            ret['data']=ser.data
        except Exception as e:
            print(e)
            ret['code']=1001
            ret['error']='获取文章失败'

        return Response(ret)

    # 单文章进行显示
    def retrieve(self,request,*args,**kwargs):

        ret = {'code':1000,'data':None}

        pk = kwargs.get('pk')
        article_obj = models.Article.objects.filter(pk=pk).first()

        # print(models.Collection.objects.filter(object_id=article_obj.id).all().count())

        ser = ArticleDetailSerializers(instance=article_obj,many=False)
        ret['data'] =  ser.data

        return Response(ret)

# 评论相关操作
class CommentView(APIView):
    authentication_classes = [LufAuth,]
    def get(self,request,*args,**kwargs):

        comment = models.Comment.objects.all()
        ser = CommentSerializers(instance=comment,many=True)
        return Response(ser.data)

    # 提交评论
    def post(self,request,*args,**kwargs):

        ret={'code':1000,'state':False}
        token = request.query_params.get('token','')
        article_type = request.data.get('article_type')
        article_type = 'article' if  article_type == '资讯' else ''
        article_id = request.data.get('id')
        parent_id = request.data.get('parent_id')
        content = request.data.get('content')
        user = models.UserAuthToken.objects.filter(token=token).first().user
        # 事件回滚
        try:
            with transaction.atomic():
                comment = models.Comment.objects.create(
                    content_type=ContentType.objects.get(model=article_type),
                    object_id=article_id,
                    p_node_id=parent_id,
                    content=content,
                    account=user
                )
                ret['state']=True
        except Exception as e:
            print(e)
            ret['code']=1001
            ret['error']='添加信息时发生错误'

        return Response(ret)


class CollectionView(APIView):
    authentication_classes = [LufAuth,]
    # 添加收藏方法，一个用户对一篇文章只能收藏一次，不可重复
    def post(self,request,*args,**kwargs):
        ret = {'code':1000,'state':False}
        token = request.query_params.get('token', '')
        article_type = request.data.get('article_type')
        article_type = 'article' if article_type == '资讯' else ''
        article_id = request.data.get('id')
        user = models.UserAuthToken.objects.filter(token=token).first().user
        try:
            with transaction.atomic():
                models.Collection.objects.create(
                    content_type=ContentType.objects.get(model=article_type),
                    object_id=article_id,
                    account=user
                )
                ret['state']=True
        except Exception as e:
            print(e)
            ret['code']=1001

        return Response(ret)


class AgreeOrNotView(APIView):
    authentication_classes = [LufAuth,]
    def post(self,request,*args,**kwargs):

        ret = {'code':1000,'state':False}
        is_up = request.data.get('is_up')
        article_id = request.data.get('id')
        token = request.query_params.get('token', '')
        user = models.UserAuthToken.objects.filter(token=token).first().user
        print(is_up,type(is_up))
        try:

            ''''''
        except Exception as e:
            print(e)
            ret['code']=1001
            ret['state']=False


        return Response('...')
# def poll(request):
#     """
#     点赞操作
#     :param request:
#     :return:
#     """
#     # ret两个键值对
#     #   1.state：操作是否成功,True正常操作，False异常操作
#     #   2.flag:操作是否成功,True赞操作，False灭操作
#     ret = {'state': False,'flag':False}
#     is_up = request.POST.get("is_up")
#     # 取出的is_up为布尔值，需要转换
#     is_up = json.loads(is_up)
#
#     article_id = request.POST.get("article_id")
#
#     # 用户ID可以直接取当前用户ID
#     user_id = request.user.pk
#
#     try:
#         # 添加事务
#         with transaction.atomic():
#             # 向点赞表中添加数据，
#             # 如果用户点赞,更新文章表up_count字段
#             # 如果用户点灭,更新文章表down_count字段
#             models.ArticleUpDown.objects.create(article_id=article_id, user_id=user_id, is_up=is_up)
#             if is_up:
#                 # 返回值为影响的行数
#                 c = models.Article.objects.filter(pk=article_id).update(up_count=F("up_count") + 1)
#                 ret['flag'] = True
#             else:
#                 c = models.Article.objects.filter(pk=article_id).update(down_count=F("down_count") + 1)
#
#             ret['state'] = True
#
#     except Exception as e:
#         print(e)
#         ret['flag'] = models.ArticleUpDown.objects.filter(article_id=article_id, user_id=user_id).first().is_up
#
#     return JsonResponse(ret)




