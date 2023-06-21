#!/bin/bash
#
# Materia: Administración de Sistemas en la Nube
# Actividad grupal: Programación en Bash
# Grupo: 1001 A
#
#  Escribir un script en Bash que acepte una ruta a un fichero o un directorio e imprima por pantalla
# si es un fichero normal, un directorio u otro tipo de fichero. Finalmente, el script ejecutará el
# comando ls sobre esta ruta en formato largo.

# Función para mostrar la ayuda
function ayuda {
    echo "Uso: $0 <ruta>"
    echo "Descripción: Este script acepta una ruta a un archivo o directorio y muestra su tipo (fichero normal, directorio u otro tipo)."
    echo "Finalmente, ejecuta el comando 'ls' en formato largo sobre la ruta especificada."
    echo
    echo "Argumento:"
    echo "  <ruta>    Ruta al archivo o directorio a analizar."
}

# Verificar si se proporciona una ruta como argumento
if [[ $# -eq 0 ]] || [[ $# -gt 1 ]]; then
    ayuda
    exit 1
fi

# Verificar si se solicita ayuda
if [[ "$1" = "-h" ]] || [[ "$1" = "--help" ]]; then
    ayuda
    exit 0
fi

ruta=$1

# Verificar si la ruta existe
if [[ ! -e "$ruta" ]]; then
    echo "La ruta no existe."
    exit 1
fi

# Comprobar el tipo de parámetro
if [[ -f "$ruta" ]]; then
    echo "El archivo es un archivo normal."
elif [[ -d "$ruta" ]]; then
    echo "El archivo es un directorio."
else
    echo "El archivo es de otro tipo."
fi

# Ejecutar el comando ls en formato largo
ls -l "$ruta"
