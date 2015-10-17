FROM ruby:2.1.6

# see update.sh for why all "apt-get install"s have to stay as one long line
RUN apt-get update && apt-get install -y nodejs --no-install-recommends && rm -rf /var/lib/apt/lists/*
#RUN apt-get install -y build-essential mysql-client postgresql-client sqlite3 --no-install-recommends

ENV RAILS_VERSION 4.2.3
ENV RAILS_ENV production

RUN gem install rails --version "$RAILS_VERSION"
RUN gem install foreman

RUN mkdir /www
WORKDIR /www
RUN mkdir lwnotary-datalake

ADD . lwnotary-datalake
WORKDIR lwnotary-datalake

RUN mkdir -p tmp/pids
RUN mkdir log

RUN bundle install
EXPOSE 3000
CMD bundle exec rake assets:precompile && foreman start -f Procfile
