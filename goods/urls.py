from django.conf.urls import patterns, url

from goods import views

urlpatterns = patterns('',
    url(r'^$', views.index, name='index'),
    url(r'^(?P<producer_id>\d+)/$', views.detail, name='detail'),
)