from django.conf.urls import url

import views

urlpatterns = [
    url('^test$', views.test)
]
