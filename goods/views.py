from django.shortcuts import render
from django.http import HttpResponse
from goods.models import Producer,Product
from django.template import RequestContext, loader


def index(request):
    producer_list = Producer.objects.order_by('-pub_date')[:5]
    template = loader.get_template('goods/index.html')
    output = ', '.join([p.name for p in producer_list])
    context = RequestContext(request, {
        'producers_list': producer_list,
    })
    return HttpResponse(template.render(context))

def prod(request, producer_id):
    return HttpResponse("You're looking goods of producer: %s." % producer_id)




