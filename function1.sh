#!/bin/bash

###########proper order
#variable
#function
#functioncall


function install (){
	# installation process
	echo "installation code 1"
}

function configuration () {
	# configuration code
	echo "configuration code 1"
}


function deploy () {
	# deploy code
	install                # call function inside another function
	echo "deployement code 1"
}

configuration
deploy
install
