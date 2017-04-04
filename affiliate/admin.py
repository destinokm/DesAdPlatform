from django.contrib import admin
from models import *
# Register your models here.

@admin.register(Affiliate)
class AffiliateAdmin(admin.ModelAdmin):
    list_display = [f.name for f in Affiliate._meta.get_fields()]
    view_on_site = False
    icon = '<i class="material-icons">account_circle</i>'


@admin.register(AffiliateSetting)
class AffiliateSettingAdmin(admin.ModelAdmin):
    list_display = [f.name for f in AffiliateSetting._meta.get_fields()]
    view_on_site = True
