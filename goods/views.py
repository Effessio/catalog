from django.http import HttpResponse, HttpResponseRedirect
from goods.models import Producer, Product
from django.template import RequestContext, loader
from django.contrib.auth.decorators import login_required
from django.shortcuts import render, get_object_or_404
from goods.forms import ProductForm


def index(request):
    producers_list = Producer.objects.order_by('-pub_date')[:5]
    template = loader.get_template('catalog/index.html')
    context = RequestContext(request, {
        'producers_list': producers_list,
    })
    return HttpResponse(template.render(context))


def producer_list(request, producer_id):
    producer = get_object_or_404(Producer, pk=producer_id)
    return render(request, 'goods/producer_list.html', {'producer': producer})


def description(request, product_id):
    product = get_object_or_404(Product, pk=product_id)
    return render(request, 'goods/product_details.html', {'product': product})


def all_goods(request):
    product_list = Product.objects.all()
    return render(request, 'goods/all_goods_list.html', {'product_list': product_list})


@login_required(login_url='/users/login')
def product_add(request, producer_id):
    producer = get_object_or_404(Producer, pk=producer_id)
    if producer.moderator == request.user:
        if request.method == 'POST':
            form = ProductForm(request.POST)
            if form.is_valid():
                product = form.save(commit=False)
                product.producer = producer
                product.save()
                return HttpResponseRedirect(product.get_absolute_url())
        else:
            form = ProductForm()
            return render(request, 'goods/add_product.html', {'form': form})
    else:
        error_message = "you don't have permission to access this page"
        return render(request, 'goods/authorization_error.html', {'error_message': error_message})


@login_required(login_url='/users/login')
def product_edit(request,product_id):
    product = get_object_or_404(Product, pk=product_id)
    if product.producer.moderator == request.user:
        if request.method == 'POST':
            form = ProductForm(request.POST)
            if form.is_valid():
                product.article = form.cleaned_data['article']
                product.name = form.cleaned_data['name']
                product.description = form.cleaned_data['description']
                product.save()
                return HttpResponseRedirect(product.get_absolute_url())
        else:
            form = ProductForm(instance=product)
            return render(request, 'goods/add_product.html', {'form': form})
    else:
        error_message = "you don't have permission to access this page"
        return render(request, 'goods/authorization_error.html', {'error_message': error_message})
