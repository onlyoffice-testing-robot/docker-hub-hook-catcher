FROM ruby:2.6

MAINTAINER Pavel.Lobashov "shockwavenn@gmail.com"

RUN gem install bundler
COPY . /root/docker-hub-hook-catcher
WORKDIR /root/docker-hub-hook-catcher
RUN bundle install --without development test
EXPOSE 80
CMD ruby dockerhub_hook_catcher.rb -p 80 -o 0.0.0.0