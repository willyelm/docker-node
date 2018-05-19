#!/bin/bash

install () {
  ARCH=${2:-linux-x64}
  VERSION=$1
  OUT=${3:-/root}
  echo "Installing node $VERSION-$ARCH on $OUT"
  curl -O https://nodejs.org/dist/v$VERSION/node-v$VERSION-$ARCH.tar.gz
  tar -xzvf node-v$VERSION-$ARCH.tar.gz -C $OUT
  rm -R node-v$VERSION-$ARCH.tar.gz
  for binary in $OUT/node-v$VERSION-$ARCH/bin/*
  do
    ln -s $binary /usr/local/bin/
  done
}

prepare () {
  apt update -y
  apt install curl -y
}

clean () {
  apt --purge autoremove curl -y
  apt autoclean -y
}

prepare && install $NODE_VERSION && clean

node -v
npm -v