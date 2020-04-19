ARG RUBY_VERSION=2.7-alpine

# build
FROM ruby:${RUBY_VERSION} AS build

RUN apk add --update \
    alpine-sdk

WORKDIR /build
ADD . .

RUN bundle install && \
    bundle exec rake install

# run
FROM ruby:${RUBY_VERSION} AS run

WORKDIR /app
COPY --from=build /usr/local/bundle /usr/local/bundle
COPY --from=build /build/config.ru .

CMD unicorn
