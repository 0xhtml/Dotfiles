#!/bin/bash

set -eu

dcraw -e *.RW2
mkdir -p raw
mv *.RW2 raw
