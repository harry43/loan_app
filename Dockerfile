FROM ruby:3.0.1

ENV INSTALL_PATH /opt/app

RUN apt-get update && apt-get install -y postgresql-client nodejs 
RUN mkdir -p $INSTALL_PATH
RUN gem install rails -v 7.0.5

WORKDIR /opt/app

COPY Gemfile* .

RUN bundle install

COPY . .

EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]
