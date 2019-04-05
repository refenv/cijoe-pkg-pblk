#!/usr/bin/env bash
#
# pblk
#
# Any specific pblk environments defaults goes here

export LNVM_DEV_TYPE=pblk

nvme::env
nvme::exists

if [[ $? -eq 0 ]]; then
  NVM_DEV_NAME="/dev/$NVME_DEV_NAME"
fi

if [ -z $LNVM_BGN ]; then
  LNVM_BGN=0
fi

if [ -z $LNVM_END ]; then
  LNVM_END=$(($NVME_LNVM_TOTAL_LUNS - 1))
fi

export BLOCK_DEV_NAME=$LNVM_DEV_NAME
export BLOCK_DEV_PATH=$LNVM_DEV_PATH
