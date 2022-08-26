#!/bin/bash

ram=$(grep MemTotal /proc/meminfo  | awk '{print $2}')
cpu=$(nproc)

# echo "ram = $ram cpu = $cpu"
# let x=[[ ${cpu} -lt 2 && ${ram} > 4095899 ]]
# echo $x

if [[ ${cpu} -lt 2 || ${ram} -lt 5097152 ]]
then
        echo "Your system ram and CPU not according to K8s standards (min 2GB Ram and 2 CPU is require)"
        exit 1
fi

name="rohan"
NAME="test"
nAme=test"1"

echo "${name}"
echo "${NAME}"
echo "${nAme}"

