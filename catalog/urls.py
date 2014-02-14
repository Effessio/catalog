from django.conf.urls import patterns, include, url
from django.contrib import admin
from goods.views import index_redirect
admin.autodiscover()

urlpatterns = patterns('',
    url(r'^admin/', include(admin.site.urls)),
    url(r'^goods/', include('goods.urls')),
    url(r'^users/', include('users.urls')),
    url(r'^$', index_redirect, name='index_redirect'),
)
