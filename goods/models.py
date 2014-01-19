from django.db import models
import datetime
from django.utils import timezone
from users.models import User

# Create your models here.

class Producer(models.Model):
    name = models.CharField(max_length=50)
    moderator = models.OneToOneField(User, blank=True, null=True)
    pub_date = models.DateTimeField('date published')

    def __unicode__(self):
        return self.name
    def get_absolute_url(self):
        return '/goods/products/%s/' % self.id


class Product(models.Model):
    article = models.CharField(max_length=10)
    name = models.CharField(max_length = 50)
    description = models.CharField(max_length=400)
    producer = models.ForeignKey(Producer)
    pub_date = models.DateTimeField('date created', auto_now_add=True)
    edit_date = models.DateTimeField('date edited', auto_now=True)

    def __unicode__(self):
        return self.name
