#!/bin/bash

set -euo pipefail

declare -i RESULT=0

pushd runtime/JavaScript

  echo "running jasmine tests..."
  npm test
  RESULT+=$?

popd

pushd runtime-testsuite

  echo "running maven tests..."
  mvn -Dtest=javascript.** test
  RESULT+=$?

popd

exit $RESULT
