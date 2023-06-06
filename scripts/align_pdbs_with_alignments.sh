#!/bin/bash
#
# Copyright 2021 AlQuraishi Laboratories
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Align MSAs with pdbs, delete unaligned pdbs or MSAs

ALIGNMENT_DIR=$1
PDB_DIR=$2

for d in $(find $ALIGNMENT_DIR -mindepth 1 -maxdepth 1 -type d); do
    BASENAME=$(basename $d)
    PDB_ID=$(echo $BASENAME | cut -d '_' -f 1)
    CIF_PATH="${PDB_DIR}/${PDB_ID}.cif"
    if [[ ! -f $CIF_PATH ]]; then
        echo "delete alignment: ${d}"
        rm -rf $d
    fi
done

for d in $(find PDB_DIR -mindepth 1 -maxdepth 1 -type d); do
    BASENAME=$(basename $d)
    PDB_ID=$(echo $BASENAME | cut -d '_' -f 1)
    ALIGNMENT_PATH="${ALIGNMENT_DIR}/${PDB_ID}"
    if [[ ! -f $ALIGNMENT_PATH ]]; then
        echo "delete pdb: ${d}"
        rm -rf $d
    fi
done