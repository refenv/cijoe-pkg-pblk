#!/bin/bash
#
# Verify that previos regressions found in pblk by xfstest do not cree up again
#
CIJ_TEST_NAME=$(basename "${BASH_SOURCE[0]}")
export CIJ_TEST_NAME
# shellcheck source=modules/cijoe.sh
source "$CIJ_ROOT/modules/cijoe.sh"
test::enter
test::require block

xfstests::prepare
if [[ $? -ne 0 ]]; then
   test::fail "Failed to prepare for test"
fi

xfstests::run "generic/127"
if [[ $? -ne 0 ]]; then
   xfstests::cleanup
   test::fail "At least one xfs test failed"
fi


xfstests::cleanup

test::pass
