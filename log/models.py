from __future__ import unicode_literals

from django.db import models

# Create your models here.
class LogAdTransaction(models.Model):
    offer_id = models.IntegerField(blank=True, null=True)
    affiliate_id = models.IntegerField(blank=True, null=True)
    source_id = models.IntegerField(blank=True, null=True)
    ip = models.CharField(max_length=255, blank=True, null=True)
    country = models.CharField(max_length=7, blank=True, null=True)
    currency = models.CharField(max_length=31, blank=True, null=True)
    payout = models.DecimalField(max_digits=11, decimal_places=4, blank=True, null=True)
    revenue = models.DecimalField(max_digits=11, decimal_places=4, blank=True, null=True)
    transaction_id = models.CharField(max_length=255, blank=True, null=True)
    click_id = models.CharField(max_length=1023, blank=True, null=True)
    aff_sub = models.CharField(max_length=1023, blank=True, null=True)
    aff_sub2 = models.CharField(max_length=1023, blank=True, null=True)
    aff_sub3 = models.CharField(max_length=1023, blank=True, null=True)
    aff_sub4 = models.CharField(max_length=1023, blank=True, null=True)
    aff_sub5 = models.CharField(max_length=1023, blank=True, null=True)
    gaid = models.CharField(max_length=511, blank=True, null=True)
    android_id = models.CharField(max_length=511, blank=True, null=True)
    idfa = models.CharField(max_length=511, blank=True, null=True)
    click_time = models.DateTimeField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'log_ad_transaction'


class LogPostbackAccess(models.Model):
    tag = models.CharField(max_length=63, blank=True, null=True)
    original_url = models.CharField(max_length=1023, blank=True, null=True)
    redirect_url = models.CharField(max_length=1023, blank=True, null=True)
    transaction_id = models.CharField(max_length=255)
    source_id = models.IntegerField(blank=True, null=True)
    offer_id = models.IntegerField(blank=True, null=True)
    affiliate_id = models.IntegerField(blank=True, null=True)
    affiliate_sub = models.CharField(max_length=1023, blank=True, null=True)
    ip = models.CharField(max_length=255, blank=True, null=True)
    country = models.CharField(max_length=7, blank=True, null=True)
    track_ip = models.CharField(max_length=255, blank=True, null=True)
    track_country = models.CharField(max_length=7, blank=True, null=True)
    create_time = models.DateTimeField(blank=True, null=True)
    update_time = models.DateTimeField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'log_postback_access'


class LogPostbackBill(models.Model):
    original_url = models.CharField(max_length=1023, blank=True, null=True)
    redirect_url = models.CharField(max_length=1023, blank=True, null=True)
    transaction_id = models.CharField(unique=True, max_length=255)
    source_id = models.IntegerField(blank=True, null=True)
    offer_id = models.IntegerField(blank=True, null=True)
    affiliate_id = models.IntegerField(blank=True, null=True)
    affiliate_sub = models.CharField(max_length=1023, blank=True, null=True)
    ip = models.CharField(max_length=255, blank=True, null=True)
    country = models.CharField(max_length=7, blank=True, null=True)
    track_ip = models.CharField(max_length=255, blank=True, null=True)
    track_country = models.CharField(max_length=7, blank=True, null=True)
    payout_value = models.DecimalField(max_digits=11, decimal_places=5, blank=True, null=True)
    aff_payout_value = models.DecimalField(max_digits=11, decimal_places=5, blank=True, null=True)
    adjusted = models.IntegerField(blank=True, null=True)
    response_code = models.IntegerField(blank=True, null=True)
    response_msg = models.CharField(max_length=511, blank=True, null=True)
    create_time = models.DateTimeField(blank=True, null=True)
    postback_time = models.DateTimeField(blank=True, null=True)
    update_time = models.DateTimeField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'log_postback_bill'
