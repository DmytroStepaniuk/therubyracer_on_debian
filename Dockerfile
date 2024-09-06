FROM ruby:2.5.7

RUN apt-get update && apt-get install -y \
    build-essential \
    libv8-dev \
    nodejs

WORKDIR /app

RUN gem install libv8 -v '3.16.14.19.1' -- --with-system-v8
RUN gem install therubyracer -v '0.12.3' -- --with-system-v8

RUN echo "require 'v8'\n" > test_therubyracer.rb && \
    echo "puts 'therubyracer is working!'\n" >> test_therubyracer.rb && \
    echo "context = V8::Context.new\n" >> test_therubyracer.rb && \
    echo "puts context.eval('3 + 3')\n" >> test_therubyracer.rb

CMD ["ruby", "test_therubyracer.rb"]
