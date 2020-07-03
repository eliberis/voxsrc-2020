#!/bin/bash
# @TODO run this in the components container the same was as defined in the component.yaml
# @param --skip-data-fetch to read local data that was already fetched from GCS
# @note Flags for the "small" dataset:
#         --test_list=vox1_test_list_small.txt \
#         --train_list=vox2_train_list_small.txt \
#         --test_path=voxceleb1-small-wav.tar.gz \
#         --train_path=voxceleb2-small-m4a.tar.gz

python3 src/preproc.py --data-bucket=voxsrc-2020-voxceleb-v4 --test_list=vox1_no_cuda.txt --train_list=vox2_no_cuda.txt --test_path=vox1_no_cuda.tar.gz --train_path=vox2_no_cuda.tar.gz
