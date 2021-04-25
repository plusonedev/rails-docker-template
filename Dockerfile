FROM ruby:2.7.3

WORKDIR /home/app

RUN apt-get update && apt-get install -y \
  curl \
  build-essential \
  libpq-dev &&\
  curl -sL https://deb.nodesource.com/setup_10.x | bash - && \
  curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
  echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
  apt-get update && apt-get install -y nodejs yarn

COPY Gemfile .
COPY Gemfile.lock .
RUN bundle install

COPY . .
RUN rails webpacker:install

# Add a script to be executed every time the container starts.
COPY entry-point.sh /usr/bin/.
RUN chmod +x /usr/bin/entry-point.sh
ENTRYPOINT ["/usr/bin/entry-point.sh"]
EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]
