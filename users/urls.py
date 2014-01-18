from django.conf.urls import patterns, url

from users import views

urlpatterns = patterns('',
    url(r'^register$', views.userform, name='register'),
    url(r'^login$', views.userlogin, name='register'),
    url(r'^users_list$', views.users_list, name='users_list'),
    url(r'^bad$', views.bad, name="bad"),
)