# from django.forms import forms
# from material.frontend import forms
from django import forms
from django.forms import SelectDateWidget
from django.utils import timezone


class SelectDateWidgetForm(forms.Form):
    description = "SelectDateWidget options"

    field1 = forms.DateField(
        help_text='default', widget=SelectDateWidget)
    field2 = forms.DateField(
        help_text='initial value', widget=SelectDateWidget, initial=timezone.now)
    field3 = forms.DateField(
        help_text='custom empty label', widget=SelectDateWidget(
            empty_label=("Choose Year", "Choose Month", "Choose Day")))