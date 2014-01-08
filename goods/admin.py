from django.contrib import admin
from goods.models import Producer,Product


class ProducerAdmin(admin.ModelAdmin):
    fields = ['name','pub_date']



class ProductAdmin(admin.ModelAdmin):
    list_filter = ['producer','edit_date']
    fieldsets = [
        (None,               {'fields': ['name', 'article']}),
        ('Producer information',{'fields': ['producer', 'description']}),
     #   ('Date information', {'fields': ['pub_date','edit_date']}),
        ]
    search_fields = ['name','producer__name']





admin.site.register(Producer, ProducerAdmin)
admin.site.register(Product,ProductAdmin)
