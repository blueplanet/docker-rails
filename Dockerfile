FROM ruby:2.2

# see update.sh for why all "apt-get install"s have to stay as one long line
RUN apt-get update && apt-get install -y nodejs --no-install-recommends && rm -rf /var/lib/apt/lists/*

# see http://guides.rubyonrails.org/command_line.html#rails-dbconsole
RUN apt-get update && apt-get install -y mysql-client postgresql-client sqlite3 --no-install-recommends && rm -rf /var/lib/apt/lists/*

# try for optional package
RUN apt-get install -y qt5-default libqt5webkit5-dev

ENV RAILS_VERSION 4.2.1

RUN gem install rails --version "$RAILS_VERSION"
