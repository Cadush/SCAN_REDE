#!/bin/bash

data=$(date +"%Y-%m-%d_%Hh%Mm")
arquivo_csv="relatorio_rede_${data}.csv"
arquivo_xlsx="relatorio_rede_${data}.xlsx"
rede="00.00.0.0/24"  # Coloca o ip do cliente aqui

echo "IP,MAC Address,Fabricante" > "$arquivo_csv"

nmap -sn "$rede" | awk '
/Nmap scan report/ { ip=$NF }
/MAC Address/ {
  mac=$3
  $1=""; $2=""; $3=""
  vendor=substr($0, 2)
  printf "%s,%s,%s\n", ip, mac, vendor
}' >> "$arquivo_csv"

# Se apresentar +1 linha vai estar funcioanando o script
linhas=$(wc -l < "$arquivo_csv")
if [ "$linhas" -le 1 ]; then
  echo "Nenhum dispositivo encontrado. Arquivo CSV vazio."
  exit 1
fi

# Salvando em csv e xlsx
ssconvert "$arquivo_csv" "$arquivo_xlsx"

echo "Relatório salvo como:"
echo "CSV : $arquivo_csv"
echo "XLSX: $arquivo_xlsx"
