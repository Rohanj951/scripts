#!/bin/bash
#packagename="nginx"
function install (){
	echo "installation ${1}"
}

function configuration () {
local packagename="Tomcat"
myname="rohan"
	echo "configuration ${packagename}"
}


function deploy () {
	echo "deployement ${1}"
}

echo "first ${packagename}"
install "${packagename}"
echo ${myname}
configuration "${packagename}"
echo ${myname^}
deploy "${packagename}"
