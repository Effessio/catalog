from django.contrib import admin
from goods.models import Producer, Product


class ProducerAdmin(admin.ModelAdmin):
    list_display = ['name', 'moderator']


class ProductAdmin(admin.ModelAdmin):
    list_filter = ['producer','edit_date']
    fieldsets = \
        [
            ('Main fields', {'fields': ['name', 'article']}),
            ('Producer information', {'fields': ['producer', 'description']}),
        ]
    search_fields = ['name', 'producer__name']


admin.site.register(Producer, ProducerAdmin)
admin.site.register(Product,ProductAdmin)
