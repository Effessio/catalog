from django.conf.urls import patterns, url
from users import views

urlpatterns = patterns('',
    url(r'^register$', views.user_form, name='register'),
    url(r'^login$', views.user_login, name='user_login'),
    url(r'^logout$', views.user_logout, name='user_logout'),
    url(r'^users_list$', views.users_list, name='users_list'),
    url(r'^bad$', views.bad, name="bad"),
     url(r'^wishlist/$', views.user_wishlist, name='user_wishlist'),
)