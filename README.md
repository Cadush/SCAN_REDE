# Relatório de Rede – Script Bash

Este script realiza uma varredura ARP na rede local utilizando o `nmap`, captura os IPs ativos, endereços MAC e fabricantes dos dispositivos conectados, e gera um relatório automático nos formatos **CSV** e **XLSX** com carimbo de data e hora.

## 📌 Funcionalidades

- Descoberta de hosts ativos em uma rede local.
- Identificação de IP, MAC address e fabricante.
- Exportação dos resultados para um arquivo `.csv`.
- Conversão automática do `.csv` para `.xlsx`.

## ⚙️ Pré-requisitos

Certifique-se de que os seguintes pacotes estejam instalados em sua máquina Linux:
  nmap
  ssconvert (parte do pacote gnumeric)

Você pode instalá-los com:

sudo apt update
sudo apt install nmap gnumeric
-
Como usar

 Edite a variável rede no script e insira o intervalo da sua rede local:
 Torne o script executável com "chmod+x scan.sh"
 execute com "./scan.sh"
