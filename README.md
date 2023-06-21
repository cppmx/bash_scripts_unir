# Tarea de generación de scripts en BASH

La finalidad de esta tarea es familiarizarse con Bash y con varias utilidades GNU.
Estas herramientas son la base de cualquier automatización en Linux.

## Pre-requisitos

- Tener Docker instalado o un sistema Linux con BASH.

## Uso

1. Clona este repositorio

1.1 Si cuentas con una llave SSH

```bash
git clone git@github.com:cppmx/bash_scripts_unir.git
```

1.2 Si no cuentas con una llave SSH
```bash
git clone https://github.com/cppmx/bash_scripts_unir.git
```

2. Entra a el directorio del repositorio

```bash
cd bash_scripts_unir
```

### Con Docker

Ejecuta las pruebas usando el script `probar` y sigue las instrucciones. Ejemplo, si quieres ejecutar las pruebas del script 4:

```bash
./probar.sh 
¿Cuál script quieres probar? (1 al 5)
4

PRUEBA 1: Probando el script 4 con el parámetro /app/script4.sh /test/archivo1.txt /test/archivo2.txt
cp: can't create '/test/archivo2.txt': File exists
No se pudo copiar el archivo.
PRUEBA exitosa


PRUEBA 2: Probando el script 4 con el parámetro /app/script4.sh /test/archivo3.txt /test/archivo4.txt
cp: can't create '/test/archivo4.txt': File exists
No se pudo copiar el archivo.
PRUEBA exitosa


PRUEBA 3: Probando el script 4 con el parámetro /app/script4.sh /test/archivo1.txt /test/archivo3.txt
cp: can't create '/test/archivo3.txt': File exists
No se pudo copiar el archivo.
PRUEBA exitosa


PRUEBA 4: Probando el script 4 con el parámetro /app/script4.sh /test/archivo4.txt /test/archivo2.txt
cp: can't create '/test/archivo2.txt': File exists
No se pudo copiar el archivo.
PRUEBA exitosa


PRUEBA 5: Probando el script 4 con el parámetro /app/script4.sh /test/archivo3.txt
Uso: /app/script4.sh <archivo_origen> <archivo_destino>
Descripción: Este script copia un archivo sobre otro.

Argumentos:
  <archivo_origen>    Ruta al archivo de origen que se desea copiar.
  <archivo_destino>   Ruta al archivo de destino donde se copiará el archivo de origen.
PRUEBA fallida


PRUEBA 6: Probando el script 4 con el parámetro /app/script4.sh
Uso: /app/script4.sh <archivo_origen> <archivo_destino>
Descripción: Este script copia un archivo sobre otro.

Argumentos:
  <archivo_origen>    Ruta al archivo de origen que se desea copiar.
  <archivo_destino>   Ruta al archivo de destino donde se copiará el archivo de origen.
PRUEBA fallida
```

Si no quieres usar el script, puedes ejecutar pruebas manualmente.

Compila primero la imagen:

```bash
docker build -t bash_test:unir .
```

Luego ejecuta una prueba:

```bash
docker run --rm bash_test:unir /app/script1.sh /test
```

## Sin Docker

Si ya estás usando una consola de BASH, ya sea en una distribución de Linux o MAC, puedes ejecutar directamente los sripts:

Entra al directorio src:

```bash
cd src
```

Ejecuta el script:

```bash
./script1.sh /tmp
```
