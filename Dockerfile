FROM ruby:2.5.7

RUN apt-get update && apt-get install -y \
    build-essential \
    libv8-dev \
    nodejs

WORKDIR /usr/src/app

RUN echo "source 'https://rubygems.org'\n" > Gemfile && \
    echo "gem 'therubyracer', '~> 0.12.3'\n" >> Gemfile

RUN bundle config build.libv8 -- --with-system-v8
RUN bundle config build.therubyracer -- --with-system-v8

RUN bundle install

RUN echo "require 'v8'\n" > test_therubyracer.rb && \
    echo "puts 'therubyracer is working!'\n" >> test_therubyracer.rb && \
    echo "context = V8::Context.new\n" >> test_therubyracer.rb && \
    echo "puts context.eval('3 + 3')\n" >> test_therubyracer.rb

CMD ["ruby", "test_therubyracer.rb"]
