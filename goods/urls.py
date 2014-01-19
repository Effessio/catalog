from django.conf.urls import patterns, url

from goods import views

urlpatterns = patterns('',
    url(r'^$', views.index, name='index'),
    url(r'^(?P<producer_id>\d+)/$', views.producer_list, name='producer_list'),
    url(r'^products/(?P<product_id>\d+)/$', views.description, name='description'),
    url(r'^all/$', views.all_goods, name='all_goods_list'),
    url(r'^(?P<producer_id>\d+)/addproduct$', views.addproduct, name='addproduct'),

)