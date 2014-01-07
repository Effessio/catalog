from django.http import HttpResponse
from goods.models import Producer,Product
from django.template import RequestContext, loader
from django.shortcuts import render, get_object_or_404


def index(request):
    producer_list = Producer.objects.order_by('-pub_date')[:5]
    template = loader.get_template('goods/index.html')
    output = ', '.join([p.name for p in producer_list])
    context = RequestContext(request, {
        'producers_list': producer_list,
    })
    return HttpResponse(template.render(context))

def detail(request, producer_id):
    producer = get_object_or_404(Producer, pk=producer_id)
    return render(request, 'goods/detail.html', {'producer': producer})








