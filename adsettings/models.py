# coding=utf-8
# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#   * Rearrange models' order
#   * Make sure each model has one field with primary_key=True
#   * Make sure each ForeignKey has `on_delete` set to the desired behavior.
#   * Remove `managed = False` lines if you wish to allow Django to create, modify, and delete the table
# Feel free to rename the models, but don't rename db_table values or field names.
from __future__ import unicode_literals

from django.db import models


class BlacklistAffiliateOffer(models.Model):
    affiliate_id = models.IntegerField(blank=True, null=True)
    offer_id = models.IntegerField(blank=True, null=True)
    tag = models.CharField(max_length=255, blank=True, null=True)
    description = models.CharField(max_length=255, blank=True, default='')
    operator_id = models.IntegerField(blank=True, null=True)
    create_time = models.DateTimeField(auto_now_add=True)
    update_time = models.DateTimeField(auto_now=True)

    class Meta:
        managed = False
        db_table = 'blacklist_affiliate_offer'



class BlacklistAffiliateSource(models.Model):
    affiliate_id = models.IntegerField(blank=True, null=True)
    source_id = models.IntegerField(blank=True, null=True)
    tag = models.CharField(max_length=255, blank=True, null=True)
    desc = models.CharField(max_length=255, blank=True, null=True)
    operator_id = models.IntegerField(blank=True, null=True)
    create_time = models.DateTimeField(auto_now_add=True)
    update_time = models.DateTimeField(auto_now=True)

    class Meta:
        managed = False
        db_table = 'blacklist_affiliate_source'


class BlockAffiliate(models.Model):
    block_date = models.DateField(blank=True, null=True)
    affiliate_id = models.IntegerField()
    source_id = models.IntegerField(blank=True, null=True)
    operator_id = models.IntegerField(blank=True, null=True)
    description = models.CharField(max_length=255, blank=True, default='')
    create_time = models.DateTimeField(auto_now_add=True)

    class Meta:
        managed = False
        db_table = 'block_affiliate'


class BlockSource(models.Model):
    block_date = models.DateField()
    source_id = models.IntegerField()
    operator_id = models.IntegerField(blank=True, null=True)
    description = models.CharField(max_length=255, blank=True, default='')
    create_time = models.DateTimeField(auto_now_add=True)

    class Meta:
        managed = False
        db_table = 'block_source'



class SettingAffiliateOfferPayout(models.Model):
    affiliate_id = models.IntegerField(blank=True, null=True)
    offer_id = models.IntegerField(blank=True, null=True)
    payout_value = models.DecimalField(max_digits=11, decimal_places=4, blank=True, null=True)
    operator_id = models.IntegerField(blank=True, null=True)
    create_time = models.DateTimeField(auto_now_add=True)
    update_time = models.DateTimeField(auto_now=True)

    class Meta:
        managed = False
        db_table = 'setting_affiliate_offer_payout'
        verbose_name = 'Aff-Offer Payout'
        verbose_name_plural = 'Aff-Offer Payout'


class SettingAffiliateOfferPayoutPecent(models.Model):
    affiliate_id = models.IntegerField(blank=True, null=True)
    pecent = models.DecimalField(max_digits=11, decimal_places=4, blank=True, null=True)
    operator_id = models.IntegerField(blank=True, null=True)
    description = models.CharField(max_length=255, blank=True, default='')
    create_time = models.DateTimeField(auto_now_add=True)
    update_time = models.DateTimeField(auto_now=True)

    class Meta:
        managed = False
        db_table = 'setting_affiliate_offer_payout_pecent'
        verbose_name = 'Aff-Offer Payout Percent'
        verbose_name_plural = 'Aff-Offer Payout Percent'


class SettingPostbackAdjustRate(models.Model):
    affiliate_sub = models.CharField(max_length=255, blank=True, null=True)
    affiliate_id = models.IntegerField(blank=True, null=True)
    offer_id = models.IntegerField(blank=True, null=True)
    source_id = models.IntegerField(blank=True, null=True)
    rate_weight = models.IntegerField(blank=True, null=True)
    rate = models.DecimalField(max_digits=11, decimal_places=4, blank=True, null=True)
    operator_id = models.IntegerField(blank=True, null=True)
    description = models.CharField(max_length=255, blank=True, default='')
    create_time = models.DateTimeField(auto_now_add=True)
    update_time = models.DateTimeField(auto_now=True)

    class Meta:
        managed = False
        db_table = 'setting_postback_adjust_rate'
        verbose_name = 'Postback Adjust Rate'
        verbose_name_plural = 'Postback Adjust Rate'



class SettingPostbckAffiliateAdjust(models.Model):
    affiliate_id = models.IntegerField(blank=True, null=True)
    count = models.IntegerField(blank=True, null=True)
    operator = models.IntegerField(blank=True, null=True)
    create_time = models.DateTimeField(auto_now_add=True)
    update_time = models.DateTimeField(auto_now=True)

    class Meta:
        managed = False
        db_table = 'setting_postbck_affiliate_adjust'
        verbose_name = 'Postback Affiliate Rate'
        verbose_name_plural = 'Postback Affiliate Rate'


class SettingWhitelistOfferAffiliate(models.Model):
    offer_id = models.IntegerField(blank=True, null=True)
    affiliate_id = models.IntegerField(blank=True, null=True)
    operator_id = models.IntegerField(blank=True, null=True)
    description = models.CharField(max_length=255, blank=True, default='')
    create_time = models.DateTimeField(auto_now_add=True)
    update_time = models.DateTimeField(auto_now=True)

    class Meta:
        managed = False
        db_table = 'setting_whitelist_offer_affiliate'
        verbose_name = 'Whitelist Offer Affiliate'
        verbose_name_plural = 'Whitelist Offer Affiliate'

