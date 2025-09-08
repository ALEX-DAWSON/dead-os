#!/usr/bin/env bash

helper=paru
config=$HOME/.config

get() {
    cd &&
    git clone https://aur.archlinux.org/$helper.git
}

build() {
    cd $helper &&
    makepkg -si &&
    cd
}

update() {
    cd $HOME/$helper &&
    git pull &&
    makepkg -si &&
    cd
}

depend() {
    cd
    list=$config/aur-dependencies.txt

    $helper -S - < $list
}
        
case $1 in
    depend)
        depend
    ;;
    *)
        if [ ! -d $HOME/$helper ]
        then
            get &&
            build &&
            depend
        else 
            update
        fi
    ;;
esac
