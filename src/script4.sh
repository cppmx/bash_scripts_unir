#!/bin/bash
#
# Materia: Administración de Sistemas en la Nube
# Actividad grupal: Programación en Bash
# Grupo: 1001 A
#
# Escribe un script que copie un archivo sobre otro, garantizando que solo reciba dos parámetros.

# Función para mostrar la ayuda
function ayuda {
    echo "Uso: $0 <archivo_origen> <archivo_destino>"
    echo "Descripción: Este script copia un archivo sobre otro."
    echo
    echo "Argumentos:"
    echo "  <archivo_origen>    Ruta al archivo de origen que se desea copiar."
    echo "  <archivo_destino>   Ruta al archivo de destino donde se copiará el archivo de origen."
}

# Verificar si se proporcionan exactamente dos parámetros
if [ "$#" -ne 2 ]; then
    ayuda
    exit 1
fi

archivo_origen="$1"
archivo_destino="$2"

# Verificar si el archivo de origen existe
if [ ! -f "$archivo_origen" ]; then
    echo "El archivo de origen no existe."
    exit 1
fi

# Copiar el archivo de origen sobre el archivo de destino
cp "$archivo_origen" "$archivo_destino"

# Verificar si la copia fue exitosa
if [ "$?" -eq 0 ]; then
    echo "El archivo se copió correctamente de $archivo_origen a $archivo_destino."
else
    echo "No se pudo copiar el archivo."
fi
