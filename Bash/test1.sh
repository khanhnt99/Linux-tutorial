#!/bin/bash 
while :; do
  # lay dong dau tien cua file 
  cpu_now=($(head -n1 /proc/stat)) 
  # Get all columns but skip the first (which is the "cpu" string)
  cpu_sum="${cpu_now[@]:1}" 
  # Tong cac gia tri cac cot 
  cpu_sum=$((${cpu_sum// /+})) 
  echo "$cpu_sum"
  # Thoi gian chenh lech 2 lan doc
  cpu_delta=$((cpu_sum - cpu_last_sum)) 
  # Thoi gian chenh lenh 2 lan ranh cua CPU
  cpu_idle=$((cpu_now[4]- cpu_last[4])) 
  # Thoi gian su dung CPU
  cpu_used=$((cpu_delta - cpu_idle)) 
  # Tinh phan tram
  cpu_usage=$((100 * cpu_used / cpu_delta)) 
  
  # Cho lan doc tiep 
  cpu_last=("${cpu_now[@]}") 
  cpu_last_sum=$cpu_sum 
  
  echo "CPU usage at $cpu_usage%" 
  if [[ $cpu_usage -lt 50 ]]; then 
  echo "OK";
  elif [[ $cpu_usage -gt 50 && $cpu_usage -lt 70 ]]; then
  echo "warning";
  else
  echo "Critical";
  fi
  
  # Wait a second before the next read 
  sleep 1 
done