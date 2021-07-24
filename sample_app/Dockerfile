# Debianがベースのrubyイメージを指定
FROM ruby:2.7.1

ENV WORKDIR=/var/www
WORKDIR $WORKDIR

# yarn installのために必要なもの
# https://qiita.com/MasatoraAtarashi/items/3f0317cd648ff63fa92c
RUN curl https://deb.nodesource.com/setup_12.x | bash
RUN curl https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list


# 必要なものをインストール
RUN apt-get update -qq && apt-get -y install \
    build-essential \
    libpq-dev \
    nodejs \
    mariadb-client \
    vim \
    procps \
    yarn


# パスワード設定
# RUN echo 'password' | chpasswd


# rails用のディレクトリを作成
RUN mkdir /sample_app

# ローカルマシン(Mac)からコンテナの中にファイルをコピー
COPY Gemfile .
COPY Gemfile.lock .
COPY settings.sh .
COPY database.yml .


# 上でコピーしたGemfileに従ってGemをインストール
RUN gem install bundler && bundle install
CMD ./settings.sh
