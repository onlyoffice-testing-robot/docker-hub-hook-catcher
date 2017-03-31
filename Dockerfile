FROM ruby:2.4.1

MAINTAINER Pavel.Lobashov "shockwavenn@gmail.com"

COPY . /root/docker-hub-hook-catcher
WORKDIR /root/docker-hub-hook-catcher
RUN bundle install
EXPOSE 80
CMD ruby dockerhub_hook_catcher.rb -p 80 -o 0.0.0.0