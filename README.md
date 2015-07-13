Este é um pequeno SHELLSCRIPT para monitor a taxa de UPLOAD/DOWNLOAD via SNMP.

cat logs.txt | awk '{printf "[%d,%d],",NR,$1/1024,$2/1024}' # Isto converte para Kbps

