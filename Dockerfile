FROM telegraf:1.5.0-alpine

RUN apk add --no-cache --update build-base ruby ruby-irb ruby-dev \
 && echo 'gem: --no-document' >> /etc/gemrc \
 && gem install fluentd:0.14.25 oj:2.18.3 json:2.1.0 fluent-plugin-elasticsearch:2.4.1 \
 && apk del build-base ruby-dev

CMD ["telegraf"]

