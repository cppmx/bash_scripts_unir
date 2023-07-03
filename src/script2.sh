#!/bin/bash
#
# Materia: Administración de Sistemas en la Nube
# Actividad grupal: Programación en Bash
# Grupo: 1001 A
#
# Escribir un script que ejecute cierta acción en función de la extensión
# de un archivo que recibe como parámetro. Si se trata de un JPG,
# copiar dicho archivo en la carpeta ~/fotos. Si resulta ser de
# otro formato, avisar al usuario sin hacer nada.

# Verifica si se proporcionó un argumento.
if [ -z "$1" ]; then
    echo "Por favor, proporciona un nombre de archivo como argumento. Ejemplo:archivo.jpg"
    exit 1
fi

# Obtén la extensión del archivo
filename=$1

if [[ ! -f "$filename" ]]; then
    echo "El archivo '$filename' no existe"
    exit 1
fi

extension="${filename##*.}"

# Verifica si el directorio ~/fotos/ existe, sino lo crea.
if [ ! -d ~/fotos/ ]; then
    mkdir ~/fotos/
fi

# Si la extensión es jpg o JPG, copia el archivo a la carpeta de fotos.
if [ "$extension" = "jpg" ] || [ "$extension" = "JPG" ]; then
    cp $filename ~/fotos/

    if [[ $? -eq 0 ]]; then
        echo "El archivo '$filename' ha sido copiado a ~/fotos/"
    else
        echo "Hubo un error al momento de copiar el archivo '$filename'"
    fi
else
    # Si la extensión no es jpg, avisa al usuario
    echo "El formato del archivo '$filename' no es correcto. Se espera un archivo JPG."
    exit 1
fi
