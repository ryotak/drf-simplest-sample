# Dockerのイメージをビルドするための設定ファイル

# ベースとするDockerイメージを指定
FROM python:3.7-alpine

# 構築担当者をラベル付け
LABEL architecture="Rkunisato"

# リアルタイムでログを見れるように環境変数を指定
ENV PYTHONUNBUFFERD 1

# ローカルのrequirements.txtをコンテナにコピー
COPY ./requirements.txt /requirements.txt

# requirements.txtに従ってパッケージを一括でインストール
# Djangoプロジェクトを置くディレクトリをコンテナ上に作成
RUN apk update \
    && apk upgrade \
    && pip install --upgrade pip \
    && pip install -r /requirements.txt \
    && mkdir /dir-work

# RUN mkdir /drf-work

# コンテナ上の作業するディレクトリを変更
WORKDIR /drf-work

# ローカルのprofiles-rest-apiディレクトリをコンテナにコピー
# COPY ./profiles-rest-api /profiles-rest-api

# アプリケーションを実行するためのユーザを作成する
# -D：Don't assign a password
RUN adduser -D user

# ユーザをrootから変更
USER user