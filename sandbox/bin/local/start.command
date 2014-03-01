#! /bin/sh

set -e
DIR=`dirname $0`

cd $DIR/../..
foreman start
