#!/usr/bin/env bash
# adds trailing semicolons to end of every line
# Warning, this might not be what you want. Look out for empty lines and contues
sed -e's/$/ ;/' < $1 > $2 