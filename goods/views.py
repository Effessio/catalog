from django.http import HttpResponse, HttpResponseRedirect
from django.core.paginator import Paginator
from goods.models import Producer, Product
from django.template import RequestContext, loader
from django.contrib.auth.decorators import login_required
from django.shortcuts import render, get_object_or_404
from goods.forms import ProductForm
from users.models import User
import datetime
import json


def index(request):
    producers_list = Producer.objects.order_by('pub_date')[:10]
    template = loader.get_template('catalog/index.html')
    context = RequestContext(request, {
        'producers_list': producers_list,
    })
    return HttpResponse(template.render(context))

def index_redirect(request):
    return HttpResponseRedirect('/goods/')


def producer_list(request, producer_id):
    producer = get_object_or_404(Producer, pk=producer_id)
    return render(request, 'goods/producer_list.html', {'producer': producer})


def description(request, product_id):
    product = get_object_or_404(Product, pk=product_id)
    temp = Product.objects.filter(user__id=request.user.id)
    number_users = User.objects.filter(product__id=product.id).count()
    if product in temp:
        like = True
    else:
        like = False
    print like
    return render(request, 'goods/product_details.html', {'product': product, 'like': like, 'number_users':number_users})


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


@login_required(login_url='/users/login')
def product_like(request, product_id):
    product = get_object_or_404(Product, pk=product_id)
    user = get_object_or_404(User, pk=request.user.id)
    product.user.add(user)
    product.save()

    return HttpResponseRedirect(product.get_absolute_url())


@login_required(login_url='/users/login')
def product_dislike(request, product_id):
    product = get_object_or_404(Product, pk=product_id)
    user = get_object_or_404(User, pk=request.user.id)
    product.user.remove(user)
    product.save()
    return HttpResponseRedirect(product.get_absolute_url())


def producer_list2(request):
    outcome = []
    if request.method == "POST" :
        if request.POST.get('data'):
            for p in Product.objects.raw('SELECT id,name FROM goods_product WHERE producer_id = %s',
                                         [request.POST.get('data')]):
                outcome.append({'id': p.id, 'name': p.name})
            outcome = json.dumps(outcome)
        return HttpResponse(outcome)


def fillup(request):
    num = Producer.objects.count()
    for i in range(10-num):
        new_producer=Producer(name="Producer"+str(num+i+1),pub_date= datetime.datetime.now())
        new_producer.save()
        for j in range(5):
            new_product=Product(article=(num+i+1)*10+j+1, name="Some product "+str(j+1)+' of producer '+str(num+i+1),
                                producer_id=new_producer.id, description = 'some description')
            new_product.save()
            print j
    return HttpResponseRedirect('../')

def all_goods_with_pages(request):
    product_list = Product.objects.all()
    p=Paginator(product_list, 10)
    print p.page_range
    return HttpResponse(p.page_range)


