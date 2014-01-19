from django.http import HttpResponse, HttpResponseRedirect
from goods.models import Producer, Product
from django.template import RequestContext, loader
from django.shortcuts import render, get_object_or_404
from goods.forms import ProductForm


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




def add_product(request,producer_id):
    if request.method == 'POST':
        form = ProductForm(request.POST)
        product=form.save(commit=False)
        product.producer_id = producer_id
        product.save()
        return HttpResponseRedirect(product.get_absolute_url())
    else:
        form = ProductForm()
        return render(request,'goods/add_product.html',{'form':form})







"""if request.user.is_authenticated:
            try:
                Producer.objects.get(id = producer_id)

            except Producer.DoesNotExist:
                errormessage='producer does not exist'
            else:
                if request.user.producer_id == producer_id:
                    form = ProductForm(request.POST)
                    product = form.save()
                    return HttpResponseRedirect(product.get_absolute_url)
                else:
                    errormessage = 'you do not have a permission to add goods to this producer'
        else:
            errormessage='user is not authentificated'
    return render(request, 'goods/add_product.html', {'product_id':product_id,
                                                     "error")"""
