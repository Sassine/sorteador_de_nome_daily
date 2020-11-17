#!/bin/bash

# ----------------------------------------------------------------------
# Autor: Sassine Andrade El-Asmar
# github.com/sassine
# ----------------------------------------------------------------------

ARQ_PARTICIPANTES=participantes.txt
ARQ_PROCESSADOS=processados.txt

while :
 do 
clear
echo -e " 
========================================================================
# \e[36m SCRIPT - PARA SORTEAR O PROXIMO A FALAR NA DAILY  \e[39m                  #
========================================================================
"
echo -e "\e[93m [ 1 ] Fazer sorteio "
echo -e "\e[94m [ 2 ] Ver ultimo sorteado "
echo -e "\e[92m [ 3 ] Recomerçar daily "
echo -e "\e[39m

 [ 9 ] Sair

========================================================================

Entre com a opção desejada: "

read OPTION

test "$OPTION" = "1" || test "$OPTION" = "2" || test "$OPTION" = "3" || test "$OPTION" = "9"
if [ "$?" -eq 1 ]; then
    echo "Opção ( $OPTION ) não existe"
    sleep 2
else 
    break
fi
done

case "$OPTION" in
1) 
test -f "$ARQ_PARTICIPANTES"
if [ "$?" -eq 1 ]; then
    echo "Arquivo '$ARQ_PARTICIPANTES' não encontrado."
    exit;
fi
 
COUNT_LINES=$(cat "$ARQ_PARTICIPANTES" | wc -c )
if [ "$COUNT_LINES" -eq 0 ]; then
    echo "A lista de pariticipantes da daily está vazia, talvez deva utilizar a opção de recomeçar a daily !"
    echo
    echo -e "\e[33m Pressione qualquer tecla para continuar \e[39m"
    read CONFIRM
    
    ./daily.sh
fi

LINE=$[RANDOM%COUNT_LINES+1]
SORTEADO=$(cat "$ARQ_PARTICIPANTES" | head -n $LINE | tail -n 1)
    
sed -i /"$SORTEADO"/d "$ARQ_PARTICIPANTES"
    echo
    echo
    echo -e "Agora é a vez do(a) : \e[31m$SORTEADO \e[39m"
    echo "$SORTEADO" >> $ARQ_PROCESSADOS
    echo
    echo
    echo -e "\e[33m Pressione qualquer tecla para continuar \e[39m"
    read CONFIRM
    ./daily.sh
;;

2) 
test -f "$ARQ_PROCESSADOS"
if [ "$?" -eq 1 ]; then
    echo "Arquivo '$ARQ_PROCESSADOS' não encontrado ou ainda não existe."
    echo
    echo -e "\e[33m Pressione qualquer tecla para continuar \e[39m"
    read CONFIRM
    ./daily.sh
fi  
    echo
    echo
    echo " O ultimo a falar na daily foi: "
    LAST=$(cat $ARQ_PROCESSADOS | wc -c )
    LAST_USER=$(cat $ARQ_PROCESSADOS | head -n $LAST | tail -n 1)
    echo 
    echo -e "\e[31m $LAST_USER "
    echo
    echo -e "\e[33m Pressione qualquer tecla para continuar \e[39m"
    read CONFIRM
    ./daily.sh
;;

3) 
test -f "$ARQ_PROCESSADOS"
if [ "$?" -eq 1 ]; then
    echo "Arquivo '$ARQ_PROCESSADOS' não encontrado, talvez nenhuma daily tenha ocorrido ainda."
    echo
    echo -e "\e[33m Pressione qualquer tecla para continuar \e[39m"
    read CONFIRM
    ./daily.sh
fi
    echo 
    mv $ARQ_PARTICIPANTES movePart.txt
    mv $ARQ_PROCESSADOS $ARQ_PARTICIPANTES
    mv movePart.txt $ARQ_PROCESSADOS
    echo "Daily pronta para começar !"
    echo 
    echo -e "\e[33m Pressione qualquer tecla para continuar \e[39m"
    read CONFIRM
    ./daily.sh
;;

9) 
    echo "Encerrando a daily..."
    sleep 1
    clear
    exit
esac 
