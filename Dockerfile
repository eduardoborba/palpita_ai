# syntax=docker/dockerfile:1
FROM ruby:2.6.5-alpine

ENV BUNDLER_VERSION=1.17.2

RUN apk add --update --no-cache \
      binutils-gold \
      build-base \
      curl \
      file \
      g++ \
      gcc \
      git \
      less \
      libstdc++ \
      libffi-dev \
      libc-dev \
      linux-headers \
      libxml2-dev \
      libxslt-dev \
      libgcrypt-dev \
      make \
      netcat-openbsd \
      nodejs \
      openssl \
      pkgconfig \
      postgresql-dev \
      python \
      tzdata \
      yarn \
      shared-mime-info

RUN gem install bundler -v 1.17.2
WORKDIR /app
COPY . .

RUN bundle check || bundle install

COPY package.json yarn.lock ./
RUN yarn install --check-files

# Add a script to be executed every time the container starts.
# COPY entrypoint.sh /usr/bin/
# RUN chmod +x /usr/bin/entrypoint.sh
EXPOSE 3000

# Configure the main process to run when running the image
CMD ["rails", "server", "-b", "0.0.0.0"]
