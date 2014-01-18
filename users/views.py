from django.shortcuts import render
from django.http import HttpResponseRedirect, HttpResponse
from users.models import User
from users.forms import UserForm
from django.contrib.auth import authenticate, login

# Create your views here.


def userform(request):
    if request.method == 'POST': # If the form has been submitted...
        form = UserForm(request.POST) # A form bound to the POST data
        if form.is_valid():
            user_name = form.cleaned_data['user_name']
            password = form.cleaned_data['password']
            User.objects.create_user(user_name,password)
            return HttpResponseRedirect('users_list') # Redirect after POST
    else:
        form = UserForm()  # An unbound form
    return render(request, 'users/register.html', {'form': form,})

def users_list(request):
    users_list = User.objects.all()
    return render(request, 'users/users_list.html', {'users_list': users_list})


def userlogin(request):
    if request.method == 'POST': # If the form has been submitted...
        form = UserForm(request.POST) # A form bound to the POST data
        if form.is_valid():
            user_name = form.cleaned_data['user_name']
            password = form.cleaned_data['password']
            user = authenticate(user_name=user_name, password=password)
            if user is None:
                return HttpResponseRedirect('bad')
            else:
                login(request, user)
                return HttpResponseRedirect('/goods/all')
    else:
        form = UserForm()
    return render(request, 'users/register.html', {'form': form,})

def bad(request):
    return render(request, 'users/bad.html')

