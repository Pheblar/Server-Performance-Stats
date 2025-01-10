 #!/bin/bash

 get_cpu_usage() {
     echo "CPU Usage:"
     mpstat | awk '$12 ~ /[0-9.]+/ { print 100 - $12 "% used" }'
 }

 get_cpu_usage