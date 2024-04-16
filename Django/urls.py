from django.contrib import admin
from django.urls import path,include


urlpatterns = [
    path('admin/', admin.site.urls),
    #--edit---
    path('cukfes_2024/', include('cukfes_2024.urls')),
    #path에서 cukfes_2024의 이름으로 url사용예정, views.py내부 index함수에서 값을 받아올 것
]
