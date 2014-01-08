from django.db import models
import datetime
from django.utils import timezone

# Create your models here.

class Producer(models.Model):
    name = models.CharField(max_length=50)
    pub_date = models.DateTimeField('date published')

    def __unicode__(self):
        return self.name


class Product(models.Model):
    article = models.CharField(max_length=10)
    name = models.CharField(max_length = 50)
    description = models.CharField(max_length=400)
    producer = models.ForeignKey(Producer)
    pub_date = models.DateTimeField('date created', default=('2000-01-01T01:00:00.000000'))
    edit_date = models.DateTimeField('date edited')

    def save(self):
        if self.pub_date== '2000-01-01T01:00:00.000000':
            self.pub_date = timezone.now()
        self.edit_date = timezone.now()
        super(Product, self).save()


    def __unicode__(self):
        return self.name
