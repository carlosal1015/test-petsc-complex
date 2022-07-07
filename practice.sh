#!/usr/bin/env bash

# function saludar() {
#   echo Hola $1
# }

# for USUARIO in ${@}; do
#   saludar $USUARIO
# done

# X=3

# while [[ $X -ge 1 ]]; do
#   echo $X
#   X=$((X - 1))
# done

# case "${1}" in
# start | finish)
#   echo "Ejecutaste start | finish"
#   ;;
# res*)
#   echo "Ejecutaste restart"
#   ;;
# *)
#   echo "Especificaste un argumento inválido"
#   ;;
# esac

while getopts "l:d:" FLAG; do
  case "${FLAG}" in
  local | l)
    echo "Running in local"
    echo "Arg of '-l' is ${OPTARG}"
    ;;
  docker | d)
    echo "Running in docker"
    echo "Arg of '-d' is ${OPTARG}"
    ;;
  *)
    echo "Invalid use, please pass one of the options '-l' o '-d'."
    ;;
  esac
done
