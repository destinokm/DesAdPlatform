from __future__ import unicode_literals

from django.db import models

# Create your models here.


class Offer(models.Model):
    prod_id = models.IntegerField(blank=True, null=True)
    prod = models.CharField(max_length=255, blank=True, null=True)
    status = models.CharField(max_length=15, blank=True, null=True)
    create_time = models.DateTimeField(auto_now_add=True)
    update_time = models.DateTimeField(auto_now=True)

    class Meta:
        managed = False
        db_table = 'offer'

    def __unicode__(self):
        return '%s' % self.id


class OfferDescription(models.Model):
    offer_id = models.IntegerField(blank=True, null=True)
    name = models.CharField(max_length=255, blank=True, null=True)
    category = models.CharField(max_length=255, blank=True, null=True)
    category_secondary = models.CharField(max_length=255, blank=True, null=True)
    preview_link = models.TextField(blank=True, null=True)
    short_description = models.TextField(blank=True, null=True)
    description = models.TextField(blank=True, null=True)
    traffic_allowed = models.TextField(blank=True, null=True)
    traffic_forbidden = models.TextField(blank=True, null=True)
    conversion_flow = models.CharField(max_length=511, blank=True, null=True)
    sign_code = models.CharField(max_length=255, blank=True, null=True)
    create_time = models.DateTimeField(auto_now_add=True)
    update_time = models.DateTimeField(auto_now=True)

    class Meta:
        managed = False
        db_table = 'offer_description'


class OfferPayout(models.Model):
    offer_id = models.IntegerField(blank=True, null=True)
    currency = models.CharField(max_length=31, blank=True, null=True)
    payout_value = models.DecimalField(max_digits=11, decimal_places=4, blank=True, null=True)
    revenue_value = models.DecimalField(max_digits=11, decimal_places=4, blank=True, null=True)
    cap_daily = models.IntegerField(blank=True, null=True)
    remaining_cap_daily = models.IntegerField(blank=True, null=True)
    cap_monthly = models.IntegerField(blank=True, null=True)
    remaining_cap_monthly = models.IntegerField(blank=True, null=True)
    sign_code = models.CharField(max_length=255, blank=True, null=True)
    create_time = models.DateTimeField(auto_now_add=True)
    update_time = models.DateTimeField(auto_now=True)

    class Meta:
        managed = False
        db_table = 'offer_payout'


class OfferSetting(models.Model):
    offer_id = models.IntegerField(blank=True, null=True)
    platforms = models.CharField(max_length=511, blank=True, null=True)
    countries = models.CharField(max_length=2045, blank=True, null=True)
    download_type = models.CharField(max_length=31, blank=True, null=True)
    gid_idfa_needs = models.CharField(max_length=3, blank=True, null=True)
    redirect_count = models.IntegerField(blank=True, null=True)
    whitelist_limited = models.CharField(max_length=3, blank=True, null=True)
    sign_code = models.CharField(max_length=255, blank=True, null=True)
    create_time = models.DateTimeField(auto_now_add=True)
    update_time = models.DateTimeField(auto_now=True)

    class Meta:
        managed = False
        db_table = 'offer_setting'


class OfferSource(models.Model):
    offer_id = models.IntegerField()
    source_id = models.IntegerField()
    source_offer_id = models.CharField(max_length=255, blank=True, null=True)
    tracking_link = models.CharField(max_length=511, blank=True, null=True)
    sign_code = models.CharField(max_length=255, blank=True, null=True, editable=False)
    create_time = models.DateTimeField(auto_now_add=True)
    update_time = models.DateTimeField(auto_now=True)

    class Meta:
        managed = False
        db_table = 'offer_source'


