from django.shortcuts import render
from django.http import HttpResponseRedirect
from users.models import User
from users.forms import UserForm
from django.contrib.auth import authenticate, login, logout


def user_form(request):
    if request.method == 'POST':
        form = UserForm(request.POST)
        if form.is_valid():
            user_name = form.cleaned_data['user_name']
            password = form.cleaned_data['password']
            User.objects.create_user(user_name, password)
            return HttpResponseRedirect('users_list')
    else:
        form = UserForm()
    return render(request, 'users/login_or_register.html', {'form': form})


def users_list(request):
    user_list = User.objects.all()
    return render(request, 'users/users_list.html', {'user_list': user_list})


def user_login(request):
    if request.method == 'POST':
        form = UserForm(request.POST)
        if form.is_valid():
            user_name = form.cleaned_data['user_name']
            password = form.cleaned_data['password']
            user = authenticate(user_name=user_name, password=password)
            if user is None:
                return HttpResponseRedirect('bad')
            else:
                login(request, user)
                return HttpResponseRedirect('/goods')
    else:
        form = UserForm()
    return render(request, 'users/login_or_register.html', {'form': form})


def bad(request):
    return render(request, 'users/bad.html')


def user_logout(request):
    logout(request)
    return HttpResponseRedirect('/goods')

def user_wishlist(request):
    return render(request, 'users/wishlist.html')