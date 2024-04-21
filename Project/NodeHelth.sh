 #!/bin/bash

 ######################
 # Author: Archana Hubballi
 # Date: 09-12-2023
 # This scripts outputs the node health
 # version: v1
 
 ######################
 
 echo "Print the disk space"
 df -h

 echo "Print the Memory"
 free -g

 echo "Print the CPU"
 nproc


