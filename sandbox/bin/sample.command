#! /bin/sh

DIR=`dirname $0`
NAME=`basename $0`

echo "--- VM ---"
cd $DIR/../vm
vagrant up
vagrant ssh -c "/vagrant/sandbox/bin/local/$NAME"
