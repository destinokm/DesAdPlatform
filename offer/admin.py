from django.contrib import admin
from models import *
# Register your models here.

@admin.register(Offer)
class OfferAdmin(admin.ModelAdmin):
    list_display = [f.name for f in Offer._meta.get_fields()]


@admin.register(OfferDescription)
class OfferDescriptionAdmin(admin.ModelAdmin):
    list_display = [f.name for f in OfferDescription._meta.get_fields()]


@admin.register(OfferPayout)
class OfferPayoutAdmin(admin.ModelAdmin):
    list_display = [f.name for f in OfferPayout._meta.get_fields()]


@admin.register(OfferSetting)
class OfferSettingAdmin(admin.ModelAdmin):
    list_display = [f.name for f in OfferSetting._meta.get_fields()]


@admin.register(OfferSource)
class OfferSourceAdmin(admin.ModelAdmin):
    list_display = [f.name for f in OfferSource._meta.get_fields()]

