#!/usr/bin/env bash

install_buck() {
  local installDir=$1
  local buildDir=$2
  buckHome=$installDir/.buck

  status_pending "Installing Buck"
    buckUrl="https://github.com/facebook/buck.git"
    git clone ${buckUrl}
    status_done
}