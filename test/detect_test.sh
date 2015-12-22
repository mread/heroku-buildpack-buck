#!/usr/bin/env bash

. ${BUILDPACK_TEST_RUNNER_HOME}/lib/test_utils.sh

testFindsDotBuckconfig()
{
  cp -r ${BUILDPACK_HOME}/test/fixtures/simple_valid/. ${BUILD_DIR}

  detect
  assertCapturedSuccess
  assertCaptured "Buck"
}

testFailsIfNoBuckconfig()
{
  cp -r ${BUILDPACK_HOME}/test/fixtures/missing_buckconfig/. ${BUILD_DIR}

  detect
  assertCapturedError "Couldn't find .buckconfig"
}