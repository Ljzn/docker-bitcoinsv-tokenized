#!/bin/bash
#
# Config for a standalone contract instance.
#

# the local node to connect to.
export NODE_ADDRESS=127.0.0.1:8333

# Name of your smartcontract instance.
export OPERATOR_NAME=Standalone

# A local node you can communicate with.
export RPC_HOST=127.0.0.1:8332
export RPC_USERNAME=root
export RPC_PASSWORD=bitcoin

# The address to pay fees to
export FEE_ADDRESS=1EMHJsiXjZmffBUWevGS5mWdoacmpt8vdH
export FEE_VALUE=2000

# Your key in WIF format (this is an example)
export PRIV_KEY=Kx83ACqTy1EVasPzY9nPecfhbRwnqS1Gpjw2nUqxkD6ATc8dBEeW

# Where to store contract state. This example would store files in the
# ~/tmp/standalone directory.
export CONTRACT_STORAGE_ROOT=./tmp
export CONTRACT_STORAGE_BUCKET=standalone

# SPVnode storage
export NODE_STORAGE_ROOT=./tmp
export NODE_STORAGE_BUCKET=standalone