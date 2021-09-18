from django.contrib import admin

# Register your models here.
from .models import Book


class BookModelAdmin(admin.ModelAdmin):
    list_display = ('title', 'price', 'id', 'created_at')
    ordering = ('-created_at',)
    readonly_field = ('id', 'created_at')


admin.site.register(Book, BookModelAdmin)
