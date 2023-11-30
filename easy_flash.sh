#!/bin/bash
#author : xiaodao.chen
check_param(){
    if [ "$#" -lt 2 ]; then
        echo "Usage: $0 <iso_path> <U_disk>"
        echo "if you don't know your u_disk, input df -h in new terminal to check it "
        exit 1 
    fi
}

iso_path() {
    if test -e "$1"; then
        echo "path : $1"
    else 
        echo "please give a correct path"
        exit 1
    fi
}

U_disk(){
    if  df -h | grep -q $1; then
        echo $1
    else
        echo "please give a correct U disk"
        exit 1
    fi 
}

check_param $1 $2
iso_path $1
U_disk $2
sudo dd bs=4M if="$1" of="$2" && echo "please wait" sync
