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

nvme::env

if [ -z $LNVM_BGN ]; then
  LNVM_BGN=0
fi
if [ -z $LNVM_END ]; then
  LNVM_END=$(($NVME_LNVM_TOTAL_LUNS - 1))
fi

nvme::exists
if [[ $? -eq 0 ]]; then
  NVM_DEV_NAME="/dev/$NVME_DEV_NAME"
fi

if ! lnvm::create; then
	test::fail
fi

if ! lnvm::remove; then
	test::fail
fi

if ! lnvm::recover; then
	test::fail
fi

if ! lnvm::remove; then
	test::fail
fi

test::pass
