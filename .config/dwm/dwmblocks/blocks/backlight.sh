#!/bin/sh

blt=`xbacklight -get`
ICON=""

printf "$ICON $blt%%"
