#!/bin/bash
# Imprimir el nombre del script
echo "Nombre del script: $0"

# Imprimir el número de argumentos pasados al script
echo "Número de argumentos: $#"

# Imprimir el primer y segundo argumento en la misma línea
echo "Primer y segundo argumentos: $1 $2"

# Imprimir los argumentos a partir del tercero (si existen) en líneas separadas
if [ $# -gt 2 ]; then
  echo "Argumentos a partir del tercero:"
  shift 2
  for arg in "$@"; do
    echo "$arg"
  done
fi
