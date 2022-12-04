# syntax=docker/dockerfile:1
FROM ruby:3.1.2-alpine

ENV BUNDLER_VERSION=2.3.16

RUN apk add --update \
      binutils-gold \
      build-base \
      curl \
      file \
      g++ \
      gcc \
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
      tzdata \
      yarn \
      shared-mime-info \
      postgresql-client

RUN gem install bundler -v ${BUNDLER_VERSION}
WORKDIR /app
COPY . .

RUN bundle check || bundle install
RUN yarn install --check-files

# Add a script to be executed every time the container starts.
# COPY entrypoint.sh /usr/bin/
# RUN chmod +x /usr/bin/entrypoint.sh
EXPOSE 3000

# Configure the main process to run when running the image
CMD ["rails", "server", "-b", "0.0.0.0"]
