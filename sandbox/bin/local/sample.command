#! /bin/sh

set -e
DIR=`dirname $0`

cd $DIR/../../../app/sample

bundle install
bundle exec rake db:migrate
bundle exec rails server
