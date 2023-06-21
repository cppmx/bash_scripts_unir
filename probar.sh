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

    for ((i = 0; i < ${#pruebas[@]}; i++)); do
        echo -e "\n${azul}PRUEBA $((i+1))${reset}: $mensaje ${pruebas[i]}"
        docker run --rm bash_test:unir ${pruebas[i]}
        validar_respuesta
    done
}

function pruebas_script_1()
{
    local pruebas=(
        "/app/script1.sh /test"                            # PRUEBA 1, se espera que sea exitosa
        "/app/script1.sh /test/archivo1.txt"               # PRUEBA 2, se espera que sea exitosa
        "/app/script1.sh /bin/bash"                        # PRUEBA 3, se espera que sea exitosa
        "/app/script1.sh /dev/stderr"                      # PRUEBA 4, se espera que sea exitosa
        "/app/script1.sh /directorio"                      # PRUEBA 5, se espera que falle
        "/app/script1.sh /directorio/algun_archivo.txt"    # PRUEBA 6, se espera que falle
        "/app/script1.sh"                                  # PRUEBA 7, se espera que falle
    )

    ejecutar_pruebas 1 pruebas[@] "Probando el script 1 con el parámetro"
}

function pruebas_script_4()
{
    local pruebas=(
        "/app/script4.sh /test/archivo1.txt /test/archivo2.txt"  # PRUEBA 1, se espera que sea exitosa
        "/app/script4.sh /test/archivo3.txt /test/archivo4.txt"  # PRUEBA 2, se espera que sea exitosa
        "/app/script4.sh /test/archivo1.txt /test/archivo3.txt"  # PRUEBA 2, se espera que sea exitosa
        "/app/script4.sh /test/archivo4.txt /test/archivo2.txt"  # PRUEBA 2, se espera que sea exitosa
        "/app/script4.sh /test/archivo3.txt"                     # PRUEBA 2, se espera que falle
        "/app/script4.sh"                                        # PRUEBA 2, se espera que falle
    )

    ejecutar_pruebas 4 pruebas[@] "Probando el script 4 con el parámetro"
}

# Verificar si la imagen bash_test:unir existe
if ! docker image inspect bash_test:unir &> /dev/null; then
    echo "La imagen bash_test:unir no existe. Construyendo la imagen..."
    docker build -t bash_test:unir .
fi

# Pedir al usuario que seleccione un número de script
echo "¿Cuál script quieres probar? (1 al 5)"
read opcion

# Verificar si se ingresó un número válido
if ! [[ "$opcion" =~ ^[1-5]$ ]]; then
    echo "Opción inválida. Debes ingresar un número del 1 al 5."
    exit 1
fi

# Ejecutar el script correspondiente según la opción seleccionada
case "$opcion" in
    1)
        pruebas_script_1
        ;;
    2)
        docker run --rm bash_test:unir /app/script2.sh
        ;;
    3)
        docker run --rm bash_test:unir /app/script3.sh
        ;;
    4)
        pruebas_script_4
        ;;
    5)
        docker run --rm bash_test:unir /app/script5.sh
        ;;
    *)
        echo "Opción inválida."
        ;;
esac
