FROM binaryphile/ruby:2.0.0-p247
RUN echo "deb http://ru.archive.ubuntu.com/ubuntu/ precise main restricted universe multiverse" >> /etc/apt/sources.list
RUN apt-get update -qq && apt-get install -y libcurl3 libcurl3-gnutls libcurl4-openssl-dev curl build-essential libpq-dev libxml2 zlib1g-dev libncurses5-dev libncurses5 libxslt-dev libxml2-dev libssl-dev libyaml-dev libffi-dev make autoconf libmagickcore-dev libmagickwand-dev imagemagick wget iptables inetutils-ping telnet sudo postgresql-client
ENV APP_HOME /web
RUN mkdir $APP_HOME
WORKDIR $APP_HOME

ADD Gemfile* $APP_HOME/

ENV BUNDLE_GEMFILE=$APP_HOME/Gemfile \
  BUNDLE_JOBS=2 \
  BUNDLE_PATH=/bundle

RUN bundle install
RUN gem install foreman

ADD . $APP_HOME
