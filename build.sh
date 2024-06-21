#!/bin/bash

mkdir build

cp src/git_switch_branch.sh build/git_switch_branch
cp src/nvm_select.sh build/nvm_select
cp src/opti-choice-common.sh build/opti-choice-common.sh

chmod +x build/nvm_select
chmod +x build/git_switch_branch

cd build
tar -czvf ../"optichoice-$1.tar.gz" *
cd ..

rm -fr build
