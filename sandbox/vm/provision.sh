#! /bin/sh

set -e
export PATH=/usr/local/bin:/usr/local/sbin:$PATH

VERSION_FILE=/root/.provisioning_version

if [ -f $VERSION_FILE ]; then
  CURRENT_VERSION=`cat $VERSION_FILE`
else
  CURRENT_VERSION='0'
fi

echo "Current version: $CURRENT_VERSION"

# Version 1: locale, ruby, mysql, nginx, global gems
VERSION=1
if [ $CURRENT_VERSION -lt $VERSION ]; then
  echo "--- $VERSION ---"

  localedef -f UTF-8 -i ja_JP ja_JP.UTF-8

  # Slow networking (due to IPv6?) on CentOS 6.x
  # https://github.com/mitchellh/vagrant/issues/1172
  echo 'options single-request-reopen' >> /etc/resolv.conf

  # ruby-install
  RUBY_INSTALL_VERSION=0.3.4
  RUBY_INSTALL=ruby-install-$RUBY_INSTALL_VERSION
  RUBY_INSTALL_URL=https://github.com/postmodern/ruby-install/archive/v$RUBY_INSTALL_VERSION.tar.gz

  curl -L $RUBY_INSTALL_URL > $RUBY_INSTALL.tar.gz
  tar -xzvf $RUBY_INSTALL.tar.gz
  cd $RUBY_INSTALL && make install
  rm -rf $RUBY_INSTALL.tar.gz $RUBY_INSTALL

  ruby-install -i /usr/local ruby 2.0.0 -- --disable-install-doc
  echo "install: --no-rdoc --no-ri" > /usr/local/etc/gemrc
  gem install bundler

  # mysql, nginx
  yum install -y mysql-server mysql-devel
  yum install -y nginx
  chmod 777 /var/log/nginx
  chkconfig --level 2345 mysqld on
  /etc/init.d/mysqld start

  # gems
  gem install rails
  gem install foreman

  echo $VERSION > $VERSION_FILE
fi

# Version 2: create sample rails app
VERSION=2
if [ $CURRENT_VERSION -lt $VERSION ]; then
  echo "--- $VERSION ---"

  cd /vagrant/app
  rails new sample -d mysql -s

  echo >> /vagrant/app/sample/Gemfile
  echo "gem 'therubyracer'" >> /vagrant/app/sample/Gemfile

  chown -R vagrant:vagrant /vagrant/app/sample
  cd /vagrant/app/sample
  sudo -u vagrant PATH=/usr/local/sbin:/usr/local/bin:$PATH bundle exec rake db:create

  echo $VERSION > $VERSION_FILE
fi


<<'COMMENT'
VERSION=0
if [ $CURRENT_VERSION -lt $VERSION ]; then
  echo "--- $VERSION ---"
  # do something.
  echo $VERSION > $VERSION_FILE
fi
COMMENT
