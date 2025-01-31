#!/bin/bash

##
# Script  that returns the current server status
# Memory usge 
# Cpu load
# Tcp connection 
# Kernal version
##

#variable declearing
server_name=${hostname}

# define all the function
function memory_check() {
	echo " "
		echo  "The current memory usage on  ${server_name} is:"	 
		free -m
		df -h
		echo ""
}

function cpu_check(){
	echo " "
		echo  "CPU Load on ${server_name} is: "
		mpstat
	echo " "
}

function tcp_check() {
	echo " "
		echo   "TCP Connection on ${server_name} is:" 
		cat  /proc/net/tcp |wc -l
}

function kernal_check() {
	echo " "
		echo  "Kernal version on ${server_name} is:"
		uname -r 

}

function all_check() {
	memory_check
	cpu_check
	tcp_check
	kernal_check

}
# call the fuction
menu(){ 
        echo -ne "  
1) Memeory usage
2) Cpu load
3) Number of cpu connection
4) kernal version
5) check all
0)  Exit
choose an option: "
                read Num
                case $Num in
                        1) memory_check ; menu ;;
                        2) cpu_check ; menu ;;
                        3) tcp_check ; menu ;;
                        4) kernal_check ; menu ;;
                        5) all_check ; menu ;;
                        0) exit 0 ;;
                        *) echo -e "Wrong option " ; menu ;;
                esac


}
# fuction call
menu


