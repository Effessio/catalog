from django.http import HttpResponse
from goods.models import Producer, Product
from django.template import RequestContext, loader
from django.shortcuts import render, get_object_or_404


def index(request):
    producer_list = Producer.objects.order_by('-pub_date')[:5]
    template = loader.get_template('catalog/index.html')
    context = RequestContext(request, {
        'producers_list': producer_list,
    })
    return HttpResponse(template.render(context))


def producer_list(request, producer_id):
    producer = get_object_or_404(Producer, pk=producer_id)
    return render(request, 'goods/producer_list.html', {'producer': producer})


def description(request, product_id):
    product = get_object_or_404(Product, pk=product_id)
    return render(request, 'goods/description.html', {'product': product})


def all_goods(request):
    product_list = Product.objects.all()
    return render(request, 'goods/all_goods_list.html', {'product_list': product_list})
