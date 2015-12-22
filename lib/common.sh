#!/usr/bin/env bash

install_buck() {
  local buildDir=$1
  buckHome=$buildDir/.buck

  if [ ! -d $buckHome ]; then
    status_pending "Installing Buck"
    buckUrl="https://github.com/facebook/buck.git"
    git clone ${buckUrl} ${buckHome}
    status_done
  else
    pushd ${buckHome}
    git fetch --all
    git reset --hard origin/master
    popd
  fi
}