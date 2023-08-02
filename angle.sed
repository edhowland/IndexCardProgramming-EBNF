#!/usr/bin/env bash


 sed   -E 's/([A-Z][a-zA-Z]+)/<\1>/g'   < $1  >  $2 
