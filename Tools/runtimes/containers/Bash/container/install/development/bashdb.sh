#!/usr/bin/env bash

set -e

# Install Bash Debugger

## Install dependencies
DEBIAN_FRONTEND=noninteractive apt-get install -y texinfo git dh-autoreconf make 

## Get source code
cd /tmp  
git clone --depth 1 --branch bash-5.2 https://github.com/rocky/bashdb.git 

## Compile
cd /tmp/bashdb
./autogen.sh 
make test-unit 
make test-integration 
make 

## Install
make install         

## Clean up
cd /tmp
rm -Rf *

    