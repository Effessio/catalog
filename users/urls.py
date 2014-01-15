from django.conf.urls import patterns, url

from users import views

urlpatterns = patterns('',
    url(r'^login$', views.userform, name='login'),
    url(r'^users_list$', views.users_list, name='users_list'),
)