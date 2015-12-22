#!/usr/bin/env bash

. ${BUILDPACK_TEST_RUNNER_HOME}/lib/test_utils.sh

testDownloadsBuck()
{
  cp -r ${BUILDPACK_HOME}/test/fixtures/simple_valid/. ${BUILD_DIR}

  compile

  assertTrue "Should have .buck/bin/buck" "[ -f ${BUILD_DIR}/.buck/bin/buck ]"
}

