#!/bin/bash
#
# Materia: Administración de Sistemas en la Nube
# Actividad grupal: Programación en Bash
# Grupo: 1001 A"
#
# Escribir un script que imprima en este orden y en líneas diferentes:
#   - El nombre del script que se está ejecutando.
#   - El número de argumentos que se han pasado al script.
#   - El primer y segundo argumentos, ambos en la misma línea.
#   - Si hay más de dos argumentos, los argumentos a partir del tercero (este incluido) cada uno en una línea.

# Escribir el nombre del script
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
