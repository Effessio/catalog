from django.db import models

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
    pub_date = models.DateTimeField('date created')
    edit_date = models.DateTimeField('date edited')

    def __unicode__(self):
        return self.name
