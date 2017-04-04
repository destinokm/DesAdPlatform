# -*- coding: utf-8 -*-
# Generated by Django 1.10.6 on 2017-04-04 09:42
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Affiliate',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('company', models.CharField(blank=True, max_length=255, null=True)),
                ('address', models.CharField(blank=True, max_length=255, null=True)),
                ('city', models.CharField(blank=True, max_length=255, null=True)),
                ('country', models.CharField(blank=True, max_length=255, null=True)),
                ('phone', models.CharField(blank=True, max_length=255, null=True)),
                ('status', models.CharField(max_length=7)),
                ('postback_url', models.CharField(blank=True, max_length=1023, null=True)),
                ('code', models.CharField(max_length=32)),
                ('adjusted', models.CharField(max_length=7)),
                ('access_type', models.CharField(max_length=4)),
                ('cr_limit', models.DecimalField(blank=True, decimal_places=4, max_digits=6, null=True)),
                ('description', models.CharField(blank=True, default='', max_length=255)),
                ('create_time', models.DateTimeField(auto_now_add=True)),
                ('update_time', models.DateTimeField(auto_now=True)),
            ],
            options={
                'db_table': 'affiliate',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='AffiliateSetting',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('affiliate_id', models.IntegerField()),
                ('source_id', models.IntegerField(blank=True, null=True)),
                ('conversion_cap_daily', models.IntegerField(blank=True, null=True)),
                ('account_cap_daily', models.DecimalField(blank=True, decimal_places=2, max_digits=11, null=True)),
                ('operator_id', models.IntegerField(blank=True, null=True)),
                ('description', models.CharField(blank=True, default='', max_length=255)),
                ('create_time', models.DateTimeField(auto_now_add=True)),
                ('update_time', models.DateTimeField(auto_now=True)),
            ],
            options={
                'db_table': 'affiliate_setting',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='AffiliateSyncSetting',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('affiliate_id', models.IntegerField()),
                ('operation', models.CharField(max_length=3)),
                ('regex_text', models.CharField(max_length=255)),
                ('operator_id', models.IntegerField()),
                ('description', models.CharField(blank=True, default='', max_length=255)),
                ('create_time', models.DateTimeField(auto_now_add=True)),
                ('update_time', models.DateTimeField(auto_now=True)),
            ],
            options={
                'db_table': 'affiliate_sync_setting',
                'managed': False,
            },
        ),
    ]
