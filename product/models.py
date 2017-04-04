from __future__ import unicode_literals

from django.db import models

# Create your models here.
class Product(models.Model):
    prod = models.CharField(unique=True, max_length=127, blank=True, null=True)
    category = models.CharField(max_length=255, blank=True, null=True)
    source_id = models.IntegerField(blank=True, null=True)
    create_time = models.DateTimeField(auto_now_add=True)
    update_time = models.DateTimeField(auto_now=True)

    class Meta:
        managed = False
        db_table = 'product'


class ProductCreatives(models.Model):
    prod_id = models.IntegerField(blank=True, null=True)
    source_id = models.IntegerField(blank=True, null=True)
    pixel = models.CharField(max_length=31, blank=True, null=True)
    url = models.CharField(max_length=1023, blank=True, null=True)
    res_url = models.CharField(max_length=1023, blank=True, null=True)
    language = models.CharField(max_length=31, blank=True, null=True)
    countries = models.CharField(max_length=1023, blank=True, null=True)
    sign_code = models.CharField(unique=True, max_length=60, blank=True, null=True)
    create_time = models.DateTimeField(auto_now_add=True)
    update_time = models.DateTimeField(auto_now=True)

    class Meta:
        managed = False
        db_table = 'product_creatives'


class ProductDescription(models.Model):
    prod_id = models.IntegerField(blank=True, null=True)
    name = models.CharField(max_length=255, blank=True, null=True)
    preview_link = models.TextField(blank=True, null=True)
    short_description = models.TextField(blank=True, null=True)
    description = models.TextField(blank=True, null=True)
    sign_code = models.CharField(max_length=255, blank=True, null=True)
    create_time = models.DateTimeField(auto_now_add=True)
    update_time = models.DateTimeField(auto_now=True)

    class Meta:
        managed = False
        db_table = 'product_description'


class ProductIcons(models.Model):
    prod_id = models.IntegerField(blank=True, null=True)
    source_id = models.IntegerField(blank=True, null=True)
    pixel = models.CharField(max_length=31, blank=True, null=True)
    url = models.CharField(max_length=1023, blank=True, null=True)
    res_url = models.CharField(max_length=1023, blank=True, null=True)
    language = models.CharField(max_length=31, blank=True, null=True)
    countries = models.CharField(max_length=1023, blank=True, null=True)
    sign_code = models.CharField(unique=True, max_length=60, blank=True, null=True)
    create_time = models.DateTimeField(auto_now_add=True)
    update_time = models.DateTimeField(auto_now=True)

    class Meta:
        managed = False
        db_table = 'product_icons'