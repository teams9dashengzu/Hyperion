from rest_framework import serializers
from rest_framework.serializers import ModelSerializer
from app01 import models

# 文章列表序列化
class ArticleSerializers(ModelSerializer):
    position = serializers.CharField(source='get_position_display')
    pub_date = serializers.DateTimeField()
    class Meta:
        model = models.Article
        fields = ['id','title','brief','head_img','order','vid','view_num','collect_num','position','pub_date']

# 文章详情进行处理
class ArticleDetailSerializers(ModelSerializer):
    position = serializers.CharField(source='get_position_display')
    pub_date = serializers.DateTimeField()
    comment_list = serializers.SerializerMethodField()
    article_type = serializers.CharField(source='get_article_type_display')
    collect_num = serializers.SerializerMethodField()
    # collect_num = models.Collection.objects.filter(object_id=aid).all().count()
    class Meta:
        model = models.Article
        fields = ['id','title','content','head_img','order','vid',
                  'view_num','collect_num','position','pub_date','offline_date','agree_num',
                  'comment_list','article_type']

    # 文章对应评论
    def get_comment_list(self,row):
        ret = []

        for item in row.comment.all():
            # print(item)
            inner = {}
            inner['id']=item.id
            inner['name']=item.account.username
            inner['content']=item.content
            # print(type(item.p_node))
            if item.p_node is not None:
                inner['parent']=item.p_node.id
            else:
                inner['parent']=item.p_node
            # 这里好恶心，卡几个小时，在inner这个字典中总是存入相同的值，原来是因为inner建到外面所有，循环时
            # 是一个这字典，建到里面问题得以解决
            # ret.append(dict(id=item.id,content=inner))
            ret.append(inner)
        return ret

    # 文章收藏数量
    def get_collect_num(self,row):
        return row.collect.all().count()




# 评论列表序列化
class CommentSerializers(ModelSerializer):
    """"""
    class Meta:
        model=models.Comment
        fields='__all__'


# 点赞，踩，收藏，提交评论，post请求



