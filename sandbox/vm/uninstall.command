#! /bin/sh

DIR=`dirname $0`

cd $DIR
vagrant halt
vagrant destroy

