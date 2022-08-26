#!/bin/bash

function install (){
        echo " executing ${FUNCNAME} -start" 
	echo "installation ${1}"
	echo " executing ${FUNCNAME} -end"
}

function configuration () {
	echo "configuration ${1}"
}


function deploy () {
	echo "deployement ${1}"
}

configuration "nginx"
deploy "webserver"
install "nginx"
