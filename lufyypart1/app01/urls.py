from django.conf.urls import url
from app01.views import course,account,article

urlpatterns = [
    # 课程列表
    url(r'^course/$',course.CourseView.as_view({'get':'list'})),
    # 课程详细
    url(r'^course/(?P<pk>\d+)/$', course.CourseView.as_view({'get':'retrieve'})),
    # url(r'^pricepolicy/$',course.PricePolicyView.as_view()),

    # 用户登录
    url(r'^auth/$',account.AuthView.as_view()),
    # 文章列表
    url(r'^article/$',article.ArticleView.as_view({'get':'list'})),
    # 文章详细，文章评论
    url(r'^article/(?P<pk>\d+)/$',article.ArticleView.as_view({'get':'retrieve'})),
    # 评论
    url(r'^comment/$',article.CommentView.as_view()),
    # 添加收藏
    url(r'^collection/$',article.CollectionView.as_view()),
    # 赞或踩
    url(r'^agreeOrNot/$',article.AgreeOrNotView.as_view()),
    # url(r'^comment/$',article.CommentView.as_view({'get':list})),
]