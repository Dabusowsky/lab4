#!/bin/bash

if [[ "$1" == "--help" || "$1" == "-h" ]]; then
  echo "Dostępne opcje:"
  echo "--date | -d - wyświetla dzisiejszą datę"
  echo "--logs | -l [liczba] - tworzy pliki log (domyślnie 100)"
  echo "--error | -e [liczba] - tworzy pliki error (domyślnie 100)"
  echo "--init - klonuje repozytorium i dodaje do PATH"
  echo "--help | -h - wyświetla tę pomoc"
elif [[ "$1" == "--date" || "$1" == "-d" ]]; then
  date
elif [[ "$1" == "--logs" || "$1" == "-l" ]]; then
  count=${2:-100}
  for ((x=1; x<=$count; x++)); do
    echo "Nazwa pliku: log$x.txt" > log$x.txt
    echo "Nazwa skryptu: skrypt.sh" >> log$x.txt
    echo "Data utworzenia: $(date)" >> log$x.txt
  done
fi
elif [[ "$1" == "--init" ]]; then
  git clone https://github.com/twoje-repo/projekt-git.git
  export PATH=$PATH:$(pwd)/projekt-git
  echo "Repozytorium sklonowane i dodane do PATH"
elif [[ "$1" == "--error" || "$1" == "-e" ]]; then
  count=${2:-100}
  for ((x=1; x<=$count; x++)); do
    mkdir -p error$x
    echo "Nazwa pliku: error$x.txt" > error$x/error$x.txt
    echo "Nazwa skryptu: skrypt.sh" >> error$x/error$x.txt
    echo "Data utworzenia: $(date)" >> error$x/error$x.txt
  done
fi
