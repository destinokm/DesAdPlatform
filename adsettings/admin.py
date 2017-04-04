from django.contrib import admin
from django.forms import ModelForm, Select

from models import *


# @admin.register(BlacklistAffiliateOffer)
# class BlacklistAffiliateOfferAdmin(admin.ModelAdmin):
#     list_display = [f.name for f in BlacklistAffiliateOffer._meta.get_fields()]
#
#
# @admin.register(BlacklistAffiliateSource)
# class BlacklistAffiliateSourceAdmin(admin.ModelAdmin):
#     list_display = [f.name for f in BlacklistAffiliateSource._meta.get_fields()]
#
#
# @admin.register(BlockAffiliate)
# class BlockAffiliateAdmin(admin.ModelAdmin):
#     list_display = [f.name for f in BlockAffiliate._meta.get_fields()]
#
#
# @admin.register(BlockSource)
# class BlockSourceAdmin(admin.ModelAdmin):
#     list_display = [f.name for f in BlockSource._meta.get_fields()]

# class SAOPModelForm(ModelForm):
#     class Meta:
#         model = SettingAffiliateOfferPayout
#         fields = ('affiliate_id',)
#         widgets = {
#             'affiliate_id': Select(choices=((x['id'], x['name']) for x in [{'id':1, 'name': 'hello'}, {'id':2, 'name': 'hello2'}])),
#         }


@admin.register(SettingAffiliateOfferPayout)
class SettingAffiliateOfferPayoutAdmin(admin.ModelAdmin):
    list_display = [f.name for f in SettingAffiliateOfferPayout._meta.get_fields()]

    # form = SAOPModelForm
    # icon = '<i class="material-icons">looks_one</i>'


@admin.register(SettingAffiliateOfferPayoutPecent)
class SettingAffiliateOfferPayoutPecentAdmin(admin.ModelAdmin):
    list_display = [f.name for f in SettingAffiliateOfferPayoutPecent._meta.get_fields()]
    # icon = '<i class="material-icons">looks_two</i>'


@admin.register(SettingPostbackAdjustRate)
class SettingPostbackAdjustRateAdmin(admin.ModelAdmin):
    list_display = [f.name for f in SettingPostbackAdjustRate._meta.get_fields()]
    # icon = '<i class="material-icons">looks_4</i>'


@admin.register(SettingPostbckAffiliateAdjust)
class SettingPostbckAffiliateAdjustAdmin(admin.ModelAdmin):
    list_display = [f.name for f in SettingPostbckAffiliateAdjust._meta.get_fields()]
    # icon = '<i class="material-icons">looks_4</i>'


# @admin.register(SettingWhitelistOfferAffiliate)
# class SettingWhitelistOfferAffiliateAdmin(admin.ModelAdmin):
#     list_display = [f.name for f in SettingWhitelistOfferAffiliate._meta.get_fields()]
#     # icon = '<i class="material-icons">looks_one</i>'
#
#
# @admin.register(SettingWhitelistSourceAffiliate)
# class SettingWhitelistSourceAffiliateAdmin(admin.ModelAdmin):
#     list_display = [f.name for f in SettingWhitelistSourceAffiliate._meta.get_fields()]
#     # icon = '<i class="material-icons">looks_one</i>'


@admin.register(Source)
class SourceAdmin(admin.ModelAdmin):
    list_display = [f.name for f in Source._meta.get_fields()]
#
#
@admin.register(SourceSetting)
class SourceSettingAdmin(admin.ModelAdmin):
    list_display = [f.name for f in SourceSetting._meta.get_fields()]

