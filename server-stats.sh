 #!/bin/bash

get_cpu_usage() {
    echo "CPU Usage:"
    mpstat 1 3 | awk '$12 ~ /[0-9.]+/ { sum += 100 - $12; count++ } END { if (count > 0) print sum/count "% used" }'
}

get_memory_usage() { 
    free -m | awk 'NR==2{printf "Memory Usage:\n%s/%sMB (%.2f%%)\n", $3,$2,$3*100/$2 }'
}

get_disk_usage() {
    echo "Disk Usage:"
    df -h --total | awk 'END{print "Used: "$3", Free: "$4", Usage: "$5}'
}

get_top_cpu_processes() {
    echo "Top 5 Processes by CPU Usage:"
    ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%cpu | head -n 6
}

get_cpu_usage
get_top_cpu_processes
get_memory_usage
get_disk_usage
