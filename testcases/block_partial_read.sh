#!/bin/bash
#
# HANS FIX THE SHORT DESCRIPTION
#
# HANS FIX THE LONG DESCRIPTION
#
CIJ_TEST_NAME=$(basename "${BASH_SOURCE[0]}")
export CIJ_TEST_NAME
# shellcheck source=modules/cijoe.sh
source "$CIJ_ROOT/modules/cijoe.sh"
test::enter
test::require block

job_fname="block_partial_read.fio"
export FIO_FILENAME="$BLOCK_DEV_PATH"
export FIO_JOBFILE="$CIJ_TESTFILES/$job_fname"
export FIO_OUTPUT="/tmp/$job_fname.result.json"
export FIO_ARGS_EXTRA="--output-format=json"

res=0

if ! fio::run_jobfile "$FIO_JOBFILE"; then
  cij::err "failed running fio"
  res=$(( res + 1 ))
fi

if ! ssh::pull "$FIO_OUTPUT" "$CIJ_TEST_AUX_ROOT/"; then
  cij::err "failed retrieving fio output"
  res=$(( res + 1 ))
fi

test::exit $res
