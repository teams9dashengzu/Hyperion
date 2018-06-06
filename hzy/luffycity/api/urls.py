from django.conf.urls import url, include

from api.views import course,account,news

urlpatterns = [
    # 课程相关
    url(r'^course/$', course.CourseView.as_view({'get': 'list'})),

    url(r'^course/detail/(?P<pk>\d+)/$', course.CourseView.as_view({'get': 'retrieve'})),

    url(r'^auth/$', account.AuthView.as_view()),
    # url(r'^micro/$', course.MicroView.as_view()),
    
    # 深科技相关
    url(r'news/$',news.NewsView.as_view({'get':'list'})),

    url(r'news/detail/(?P<pk>\d+)/$',news.NewsView.as_view({'get':'retrieve'}))
]
