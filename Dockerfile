# Base our image on an official, minimal image of our preferred Ruby
FROM ruby:2.4.2-slim-stretch

# Install essential Linux packages for development plus node.js, npm and eslint
RUN apt-get update -qq && \
    apt-get install -y --no-install-recommends git build-essential curl libpq-dev default-libmysqlclient-dev cmake gnupg pkg-config xvfb openssh-client wget && \
    curl -sL https://deb.nodesource.com/setup_10.x | sh - && \
    apt-get install -y --no-install-recommends nodejs && \
    npm install -g eslint

RUN sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt/ `lsb_release -cs`-pgdg main" >> /etc/apt/sources.list.d/pgdg.list' && \
    wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add - && \
    apt-get update && \
    apt-get install -y postgresql-client-11

# Only install Chromium from the unstable repository
RUN echo "deb http://http.us.debian.org/debian unstable main" >> /etc/apt/sources.list && \
    apt-get update -qq && \
    apt-get install -y --no-install-recommends chromium
