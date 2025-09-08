#!/usr/bin/env bash

if [ ! -d $HOME/.config/spicetify ]
then
    mkdir $HOME/.config/spicetify
fi

spicetify backup apply
