#!/bin/bash

velho_IFS=$IFS
IFS=$'\n'

for diretorio in /home/sandro/*
do
    cont_txt=0
    cont_PDF=0
    cont_JPG=0
    cont_md=0

    for arquivos in $(find $diretorio -name '*.txt' -o -name '*.pdf' -o -name '*.jpg' -o -name '*.md')
    do
        case $arquivos in
            *.txt)
                  cont_txt=$(expr $cont_txt + 1)
                  ;;
            *.pdf)
                  cont_PDF=$(expr $cont_PDF + 1)
                  ;;
            *.jpg)
                  cont_JPG=$(expr $cont_JPG + 1)
                  ;;
            *.md)
                  cont_md=$(expr $cont_md + 1)
                  ;;
        esac
    done           
    
    echo
    echo "Diretório: $(basename $diretorio)"
    echo "------------------------------------"   
    echo "-- Arquivos formato TXT: $cont_txt. " 
    echo "-- Arquivos formato PDF: $cont_PDF. "
    echo "-- Arquivos formato JPG: $cont_JPG. "
    echo "-- Arquivos formato MD:  $cont_md.  "
    echo "------------------------------------"
    echo

    sleep 3
done

IFS=$velho_IFS    
