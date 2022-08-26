#!/bin/bash

src_dir=/data
dest_dir=/root
curr_time=$(date "+%Y-%m-%d-%H-%M-%s")

#echo "${curr_time}"

backup_file=$dest_dir/$curr_time.tar

tar -Pcvf ${backup_file} $src_dir

echo "Backup complete"
