#! /bin/sh

DIR=`dirname $0`

cd $DIR/../vm
vagrant up
vagrant provision
