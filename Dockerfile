FROM ruby:2.1.5

# see update.sh for why all "apt-get install"s have to stay as one long line
RUN apt-get update && apt-get install -y nodejs --no-install-recommends && rm -rf /var/lib/apt/lists/*
#RUN apt-get install -y build-essential mysql-client postgresql-client sqlite3 --no-install-recommends

ENV RAILS_VERSION 4.2.3

RUN gem install rails --version "$RAILS_VERSION"

RUN mkdir /www
WORKDIR /www
RUN mkdir lwnotary-datalake

ADD . lwnotary-datalake
WORKDIR lwnotary-datalake

RUN bundle install
RUN rake db:migrate
RUN RAILS_ENV=production bundle exec rake assets:precompile --trace
EXPOSE 3000
CMD ["rails","server","-b","0.0.0.0"]
