#!/usr/bin/env bash

. ${BUILDPACK_TEST_RUNNER_HOME}/lib/test_utils.sh

testDownloadsBuck()
{
  cp -r ${BUILDPACK_HOME}/test/fixtures/simple_valid/. ${BUILD_DIR}

  compile

  cat ${STD_OUT}
  cat ${STD_ERR}

  assertTrue "Failed to find .buck/bin/buck in ${CACHE_DIR}" "[ -f ${CACHE_DIR}/.buck/bin/buck ]"
}

