#!/usr/bin/env bash

export DOT="$$DOT"

for file in $DOT/**/*.function; do
    source $file
done
