from __future__ import unicode_literals

from django.db import models


class Affiliate(models.Model):
    company = models.CharField(max_length=255, blank=True, null=True)
    address = models.CharField(max_length=255, blank=True, null=True)
    city = models.CharField(max_length=255, blank=True, null=True)
    country = models.CharField(max_length=255, blank=True, null=True)
    phone = models.CharField(max_length=255, blank=True, null=True)
    status = models.CharField(max_length=7, default='ACTIVE', choices=(
        ('ACTIVE', 'ACTIVE'),
        ('PAUSED', 'PAUSED')))
    postback_url = models.CharField(max_length=1023, blank=True, null=True)
    code = models.CharField(max_length=32)
    adjusted = models.CharField(max_length=7)
    access_type = models.CharField(max_length=4)
    cr_limit = models.DecimalField(max_digits=6, decimal_places=4, blank=True, null=True)
    description = models.CharField(max_length=255, blank=True, default='')
    create_time = models.DateTimeField(auto_now_add=True)
    update_time = models.DateTimeField(auto_now=True)

    class Meta:
        managed = False
        db_table = 'affiliate'


class AffiliateSetting(models.Model):
    affiliate_id = models.IntegerField()
    source_id = models.IntegerField(blank=True, null=True)
    conversion_cap_daily = models.IntegerField(blank=True, null=True)
    account_cap_daily = models.DecimalField(max_digits=11, decimal_places=2, blank=True, null=True)
    operator_id = models.IntegerField(blank=True, null=True, editable=False)
    description = models.CharField(max_length=255, blank=True, default='')
    create_time = models.DateTimeField(auto_now_add=True)
    update_time = models.DateTimeField(auto_now=True)

    class Meta:
        managed = False
        db_table = 'affiliate_setting'


class AffiliateSyncSetting(models.Model):
    affiliate_id = models.IntegerField()
    operation = models.CharField(max_length=3)
    regex_text = models.CharField(max_length=255)
    operator_id = models.IntegerField()
    description = models.CharField(max_length=255, blank=True, default='')
    create_time = models.DateTimeField(auto_now_add=True)
    update_time = models.DateTimeField(auto_now=True)

    class Meta:
        managed = False
        db_table = 'affiliate_sync_setting'