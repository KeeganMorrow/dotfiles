#!/usr/bin/env bash

clang_executables="\
clang
clang++
clang-apply-replacements
clang-change-namespace
clang-check
clang-check
clang-cl
clang-format
clang-format-diff
clang-include-fixer
clang-query
clang-rename
clang-reorder-fields
clang-tblgen
clang-tidy
clangd
"

confirm_always=-1

usage(){
    echo "Sets up symbolic links for the specified clang version"
    echo "usage $0 clangversion"
    echo "Where clangversion is the version of clang to use"
    echo "If clangversion is not set then it will list possible versions"
    echo "as well as list the currently linked locations"
}

do_confirm(){
    result="$confirm_always"
    while [ "$result" -eq -1 ]; do
        read -p "Really overwrite existing link?(a/n/y/q) " -r
        if [[ "$REPLY" =~ ^[Aa]$ ]];then
            result=1
            confirm_always=1
        elif [[ "$REPLY" =~ ^[Nn]$ ]];then
            result=0
        elif [[ "$REPLY" =~ ^[Qq]$ ]];then
            echo "Exiting"
            exit 1
        elif [[ "$REPLY" =~ ^[Yy]$ ]];then
            result=1
        fi
    done
    return $result
}

do_locate_clang(){
    clangwver=""
    clangnovers=""
    for path in ${PATH//:/ }; do
        clangwver=$clangwver$(find "$path" -regex '.*/clang-\([0-9]\.?\)+' 2> /dev/null)
        clangnovers=$clangnovers$(find "$path" -name "clang" 2> /dev/null)
    done
    echo "Clang Executables with versions in PATH:"
    for clangfile in $clangwver; do
        ver=$(echo "$clangfile" | cut -d '-' -f 2)
        echo "    $ver at path $clangfile"
    done
    echo "Clang Executables in PATH:"
    for clangfile in $clangnovers; do
        if [ -L "$clangfile" ];then
            echo "    Link: $clangfile -> $(readlink "$clangfile")"
        elif [ -f "$clangfile" ];then
            echo "    File: $clangfile"
        fi
    done
    exit

}

do_link_clang(){
    version="$1"

    echo "Using version $version of clang"
    for executable in $clang_executables; do
        origin_path=$(which "${executable}-${version}")
        link_path=$(dirname "$origin_path")/$executable
        echo
        if [ -f "$origin_path" ];then
            if [ ! -f "$link_path" ];then
                echo "Creating link to $origin_path at $link_path"
                ln -s "$origin_path" "$link_path"
            elif [ -L "$link_path" ];then
                echo "Warning: Link already exists at $link_path"
                do_confirm
                if [ $? -eq 1 ]; then
                    echo "Creating link to $origin_path at $link_path"
                    ln -sf "$origin_path" "$link_path"
                else
                    echo "Not creating link to $origin_path at $link_path"
                fi
            else
                echo "Warning: File exists in link_path $link_path"
            fi
        else
            echo "Warning: Could not find original file $executable-$version"
        fi
    done
}

if [ "$#" -eq 0 ];then
    do_locate_clang
    exit "$?"
elif [ "$#" -ne 1 ];then
    usage
    exit 1
else
    do_link_clang "$1"
    exit "$?"
fi
