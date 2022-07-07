# syntax=docker/dockerfile:1
FROM ruby:2.6.5-alpine

ENV BUNDLER_VERSION=2.3.6

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

RUN gem install bundler -v 2.3.6
WORKDIR /palpita_ai
COPY Gemfile /palpita_ai/Gemfile
COPY Gemfile.lock /palpita_ai/Gemfile.lock
RUN bundle config build.nokogiri --use-system-libraries
RUN bundle update --conservative mimemagic
RUN bundle check || bundle install

COPY package.json yarn.lock ./
RUN yarn install --check-files

COPY . ./

# Add a script to be executed every time the container starts.
# COPY entrypoint.sh /usr/bin/
# RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["./entrypoints/docker-entrypoint.sh"]
# EXPOSE 3000

# Configure the main process to run when running the image
# CMD ["rails", "server", "-b", "0.0.0.0"]
