from django.db import models
from django.contrib.auth.models import AbstractBaseUser, \
    PermissionsMixin, BaseUserManager


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

    def __unicode__(self):
        return self.user_name

    def get_full_name(self):
        return self.user_name

    def get_short_name(self):
        return self.user_name

    def has_perm(self, perm, obj=None):
        return self.is_admin

    def has_module_perms(self, app_label):
        return self.is_admin

    @property
    def is_staff(self):
        return self.is_admin





