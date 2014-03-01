#! /bin/sh

set -e
DIR=`dirname $0`

cd $DIR/../../../app/sample

echo '----------------------------------------------------------------'
echo '*** Reset Database *** Press Ctrl-D to continue or Ctrl-C to abort.'
echo '----------------------------------------------------------------'

cat > /dev/null

bundle install
bundle exec rake db:setup
