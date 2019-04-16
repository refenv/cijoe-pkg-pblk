#!/bin/bash
#
# ZBD blktests
#
# Run the zbd tests from blktests
#

CIJ_TEST_NAME=$(basename "${BASH_SOURCE[0]}")
export CIJ_TEST_NAME
# shellcheck source=modules/cijoe.sh
source "$CIJ_ROOT/modules/cijoe.sh"
test::require blktests
test::enter

if ! blktests::run "$CIJ_TEST_AUX_ROOT" "tests/zbd"; then
  test::fail
fi

test::pass
