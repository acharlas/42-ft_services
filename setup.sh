#!/bin/bash

CONTAINERS="mysql influxdb nginx phpmyadmin grafana ftps wordpress"


function build_image {
    echo "Building image for $1"
    docker build srcs/$1 -t $1_image #> /dev/null 2>&1
}

function create_deployment {
    echo "Building deployment for $1"
    kubectl apply -f srcs/$1/deployment.yaml #> /dev/null 2>&1
}

function delete_deployment {
    echo "Deleting deployment for $1"
    kubectl delete -f srcs/$1/deployment.yaml #> /dev/null 2>&1
}

function wait_containers {
    echo "Waiting for containers to be created"
    until [ $(kubectl get pods | grep -v ContainerCreating | wc -l) -eq 8 ]
    do
        :
    done
}

function install_metallb {
	#Install metalLB
	kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/namespace.yaml > /dev/null 2>&1
	kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/metallb.yaml > /dev/null 2>&1

	#Setup metalLB
	kubectl apply -f srcs/metallb/deployment.yaml > /dev/null 2>&1

}


case $1 in
    main)
        # Verify that minikube is installed and docker is setup
		groups | grep docker > /dev/null 2>&1
		if [ $? -eq 0 ]; then
			echo "Docker is setup properly" 
		else 
			echo "Docker is not setup properly"
			exit

		fi

        echo "Starting minikube"
        minikube delete 
        minikube start --driver=docker --cpus 4 --extra-config=apiserver.service-node-port-range=1-30000 
        minikube addons enable dashboard 
        eval $(minikube docker-env)

        install_metallb
        $0 build
        $0 create
        wait_containers
        echo "Opening http://172.17.0.2 in firefox"
		firefox -private-window http://172.17.0.2 &
		minikube dashboard > /dev/null 2>&1

    ;;
    build)
        for container in $CONTAINERS
        do
            build_image $container
        done
    ;;
    create)
        for container in $CONTAINERS
        do
            create_deployment $container
        done
    ;;
    delete)
        for container in $CONTAINERS
        do
            delete_deployment $container
        done
    ;;

    *)
        $0 main

esac

