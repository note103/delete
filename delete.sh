#!/bin/sh

trashbox=~/tmp_trash;
datetime=$(date +%Y-%m-%d-%H-%M-%S)

path=$(pwd)

selector="cho"
if [[ $1 =~ - ]] || [[ $2 =~ - ]] ; then
    if [[ $1 =~ p ]] || [[ $2 =~ p ]] ; then
        selector="peco"
    fi
    opt=""
    if [[ $1 =~ a ]] || [[ $2 =~ a ]] ; then
        opt="-a"
    fi
fi

ls=$(ls -F $opt)
basename=$(for i in exit $ls ; do echo $i; done | $selector)
id=$(find . -name "$dir" -maxdepth 1 |  echo "$datetime"_"$basename")

if [ -e "$basename" ] ; then
    mv "$basename" "$id"
    mv "$id" "$trashbox/"
    echo "$basename\t->\t$trashbox/$basename";
else
    echo 'No such data.'
fi
