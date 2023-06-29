#!/bin/bash
#
# Materia: Administración de Sistemas en la Nube
# Actividad grupal: Programación en Bash
# Grupo: 1001 A
#

#recorrer los archivos y renombrar de acuerdo a la fecha los que tengan extensión jpg.
fecha_actual=$(date +%Y%m%d)

for IMAGEN in *.jpg; do
    ext="${IMAGEN##*.}"
    echo "$ext" $IMAGEN
    if [ $ext == "jpg" ] 
    then
        if [[  $IMAGEN =~ ^[0-9]{8}- ]]
        then
            echo "El archivo $IMAGEN ya ha sido renombrado"
        else
            echo "la extension del archivo es $ext, se cambiará el nombre:"
            mv -v $IMAGEN $fecha_actual-$IMAGEN
        fi
    else
        echo "la extensión es diferente a $ext, por lo cual no se realizará ninguna acción"
    fi
done
