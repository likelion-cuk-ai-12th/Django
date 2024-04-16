LABEL authors="hyunji"

# 현재 내가 사용하고 있는 python 버전을 작성해도 됨
# 만약 docker extension이 vscode에 깔려 있다면 자동완성으로 이름을 확인할 수 있음
FROM python:3.9-alpine3.13
# python이 실행되기 전에 compile을 거치면서 .pyc 파일을 생성하는데, docker에서는 불필요해 그것을 방지해줌
ENV PYTHONDONTWRITEBYTECODE=1
# 버퍼링을 제거해주기 위해 사용
ENV PYTHONUNBUFFERED=1

COPY ./requirements.txt /tmp/requirements.txt
COPY ./app /app
WORKDIR /app
EXPOSE 8000

RUN python -m venv /py && \
    /py/bin/pip install --upgrade pip && \
    /py/bin/pip install -r /tmp/requrements.txt && \
    rm -rf /tmp && \
    adduser \
        --disabled-password \
        --no-create-home \
        django-user

ENV PATH="/py/bin:$PATH"

USER django-user

#
#RUN apk update
## pillow를 통해 이미지를 사용하고 있어 jpeg 같은 것들을 적어줌
#RUN apk add build-base python3-dev py-pip jpeg-dev zlib-dev
## /usr/src/app/에 requirements.txt를 복사해준다.
#COPY requirements.txt /usr/src/app/
#
#WORKDIR /usr/src/app
#RUN pip install -r requirements.txt
#
## 현재 폴더에 있는 것들을 다 복사해 /usr/src/app/에 넣어준다.
#COPY . /usr/src/app/
#ENTRYPOINT ["top", "-b"]