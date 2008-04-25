#!/bin/sh
git submodule init && git submodule update
for i in stargraphics  starinput  starmath  starutils; do
 (cd $i; git checkout master)
done
