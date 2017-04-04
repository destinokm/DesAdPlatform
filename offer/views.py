from django.shortcuts import render

# Create your views here.
from offer.forms import SelectDateWidgetForm


def test(request):
    return render(request, 'example.html', {'form': SelectDateWidgetForm()})
