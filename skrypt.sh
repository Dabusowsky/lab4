#!/bin/bash
if [ "$1" == "--logs" ]; then
  count=${2:-100}
  for ((x=1; x<=$count; x++)); do
    echo "Nazwa pliku: log$x.txt" > log$x.txt
    echo "Nazwa skryptu: skrypt.sh" >> log$x.txt
    echo "Data utworzenia: $(date)" >> log$x.txt
  done
fi
