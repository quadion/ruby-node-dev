# Base our image on an official, minimal image of our preferred Ruby
FROM ruby:2.4.2-slim-stretch

# Install essential Linux packages for development plus node.js, npm and eslint
RUN echo "deb http://http.us.debian.org/debian unstable main" >> /etc/apt/sources.list && \
    apt-get update -qq && \
    apt-get install -y --no-install-recommends git build-essential curl libpq-dev default-libmysqlclient-dev cmake gnupg pkg-config xvfb openssh-client chromium wget && \
    curl -sL https://deb.nodesource.com/setup_10.x | sh - && \
    apt-get install -y --no-install-recommends nodejs && \
    npm install -g eslint

