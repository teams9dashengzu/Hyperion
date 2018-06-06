from api import models

from rest_framework import serializers
from api import models

class NewsSerializer(serializers.ModelSerializer):
    '''
    新闻序列化
    '''
    source = serializers.CharField(source='source.name')
    article_type = serializers.CharField(source='get_article_type_display')
    status = serializers.CharField(source='get_status_display')
    position = serializers.CharField(source='get_position_display')

    
    class Meta:
        model = models.Article
        fields = ['title','source','article_type','brief','head_img',
                  'pub_date','offline_date','status','order','vid','comment_num',
                  'agree_num','view_num','collect_num','date','position']
        
        
class NewsDetailSerializer(serializers.ModelSerializer):
    '''
    新闻详情序列化
    '''
    source = serializers.CharField(source='source.name')



    comment = serializers.SerializerMethodField()

    
    class Meta:
        model = models.Article
        fields = ['title','source','content',
                  'view_num','agree_num','collect_num',
                  'comment']

    def get_comment(self,obj):

        queryset = obj.comment.all()

        return [{'object_id': row.object_id,
                 'content': row.content,
                 'p_node': row.p_node,
                 'account': row.account.username,
                 'disagree_number': row.disagree_number,
                 'agree_number': row.agree_number,
                 'date': row.date
                 } for row in queryset]
