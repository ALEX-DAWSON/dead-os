#!/usr/bin/env bash

LABEL="AHHHHHH"
ILABEL="Yolo?"

fzf $3 -m --preview-border --preview-label "$LABEL" --input-label "$ILABEL" --preview="ueberzugpp cmd -s $SOCKET"
