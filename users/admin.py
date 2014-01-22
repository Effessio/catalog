from django.contrib import admin
from users.models import User


class UserAdmin(admin.ModelAdmin):
    fields = ['user_name', 'password']


admin.site.register(User,UserAdmin)