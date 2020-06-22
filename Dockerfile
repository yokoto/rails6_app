FROM ruby:2.7.1

ENV LANG C.UTF-8
ENV APP_ROOT /app

# install required libraries
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
  echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
  apt-get update -qq && \
  apt-get install -y --no-install-recommends \
  build-essential \
  libpq-dev \
  mariadb-client \
  nodejs \
  yarn && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/*

# create working directory
RUN mkdir $APP_ROOT
WORKDIR $APP_ROOT

# bundle install
COPY Gemfile $APP_ROOT/Gemfile
COPY Gemfile.lock $APP_ROOT/Gemfile.lock
RUN bundle install 

# yarn install
COPY package.json $APP_ROOT/package.json
ADD yarn.lock $APP_ROOT/yarn.lock
RUN yarn install

# create app in container
COPY . $APP_ROOT

# script to be executed every time the container starts
# COPY entrypoint.sh /usr/bin/
# RUN chmod +x /usr/bin/entrypoint.sh
# ENTRYPOINT ["entrypoint.sh"]
# EXPOSE 3000

# Start the main process
CMD ["rails", "server", "-b", "0.0.0.0"]
