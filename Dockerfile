FROM ruby:2.7.5

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
  && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
  && apt-get update -qq \
  && apt-get install -y nodejs yarn mariadb-client \
  && apt-get install -y vim
WORKDIR /app
COPY ./src /app
RUN bundle config --local set path 'vendor/bundle' \
  && bundle install

ENV RAILS_ENV=production

  COPY start.sh /start.sh
  RUN chmod 744 /start.sh
  CMD ["sh", "/start.sh"]