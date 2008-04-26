#!/bin/sh
for i in starinput  starutils stargraphics  starmath; do
  (cd $i; git push)
done
