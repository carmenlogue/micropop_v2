FROM ruby:2.5.1
MAINTAINER carmenlogue@gmail.com
ENV REFRESHED_AT 2018-06-06

# Install packages
RUN apt-get update && apt-get install -y --no-install-recommends \
  build-essential \
  ruby-dev \
  libgdbm-dev \
  libncurses5-dev \
  libpq-dev \
  nodejs \
  graphicsmagick \
  git \
  && rm -rf /var/lib/apt/lists/*

# Setup app location
RUN mkdir -p /app
WORKDIR /app

# Install gems
ADD Gemfile /app/Gemfile
ADD Gemfile.lock /app/Gemfile.lock
RUN bundle install --jobs 4
