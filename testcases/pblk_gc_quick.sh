#!/bin/bash
#
# A quick test, verifying that gc works
#
# This test fills the drive with sequential writes, then does 4k random writes
# while verifying
# 
#!/bin/bash

CIJ_TEST_NAME=$(basename $BASH_SOURCE)
source $CIJ_ROOT/modules/cijoe.sh

test::enter

FIOJOBS="gc_quick.fio"

if ! lnvm::create; then
	test::fail
fi

FIO_FILENAME=$LNVM_DEV_PATH
FIO_JOBFILE="$CIJ_TESTFILES/$FIOJOBS"
FIO_OUTPUT="/tmp/$FIOJOBS.result.json"
FIO_ARGS_EXTRA="--output-format=json"


fio::run_jobfile $FIO_JOBFILE; 
RES=$?

ssh::pull ${FIO_OUTPUT} $CIJ_TEST_AUX_ROOT/

if [[ $RES -ne 0 ]]; then
   lnvm::remove
   test::fail
fi

if ! lnvm::remove; then
   test::fail
fi

test::pass
