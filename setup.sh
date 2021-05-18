minikube start --driver=docker --extra-config=apiserver.service-node-port-range=1-30000

eval $(minikube docker-env)

docker build ./srcs/nginx/. -t nginx_image
docker build ./srcs/wordpress/. -t wordpress_image
docker build ./srcs/mysql/. -t mysql_image

kubectl apply -f srcs/nginx/deployment.yaml
kubectl apply -f srcs/wordpress/deployment.yaml
kubectl apply -f srcs/mysql/deployment.yaml
