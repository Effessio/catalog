from goods.models import Product,Producer
from django.forms import ModelForm


class ProductForm(ModelForm):
    class Meta:
        model = Product
        fields = ['article', 'name', 'description']

