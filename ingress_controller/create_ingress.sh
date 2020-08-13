set -eu
# -------------------------------------------------------------
# This script generates external services and an ingress
# to access the microservices' apis through the tripviewer webpage
#
# check out https://docs.microsoft.com/de-de/azure/aks/ingress-basic
# 
# delete everything this script creates by typing:
# "kubectl delete namespace ingress-basic"
#
# -------------------------------------------------------------



# 1. create ingress controller

# Create a namespace for your ingress resources
kubectl create namespace ingress-basic

# Add the official stable repository
helm repo add stable https://kubernetes-charts.storage.googleapis.com/

# Use Helm to deploy an NGINX ingress controller
helm install nginx-ingress stable/nginx-ingress \
    --namespace ingress-basic \
    --set controller.replicaCount=2 \
    --set controller.nodeSelector."beta\.kubernetes\.io/os"=linux \
    --set defaultBackend.nodeSelector."beta\.kubernetes\.io/os"=linux

sleep 10

# 2. show the created ingress controller
kubectl get service -l app=nginx-ingress --namespace ingress-basic

sleep 5

# 3. create the external services to map between namespaces "ingress-basic" and "api/web"
kubectl apply -f external_services.yaml

sleep 5

# 4. create the acual ingress
kubectl apply -f ingress.yaml

