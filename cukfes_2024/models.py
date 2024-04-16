from django.db import models

# Create your models here.
class Post(models.Model):
    title = models.CharField(max_length=50)
    #제목 : charfiled함수로 길이가 정해진 문자열 저장
    content = models.TextField()
    #content 글의 내용. 길이정의X 문자열 저장
    created_at = models.DateTimeField(auto_now_add=True)
    #생성날짜, 현재시간 저장
    updated_at = models.DateTimeField(auto_now=True)
    #글 수정일, 데이터 갱신 시 시간저장