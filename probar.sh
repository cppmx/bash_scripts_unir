#!/bin/bash

function validar_respuesta()
{
    if [[ $? == 0 ]]; then
        echo -e "\e[32mPRUEBA exitosa\e[0m\n"
    else
        echo -e "\e[31mPRUEBA fallida\e[0m\n"
    fi
}

function ejecutar_pruebas()
{
    local azul="\e[34m"  # Texto en azul
    local reset="\e[0m"   # Restaurar configuración de color

    local script_num=$1
    local pruebas=("${!2}")
    local mensaje=$3
    local workdir="/app"

    if [[ "$4" != "" ]]; then
        workdir=$4
    fi

    for ((i = 0; i < ${#pruebas[@]}; i++)); do
        echo -e "\n${azul}PRUEBA $((i+1))${reset}: $mensaje ${pruebas[i]}"
        docker run --rm -u test -w $workdir bash_test:unir ${pruebas[i]}
        validar_respuesta
    done
}

function pruebas_script_1()
{
    local pruebas=(
        "/app/script1.sh /test"
        "/app/script1.sh /test/archivo1.txt"
        "/app/script1.sh /bin/bash"
        "/app/script1.sh /dev/stderr"
        "/app/script1.sh /directorio"
        "/app/script1.sh /directorio/algun_archivo.txt"
        "/app/script1.sh"
    )

    ejecutar_pruebas 1 pruebas[@] "Probando el script 1:"
}

function pruebas_script_2()
{
    local pruebas=(
        "/app/script2.sh"
        "/app/script2.sh /test/archivo1.txt"
        "/app/script2.sh /test/image1.jpg"
        "/app/script2.sh /test/archivo2.txt"
        "/app/script2.sh /test/image2.jpg"
        "/app/script2.sh /test/archivo3.txt"
        "/app/script2.sh /test/image3.jpg"
        "/app/script2.sh /test/image2.JPG"
    )

    ejecutar_pruebas 2 pruebas[@] "Probando el script 2:"
}

function pruebas_script_3()
{
    local pruebas=(
        "/app/script3.sh"
        "/app/script3.sh param1"
        "/app/script3.sh param1 param2"
        "/app/script3.sh param1 param2 param3"
        "/app/script3.sh param1 param2 param3 param4"
        "/app/script3.sh param1 param2 param3 param4 param5"
        "/app/script3.sh param1 param2 param3 param4 param5 param6"
        "/app/script3.sh param1 param2 param3 param4 param5 param6 param7"
        "/app/script3.sh param1 param2 param3 param4 param5 param6 param7 param8"
        "/app/script3.sh param1 param2 param3 param4 param5 param6 param7 param8 param9"
        "/app/script3.sh param1 param2 param3 param4 param5 param6 param7 param8 param9 param10"
    )

    ejecutar_pruebas 3 pruebas[@] "Probando el script 3:"
}

function pruebas_script_4()
{
    local pruebas=(
        "/app/script4.sh /test/archivo1.txt /test/archivo2.txt"
        "/app/script4.sh /test/archivo3.txt /test/archivo4.txt"
        "/app/script4.sh /test/archivo1.txt /test/archivo3.txt"
        "/app/script4.sh /test/archivo4.txt /test/archivo2.txt"
        "/app/script4.sh /test/archivo3.txt"
        "/app/script4.sh /test/archivo4.txt /test/archivo5.txt"
        "/app/script4.sh"
        "/app/script4.sh /test/archivo4.txt /test/archivo5.txt /test/archivo6.txt"
    )

    ejecutar_pruebas 4 pruebas[@] "Probando el script 4:"
}

function pruebas_script_5()
{
    local pruebas=(
        "/app/script5.sh"
    )

    ejecutar_pruebas 5 pruebas[@] "Probando el script 5:"

    local pruebas=(
        "/test/script5.sh"
    )

    ejecutar_pruebas 5 pruebas[@] "Probando el script 5:" /test
}

# Verificar si la imagen bash_test:unir existe
if ! docker image inspect bash_test:unir &> /dev/null; then
    echo "La imagen bash_test:unir no existe. Construyendo la imagen..."
    docker build -t bash_test:unir .
fi

opcion=

if [[ $# -eq 0 ]]; then
    # Pedir al usuario que seleccione un número de script
    echo "¿Cuál script quieres probar? (1 al 5)"
    read opcion

    # Verificar si se ingresó un número válido
    if ! [[ "$opcion" =~ ^[1-5]$ ]]; then
        echo "Opción inválida. Debes ingresar un número del 1 al 5."
        exit 1
    fi
else
    opcion=$1
fi

# Ejecutar el script correspondiente según la opción seleccionada
case "$opcion" in
    1)
        pruebas_script_1
        ;;
    2)
        pruebas_script_2
        ;;
    3)
        pruebas_script_3
        ;;
    4)
        pruebas_script_4
        ;;
    5)
        pruebas_script_5
        ;;
    *)
        echo "Opción inválida."
        ;;
esac
