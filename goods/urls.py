from django.conf.urls import patterns, url

from goods import views

urlpatterns = patterns('',
    url(r'^$', views.index, name='index'),
    url(r'^(?P<producer_id>\d+)/$', views.producer_list, name='producer_list'),
    url(r'^products/(?P<product_id>\d+)/$', views.description, name='description'),
    url(r'^all/$', views.all_goods, name='all_goods_list'),
    url(r'^(?P<producer_id>\d+)/add_product$', views.product_add, name='product_add'),
    url(r'^products/(?P<product_id>\d+)/edit/$', views.product_edit, name='product_edit'),
    url(r'^products/(?P<product_id>\d+)/like/$', views.product_like, name='product_like'),
    url(r'^products/(?P<product_id>\d+)/dislike/$', views.product_dislike, name='product_dislike'),
    url(r'^ajax/$', views.producer_list2, name='producer_list2'),
    url(r'^fillup/$', views.fillup, name ='fillup'),
    url(r'^new_all/$', views.all_goods_with_pages, name ='all_goods_with_pages'),

)