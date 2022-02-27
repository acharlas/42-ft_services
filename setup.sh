#!/bin/bash

CONTAINERS="influxdb grafana mysql phpmyadmin wordpress nginx ftps"

function build_image {
	echo "Building image for $1"
	docker build srcs/$1 -t acharlas/$1 # > /dev/null 2>&1
}

function create_deployment {
	echo "Creating deployment for $1"
	kubectl apply -f srcs/$1/$1.yaml # > /dev/null 2>&1
}

function delete_deployment {
	echo "Deleting deployment for $1"
	kubectl delete -f srcs/$1/$1.yaml # > /dev/null 2>&1
}

function generate_ssl {
	#Generate ssl key and cert
	echo "Generating ssl key and certificate for images"
	openssl req -x509 -newkey rsa:4096 -keyout key.pem -out cert.pem -days 1 -nodes -subj "/C=FR/ST=IDF/L=Paris/O=42/OU=acharlas/CN=ft_services/emailAddress=acharlas@student.42.fr" > /dev/null 2>&1
	for image in nginx ftps phpmyadmin
	do
		cp key.pem cert.pem srcs/$image/
	done
}

function install_metallb {
	#Install metalLB
	kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/namespace.yaml
	kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/metallb.yaml

	#Setup metalLB
	kubectl apply -f srcs/metallb/metalLB.yaml

}

function wait_containers {
	echo "Waiting for containers to be created"
	until [ $(kubectl get pods | grep -v ContainerCreating | wc -l) -eq 8 ]
	do
		:
	done
}


case $1 in
	main)
		# Verify that minikube is installed and docker is setup
		groups | grep docker # > /dev/null 2>&1
		if [ $? -eq 0 ]; then
			echo "Docker is setup properly" 
		else 
			echo "Docker is not setup properly"
			exit

		fi

		
		echo "Starting minikube"
		minikube delete # > /dev/null 2>&1
		minikube start --driver=docker --extra-config=apiserver.service-node-port-range=0-30000 # > /dev/null 2>&1
		minikube addons enable dashboard # > /dev/null 2>&1
		#Minikube eval
		eval $(minikube docker-env)
		install_metallb
		generate_ssl
		#Building docker images
		$0 build
		$0 create
		#wait_containers
		#echo "Opening http://172.17.0.2 in firefox"
		#firefox -private-window http://172.17.0.2 &
		#minikube dashboard # > /dev/null 2>&1
	;;

	#Creating deployments
	create)
		for container in $CONTAINERS
		do
			create_deployment $container
		done
	;;
	build)
		for container in $CONTAINERS
		do
			build_image $container
		done
	;;
	reset)
		for container in $CONTAINERS
		do
			delete_deployment $container
		done
	;;
	ssl)
		generate_ssl
	;;
	cleanup)
		echo "Cleaning up"
		$0 reset
		rm -f srcs/key.pem srcs/cert.pem
		for folder in srcs/ftps srcs/nginx srcs/phpmyadmin
		do
			rm -f $folder/key.pem $folder/cert.pem
		done
	;;
	*)
		$0 main
	
esac

