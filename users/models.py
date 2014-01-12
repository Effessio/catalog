from django.db import models
from django.contrib.auth.models import AbstractBaseUser
# Create your models here.

class User(AbstractBaseUser):
    user_name = models.CharField(max_length=30, unique=True)
    USERNAME_FIELD = user_name

