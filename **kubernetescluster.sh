#!/bin/bash

# this is for the installation of k8s cluster with the help Bootsrap 
# to run this script just type -----   ./k8s_installation.sh on ypur shell

ram=$(grep MemTotal /proc/meminfo  | awk '{print $2}')
cpu=$(nproc)

if [[ ${cpu} -lt 2 || ${ram} -lt 2097152 ]]
then
        echo "Your system ram and CPU not according to K8s standards (min 2GB Ram and 2 CPU is require)"
        exit 1
fi



# function for installation of package

function installPackage() {
        local packagename=${1}
        yum install -y ${packagename}
        if [[ $? == 0 ]]
        then
                echo "${packagename} is install successfully"
        else
                echo "${packagename} is not install"
                exit 1
        fi
}

#function service() {
#	local servicename=${1}
#	systemctl restart ${servicename}
#	if [[ $? == 0 ]]
 #       then
  #              echo "${servicename} is restart successfully"
   #     else
    #            echo "${servicename} is not restart"
    #            exit 1
     #   fi
#}


function service1() {
        local servicename=${1}
        systemctl enable ${servicename}
        if [[ $? == 0 ]]
        then
                echo "${servicename} is enable successfully"
        else
                echo "${servicename} is not restart"
                exit 1
        fi
}

# check user is root user or not

if [[ $UID != 0 ]]
then
        echo "you are not a root user"
        exit 2
fi

yum update -y 
if [[ $? = 0 ]]
then 
	echo "update successfully "
else
	echo "dont able to update the repository"
	exit 1
fi
echo
echo  "################ successfull update ##############"
echo
sleep 1

# make ip a system variable
IP=$(hostname -I)

PS3="Please select os ? "
select os in Rhel/Centos ubuntu Mac
do 
	if [[ ${os} == Rhel/Centos ]]
	then 
		echo
		echo  "############# thanks for selecting the ${os}#################"
		sleep 1
		echo
		
		read -p "Please enter hostname for master node without using .com or press enter for default " hostname
		hostname=${hostname:-masternode}
		hostnamectl set-hostname ${hostname,,}	    # set the hostname
	        echo

		echo -e "\033[0;32m ######### your hostname is ${hostname,,}  ################"
	
         	sleep 1
		
		echo
		
		swapoff -a
		echo
		echo -e "############# your swap memory is disable for now #####################"
		sleep 1
		echo
#		read -p "Please enter your master node ip for hosts file entry " ip
#		sleep 1
#		read -p "Please enter your servername for master node " servername
#		sleep 1
                echo "your master node Ip for hosts file is ${IP}"
		sleep 1
                echo "your server name is ${hostname,,}.com"
		sleep 1
		echo

		read -p "Please enter your worker node ip for hosts file entry " ip1
                read -p "Please enter your servername for worker node " servername1
		sleep 1
		echo
		echo "${IP} ${hostname,,}.com master" >> /etc/hosts 
		echo "${ip} ${servername}.com master" >> /etc/hosts
		if [[ $? == 0 ]]
		then
			echo -e "\033[0;32m ################### your host file entry ############"
			echo
	     	        tail  /etc/hosts
		else
			echo "Please enter the correct value"
			exit 1
		fi
		sleep 1
		echo

		# install of yum-utils package (which provides the yum-config-manager utility) and set up the repository.
		installPackage yum-utils
		sleep 1
		echo

		yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo

		sleep 1
		echo

		# install docker
		installPackage "docker-ce docker-ce-cli containerd.io docker-compose-plugin"
		if [[ $? == 0 ]]
		then 
			echo
			echo "################################ docker install successful ###################################"
		else
			echo "docker is not install"
			exit 1
		fi
		sleep 2
		echo 
                
	        echo "configuring the k8s repository"	
		cat <<EOF | sudo tee /etc/yum.repos.d/kubernetes.repo
[kubernetes]
name=Kubernetes
baseurl=https://packages.cloud.google.com/yum/repos/kubernetes-el7-\$basearch
enabled=1
gpgcheck=1
gpgkey=https://packages.cloud.google.com/yum/doc/yum-key.gpg https://packages.cloud.google.com/yum/doc/rpm-package-key.gpg
EOF
                echo "successfully configure the repository of k8s"
		sleep 3
		echo

		# Set SELinux in permissive mode (effectively disabling it)
		if [[ $(getenforce) != Permissive ]]
		then
			$(setenforce 0)
		fi

		echo  " #### selinux is permissive #### "
		sleep 2 
		echo
                 
		# installation of kubelet and kubeadm 
		installPackage "kubelet-1.23* kubeadm-1.23* kubectl-1.23*"
		sleep 1 
		echo

		# configuring the CGROUP driver
		cat << EOF > /etc/docker/daemon.json
                        {
                           "exec-opts": ["native.cgroupdriver=systemd"]
                      }
EOF
		sleep 1
		echo
		systemctl daemon-reload
		if [[ $? != 0 ]]
		then 
			echo "daemon not reload"
		fi
		echo
		sleep 2
#                servicename docker
#		if [[ $? != 0 ]] 
#		then
#			echo "please check there is error in restarting the docker servie"
#			exit 2 
#		fi 
#		echo
#		sleep 2
#		servicename kubelet
#                if [[ $? != 0 ]]
#                then
#                        echo "please check there is error in restarting the docker servie"
#                        exit 2
#                fi
#                echo
#                sleep 2
#		systemctl enable docker
#		systemctl enable kubelet



		for i in docker kubelet
		do
			systemctl restart ${i}
			if [[ $? != 0 ]]
			then
				echo "please check there is error in restarting the servie"
			exit 2
			fi
			echo
			sleep 2
	        done
		for i in docker kubelet
		do
			systemctl enable ${i}
	       	done

		echo  " ####### docker and kubelet service is restart and enable ###"
		sleep 2		
		echo
		sleep 1
		######cni plugins in k8s documnet
                kubectl apply -f "https://cloud.weave.works/k8s/net?k8s-version=$(kubectl version | base64 | tr -d '\n')"
		sleep 1
		echo "Cluster setup initiallization"
		Kubeadm init
		#service docker-ce
		#sleep 1
		#echo
		#service kubelet
		#sleep 1
		#echo
		#service1 docker-ce
		#sleep 1
		#echo
		#service kubelet
		sleep 1
		break;
	else
		echo "this is only for fedora base os. "
		break;
	fi
done
 

