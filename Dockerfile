FROM ruby:2.1.6

# see update.sh for why all "apt-get install"s have to stay as one long line
RUN apt-get update && apt-get install -y nodejs --no-install-recommends && rm -rf /var/lib/apt/lists/*
#RUN apt-get install -y build-essential mysql-client postgresql-client sqlite3 --no-install-recommends

ENV RAILS_VERSION 4.2.3
ENV RAILS_ENV production
ENV RAILS_SERVE_STATIC_FILES true

RUN gem install rails --version "$RAILS_VERSION"

# Install Nginx.
RUN apt-get update && apt-get install -y nginx
# RUN echo "\ndaemon off;" >> /etc/nginx/nginx.conf
# RUN chown -R www-data:www-data /var/lib/nginx
# # Add default nginx config
ADD unicorn-nginx.conf /etc/nginx/sites-enabled/default

RUN mkdir /data
RUN mkdir /data/lwnotary-datalake-uploads
RUN mkdir /www
WORKDIR /www
RUN mkdir lwnotary-datalake

ADD . lwnotary-datalake
WORKDIR lwnotary-datalake

RUN mkdir -p tmp/pids
RUN mkdir log

RUN bundle install
EXPOSE 3000
CMD ["sh", "start.sh"]
