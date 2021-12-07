#!/bin/sh

ICON1="" # icon for normal temperatures

ram=$(free | grep Mem | awk '{print 100.0 * $3/$2}')

printf "$ICON1 %.1f%%" "$ram"
