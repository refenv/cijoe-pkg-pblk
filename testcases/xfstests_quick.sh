#!/bin/bash
#
# Verify that pblk create/remove/recovery works
#
# This test runs trough a factory-create, remove, recover remove sequence
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

xfstests::run "-g quick"
if [[ $? -ne 0 ]]; then
   xfstests::cleanup
   test::fail "At least one xfs test failed"
fi

xfstests::cleanup

test::pass
