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
            name='Product',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('prod', models.CharField(blank=True, max_length=127, null=True, unique=True)),
                ('category', models.CharField(blank=True, max_length=255, null=True)),
                ('source_id', models.IntegerField(blank=True, null=True)),
                ('create_time', models.DateTimeField(auto_now_add=True)),
                ('update_time', models.DateTimeField(auto_now=True)),
            ],
            options={
                'db_table': 'product',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='ProductCreatives',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('prod_id', models.IntegerField(blank=True, null=True)),
                ('source_id', models.IntegerField(blank=True, null=True)),
                ('pixel', models.CharField(blank=True, max_length=31, null=True)),
                ('url', models.CharField(blank=True, max_length=1023, null=True)),
                ('res_url', models.CharField(blank=True, max_length=1023, null=True)),
                ('language', models.CharField(blank=True, max_length=31, null=True)),
                ('countries', models.CharField(blank=True, max_length=1023, null=True)),
                ('sign_code', models.CharField(blank=True, max_length=60, null=True, unique=True)),
                ('create_time', models.DateTimeField(auto_now_add=True)),
                ('update_time', models.DateTimeField(auto_now=True)),
            ],
            options={
                'db_table': 'product_creatives',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='ProductDescription',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('prod_id', models.IntegerField(blank=True, null=True)),
                ('name', models.CharField(blank=True, max_length=255, null=True)),
                ('preview_link', models.TextField(blank=True, null=True)),
                ('short_description', models.TextField(blank=True, null=True)),
                ('description', models.TextField(blank=True, null=True)),
                ('sign_code', models.CharField(blank=True, max_length=255, null=True)),
                ('create_time', models.DateTimeField(auto_now_add=True)),
                ('update_time', models.DateTimeField(auto_now=True)),
            ],
            options={
                'db_table': 'product_description',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='ProductIcons',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('prod_id', models.IntegerField(blank=True, null=True)),
                ('source_id', models.IntegerField(blank=True, null=True)),
                ('pixel', models.CharField(blank=True, max_length=31, null=True)),
                ('url', models.CharField(blank=True, max_length=1023, null=True)),
                ('res_url', models.CharField(blank=True, max_length=1023, null=True)),
                ('language', models.CharField(blank=True, max_length=31, null=True)),
                ('countries', models.CharField(blank=True, max_length=1023, null=True)),
                ('sign_code', models.CharField(blank=True, max_length=60, null=True, unique=True)),
                ('create_time', models.DateTimeField(auto_now_add=True)),
                ('update_time', models.DateTimeField(auto_now=True)),
            ],
            options={
                'db_table': 'product_icons',
                'managed': False,
            },
        ),
    ]
