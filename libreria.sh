centrado () {
COLUMNAS=$(tput cols) 
printf "%*s\n" $(( ( ${#1} + $COLUMNAS)/2)) "$1"
}

borde () {
 local COLUMNAS=$(tput cols)
 printf "+"
 printf "%0.s-" $(seq 1 $(( ($COLUMNAS)-2)))
 printf "+\n"
}

borde_ajustado () {
local TAM="${#1}"
 printf "+"
 printf "%0.s-" $(seq 1 $((($TAM)+2)))
 printf "+\n"
}

relleno () {
local COLUMNAS=$(tput cols) 
local TAM="${#1}"
local IZDA=$(((( ${#1} + $COLUMNAS)/2)-3))
local DCHA=$(( $COLUMNAS - $IZDA -2 ))
printf "|%*s%*s|\n" $IZDA "$1" $DCHA
}

relleno_ajustado () {
printf "| %s |\n" "$1" 
}

re_izda () {
local COLUMNAS=$(tput cols)
local TAM="${#1}"
local DCHA=$(( $COLUMNAS - $TAM -3 ))
printf "| %s%*s|\n" "$1" $DCHA
}

caja () {
    borde
    relleno "$1"
    borde
}

caja_ajustada () {
borde_ajustado "$1"
relleno_ajustado "$1"
borde_ajustado "$1"
}

encajado () {
borde
relleno "$1"
borde
$1 |
  while IFS= read -r linea
  do
   re_izda "$linea"
  done
borde
}

encajado_centrado () {
borde
$1 |
  while IFS= read -r linea
  do
   re_izda "$linea"
  done
borde
}

columnas () {
local COLUMNAS=$(tput cols)
local PARAMS=$#
local TAMANO=$(( $COLUMNAS / $PARAMS ))
local RESTO=$(( $COLUMNAS % $PARAMS ))

 case $PARAMS in
   1)
    printf "| %s%*s|\n" "$1" $(( $COLUMNAS - ${#1} - 3 ))
    ;;
   2)
    printf "| %s%*s| %s%*s|\n" "$1" $(( $COLUMNAS / $TAMANO  )) "$2" $(( $COLUMNAS / $TAMANO ))
    ;;
 esac

}
