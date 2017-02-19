#!/bin/sh

trashbox=${TMPTRASH:-$HOME/.Trash}

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

if [ -e "$trashbox" ] ; then
    if [ -e "$basename" ] ; then
        if [ ! -e "$trashbox/$basename" ] ; then
            mv "$basename" "$trashbox/"
        else
            datetime=$(date +%Y-%m-%d-%H-%M-%S)
            id=$(find . -name "$dir" -maxdepth 1 |  echo "$datetime"_"$basename")
            mv "$basename" "$id"
            mv "$id" "$trashbox/"
        fi
        echo "$basename\t->\t$trashbox/$basename";
    else
        echo 'No such data.'
    fi
else
    echo "No such a directory. Set the trashbox to '$trashbox'."
fi
