#!/bin/bash
#Javier Gutierrez Fausto
# Verifica si se proporcionó un argumento.
if [ -z "$1" ]; then
    echo "Por favor, proporciona un nombre de archivo como argumento. Ejemplo:archivo.jpg"
    exit 1
fi

# Obtén la extensión del archivo
filename=$1
extension="${filename##*.}"

# Verifica si el directorio ~/fotos/ existe, sino lo crea.
if [ ! -d ~/fotos/ ]; then
    mkdir ~/fotos/
fi

# Si la extensión es jpg o JPG, copia el archivo a la carpeta de fotos.
if [ "$extension" = "jpg" ] || [ "$extension" = "JPG" ]; then
    cp $filename ~/fotos/
    echo "El archivo $filename ha sido copiado a ~/fotos/"
else
    # Si la extensión no es jpg, avisa al usuario
    echo "El formato del archivo $filename no es correcto. Se espera un archivo JPG."
fi

