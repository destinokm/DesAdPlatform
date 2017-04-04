from django.contrib import admin
from models import *


@admin.register(Product)
class ProductAdmin(admin.ModelAdmin):
    list_display = [f.name for f in Product._meta.get_fields()]


@admin.register(ProductCreatives)
class ProductCreativesAdmin(admin.ModelAdmin):
    list_display = [f.name for f in ProductCreatives._meta.get_fields()]


@admin.register(ProductDescription)
class ProductDescriptionAdmin(admin.ModelAdmin):
    list_display = [f.name for f in ProductDescription._meta.get_fields()]


@admin.register(ProductIcons)
class ProductIconsAdmin(admin.ModelAdmin):
    list_display = [f.name for f in ProductIcons._meta.get_fields()]