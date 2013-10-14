#!/bin/bash

TIME=`LC_ALL=C date +%F_%R`

git commit -a -m "modified on $TIME"
