from django.shortcuts import render
from django.http import HttpResponseRedirect
from users.models import UserForm

# Create your views here.


def userform(request):
    if request.method == 'POST': # If the form has been submitted...
        form = UserForm(request.POST) # A form bound to the POST data
        if form.is_valid():
            user_name = form.cleaned_data['user_name']
            password = form.cleaned_data['password']
            p=UserForm(user_name,password)
            return HttpResponseRedirect('/users_list/') # Redirect after POST
    else:
        form = UserForm()  # An unbound form
    return render(request, 'users/login.html', {'form': form,})

def users_list(request):
    users_list = UserForm.objects.all()
    return render(request, 'users/users_list.html', {'users_list' : users_list,})


