#!/bin/bash
#
# Materia: Administración de Sistemas en la Nube
# Actividad grupal: Programación en Bash
# Grupo: 1001 A
#
# Escribir un script que renombre todos los ficheros con extensión JPG del directorio actual,
# añadiendo un prefijo con la fecha en formato año, mes, día. Por ejemplo, un fichero
# con nombre imagen1.jpg pasaría a llamarse 20200413-image1.jpg, si el script se
# ejecuta el 13 de abril de 2020.

current_dir=$(pwd)
fecha_actual=$(date '+%Y%m%d')

echo "Directorio actual: $current_dir"

if ! find $current_dir -iname "*.jpg" -print -quit | grep -q .; then
  echo "No se encontraron archivos JPG en la carpeta."
  exit 1
fi

shopt -s nocaseglob

for IMAGEN in *.jpg; do
  ext="${IMAGEN##*.}"
  echo "$ext" "$IMAGEN"

  if [[ $IMAGEN != "*.jpg" ]]; then
    if [[ $ext == "jpg" ]]; then
      if [[ $IMAGEN =~ ^[0-9]{8}- ]]; then
        echo "El archivo $IMAGEN ya ha sido renombrado"
      else
        echo "La extensión del archivo es $ext, se cambiará el nombre:"
        mv -v "$IMAGEN" "$fecha_actual-$IMAGEN"
      fi
    else
      echo "La extensión es diferente a $ext, por lo cual no se realizará ninguna acción"
    fi
  fi
done

shopt -u nocaseglob
