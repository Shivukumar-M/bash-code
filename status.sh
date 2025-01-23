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

all_check

