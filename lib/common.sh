#!/usr/bin/env bash

function indent() {
  c='s/^/       /'
  case $(uname) in
    Darwin) sed -l "$c";;
    *)      sed -u "$c";;
  esac
}

install_ant() {
  local targetDir=$1

  ANT_VER="1.9.6"
  ANT_URL="http://archive.apache.org/dist/ant/binaries/apache-ant-$ANT_VER-bin.tar.gz"
  ANT_HOME=$targetDir/apache-ant-$ANT_VER

  if [ ! -d $ANT_HOME ]; then
    status_pending "Installing Ant"
    pushd $targetDir
    curl --max-time 180 --location ${ANT_URL} | tar xz
    popd
    chmod +x $ANT_HOME/bin/ant
    status_done
  else
    status "Ant is up-to-date"
  fi

	export PATH="${ANT_HOME}/bin:${PATH}"

	ant -version | indent
}

install_buck() {
  local targetDir=$1
  BUCK_HOME=$targetDir/.buck

  if [ ! -d $BUCK_HOME ]; then
    status_pending "Installing Buck"
    buckUrl="https://github.com/facebook/buck.git"
    git clone ${buckUrl} ${BUCK_HOME}
    status_done
  else
    status_pending "Updating Buck"
    pushd ${BUCK_HOME}
    git fetch --all | indent
    git reset --hard origin/master | indent
    popd > /dev/null
    status_done
  fi
  export PATH="${BUCK_HOME}/bin:${PATH}"

  buck --version | indent
}