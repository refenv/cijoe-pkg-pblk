#!/bin/bash
#
# Verify that writing/reading using DD works for a small amount of data
#
#

CIJ_TEST_NAME=$(basename "${BASH_SOURCE[0]}")
export CIJ_TEST_NAME
# shellcheck source=modules/cijoe.sh
source "$CIJ_ROOT/modules/cijoe.sh"
test::enter
test::require block
set -e

if ! ssh::cmd "head -c 32k </dev/urandom >/tmp/32k_random.dat"; then
  test::fail
fi

if ! ssh::cmd "dd if=/tmp/32k_random.dat of=$BLOCK_DEV_PATH bs=32k count=1 seek=0 oflag=direct"; then
  test::fail
fi

if ! ssh::cmd "dd of=/tmp/32k_random.verify if=$BLOCK_DEV_PATH bs=32k skip=0 count=1 iflag=direct"; then
  test::fail
fi

if ! ssh::cmd "diff /tmp/32k_random.dat /tmp/32k_random.verify"; then
  test::fail
fi

if ! ssh::cmd "head -c 48k </dev/urandom >/tmp/48k_random.dat"; then
  test::fail
fi

if ! ssh::cmd "dd if=/tmp/48k_random.dat of=$BLOCK_DEV_PATH bs=24k count=2 seek=0 oflag=direct"; then
  test::fail
fi

if ! ssh::cmd "dd of=/tmp/48k_random.verify if=$BLOCK_DEV_PATH bs=24k skip=0 count=2 iflag=direct"; then
  test::fail
fi

if ! ssh::cmd "diff /tmp/48k_random.dat /tmp/48k_random.verify"; then
  test::fail
fi

