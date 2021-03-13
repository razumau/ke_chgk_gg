FROM ruby:3.0-rc

RUN apt-get update && \
    apt-get install --no-install-recommends -y yarn && \
    rm -rf /var/lib/apt/lists/*

RUN bundle config --global frozen 1

WORKDIR /app

ADD Gemfile /app/
ADD Gemfile.lock /app/
RUN bundle install

ADD .ruby-version /app/
ADD config.ru /app/
ADD db /app/db/
ADD public /app/public
ADD lib /app/lib
ADD config /app/config
ADD app /app/app
ADD bin /app/bin

EXPOSE 3000
CMD ["rails", "server", "-b", "0.0.0.0"]
