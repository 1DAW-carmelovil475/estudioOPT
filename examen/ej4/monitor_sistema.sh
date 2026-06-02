#!/bin/bash

#!/bin/bash

mkdir -p informes

fecha=$(date +%Y%m%d)
fecha_hora=$(date +%Y%m%d_%H%M%S)
informe="informes/informe_$fecha.log"

mem_libre=$(free -m | awk 'NR==2 {print $4}')
mem_total=$(free -m | awk 'NR==2 {print $2}')
disco_uso=$(df /home | awk 'NR==2 {print $5}' | tr -d '%')
disco_info=$(df -h /home | awk 'NR==2 {print $4}')
num_procesos=$(ps aux | wc -l)
cpu=$(ps aux | awk 'NR>1 {sum+=$3} END {printf "%.1f", sum}')

{
echo "========================================"
echo "  INFORME DEL SISTEMA - $fecha_hora"
echo "========================================"
echo "Fecha y hora:        $(date)"
echo "CPU en uso:          $cpu%"
echo "Memoria total:       $mem_total MB"
echo "Memoria libre:       $mem_libre MB"
echo "Espacio libre /home: $disco_info"
echo "Procesos activos:    $num_procesos"
echo "========================================"

if [ "$disco_uso" -gt 80 ]; then
    echo "⚠ ALERTA: espacio en disco supera el 80% ($disco_uso% usado)"
fi

if [ "$mem_libre" -lt 500 ]; then
    echo "⚠ ALERTA: memoria libre por debajo de 500MB ($mem_libre MB libres)"
fi

echo "========================================"
} | tee -a "$informe"

exit 0