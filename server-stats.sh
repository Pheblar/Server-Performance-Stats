 #!/bin/bash

 get_cpu_usage() {
     echo "CPU Usage:"
     mpstat | awk '$12 ~ /[0-9.]+/ { print 100 - $12 "% used" }'
 }

get_memory_usage() { 
    free -m | awk 'NR==2{printf "Memory Usage:\n%s/%sMB (%.2f%%)\n", $3,$2,$3*100/$2 }'
}

get_memory_usage
get_cpu_usage
