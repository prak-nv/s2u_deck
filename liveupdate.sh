#!/usr/bin/env bash

while true; do 
  inotifywait -q -e close_write `ls *.dot` 
  for f in `ls *.dot`; do
     echo updating ${f}
     dot -Tsvg ${f} -o ${f}.svg;
     dot -Tpng ${f} -o ${f}.png;
  done
done
