from django.db import models
from django.contrib.auth.models import AbstractBaseUser, PermissionsMixin, BaseUserManager
# Create your models here.


class MyUserManager(BaseUserManager):
    def create_user(self, user_name, password):
        user = self.model(user_name=user_name,password=password)
        user.set_password(password)
        user.save(using=self._db)
        return user
    def create_superuser(self, user_name, password):
        user = self.create_user(user_name,password)
        user.is_admin = True
        user.save(using=self._db)
        return user

class User(AbstractBaseUser, PermissionsMixin):
    user_name = models.CharField(max_length=30, unique=True)
    USERNAME_FIELD = 'user_name'
    objects = MyUserManager()
    is_active = models.BooleanField(default=True)
    is_admin = models.BooleanField(default=False)
    def get_full_name(self):
        # The user is identified by their email address
        return self.user_name

    def get_short_name(self):
        # The user is identified by their email address
        return self.user_name

    # On Python 3: def __str__(self):
    def __unicode__(self):
        return self.user_name

    def has_perm(self, perm, obj=None):
        "Does the user have a specific permission?"
        # Simplest possible answer: Yes, always
        return self.is_admin

    def has_module_perms(self, app_label):
        "Does the user have permissions to view the app `app_label`?"
        # Simplest possible answer: Yes, always
        return self.is_admin

    @property
    def is_staff(self):
        return self.is_admin


from django import forms

class UserForm(forms.Form):
    user_name = forms.CharField(max_length=30)
    password = forms.CharField()