class SettingWhitelistSourceAffiliate(models.Model):
    source_id = models.IntegerField(blank=True, null=True)
    affiliate_id = models.IntegerField(blank=True, null=True)
    operator_id = models.IntegerField(blank=True, null=True)
    description = models.CharField(max_length=255, blank=True, default='')
    create_time = models.DateTimeField(auto_now_add=True)
    update_time = models.DateTimeField(auto_now=True)

    class Meta:
        managed = False
        db_table = 'setting_whitelist_source_affiliate'
        verbose_name = 'Whitelist Source Affiliate'
        verbose_name_plural = 'Whitelist Source Affiliate'


class Source(models.Model):
    company = models.CharField(max_length=255, blank=True, null=True)
    addr = models.CharField(max_length=1023, blank=True, null=True)
    sign_name = models.CharField(max_length=63)
    enable = models.CharField(max_length=7)
    whitelist_limited = models.CharField(max_length=3)
    weightiness = models.IntegerField(blank=True, null=True)
    description = models.CharField(max_length=1023, blank=True, null=True)
    traffic_status = models.CharField(max_length=7, blank=True, null=True)
    create_time = models.DateTimeField(auto_now_add=True)
    update_time = models.DateTimeField(auto_now=True)

    class Meta:
        managed = False
        db_table = 'source'


class SourceSetting(models.Model):
    source_id = models.IntegerField()
    account_cap_daily = models.DecimalField(max_digits=11, decimal_places=4, blank=True, null=True)
    conversion_cap_daily = models.IntegerField(blank=True, null=True)
    operator_id = models.IntegerField(blank=True, null=True)
    description = models.CharField(max_length=255, blank=True, default='')
    create_time = models.DateTimeField(auto_now_add=True)
    update_time = models.DateTimeField(auto_now=True)

    class Meta:
        managed = False
        db_table = 'source_setting'


class SysAccount(models.Model):
    uname = models.CharField(max_length=255, blank=True, null=True)
    passwd = models.CharField(max_length=255, blank=True, null=True)
    enable = models.CharField(max_length=7, blank=True, null=True)
    email = models.CharField(max_length=255, blank=True, null=True)
    phone = models.CharField(max_length=31, blank=True, null=True)
    create_time = models.DateTimeField(auto_now_add=True)
    update_time = models.DateTimeField(auto_now=True)

    class Meta:
        managed = False
        db_table = 'sys_account'


class SysAccountRights(models.Model):
    account_id = models.IntegerField(blank=True, null=True)
    right_id = models.IntegerField(blank=True, null=True)
    available = models.CharField(max_length=7, blank=True, null=True)
    create_time = models.DateTimeField(auto_now_add=True)
    update_time = models.DateTimeField(auto_now=True)

    class Meta:
        managed = False
        db_table = 'sys_account_rights'


class SysAccountRole(models.Model):
    account_id = models.IntegerField()
    role = models.CharField(max_length=13)
    aff_subs = models.CharField(max_length=1023, blank=True, null=True)
    create_time = models.DateTimeField(auto_now_add=True)
    update_time = models.DateTimeField(auto_now=True)

    class Meta:
        managed = False
        db_table = 'sys_account_role'


class SysOperatorAffiliate(models.Model):
    affiliate_id = models.IntegerField(blank=True, null=True)
    operator_id = models.IntegerField(blank=True, null=True)
    operator_name = models.CharField(max_length=255, blank=True, null=True)
    create_time = models.DateTimeField(auto_now_add=True)
    update_time = models.DateTimeField(auto_now=True)

    class Meta:
        managed = False
        db_table = 'sys_operator_affiliate'


class SysOperatorSource(models.Model):
    source_id = models.IntegerField(blank=True, null=True)
    operator_id = models.IntegerField(blank=True, null=True)
    operator_name = models.CharField(max_length=255, blank=True, null=True)
    create_time = models.DateTimeField(auto_now_add=True)
    update_time = models.DateTimeField(auto_now=True)

    class Meta:
        managed = False
        db_table = 'sys_operator_source'


class SysRights(models.Model):
    main = models.CharField(max_length=255, blank=True, null=True)
    request_path = models.CharField(max_length=255, blank=True, null=True)
    sub_name = models.CharField(max_length=255, blank=True, null=True)
    weightness = models.IntegerField(blank=True, null=True)
    available = models.CharField(max_length=7, blank=True, null=True)
    create_time = models.DateTimeField(auto_now_add=True)
    update_time = models.DateTimeField(auto_now=True)

    class Meta:
        managed = False
        db_table = 'sys_rights'


class WhitelistS2S(models.Model):
    source_id = models.IntegerField(blank=True, null=True)
    ip_start = models.CharField(max_length=15, blank=True, null=True)
    ip_end = models.CharField(max_length=15, blank=True, null=True)
    ip_start_num = models.BigIntegerField(blank=True, null=True)
    ip_end_num = models.BigIntegerField(blank=True, null=True)
    description = models.CharField(max_length=255, blank=True, default='')
    create_time = models.DateTimeField(auto_now_add=True)
    update_time = models.DateTimeField(auto_now=True)

    class Meta:
        managed = False
        db_table = 'whitelist_s2s'
