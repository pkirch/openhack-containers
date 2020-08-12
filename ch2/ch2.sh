set -eu

# https://docs.microsoft.com/en-us/azure/aks/cluster-container-registry-integration
az group create --location westeurope --name rg-ch2-aks-03

az aks create -n aks-ch2-03 -g rg-ch2-aks-03 --generate-ssh-keys --attach-acr registrycum5425

az aks get-credentials -g rg-ch2-aks-03 -n aks-ch2-03
# saved output in /root/.kube/config

# current work dir: ~/workspace/openhack-containers

# https://docs.microsoft.com/en-us/azure/aks/kubernetes-walkthrough
# az aks install-cli
# was already installed in Visual Code Spaces

kubectl get nodes
#NAME                                STATUS   ROLES   AGE     VERSION
#aks-nodepool1-19289120-vmss000000   Ready    agent   5m43s   v1.16.13
#aks-nodepool1-19289120-vmss000001   Ready    agent   5m26s   v1.16.13
#aks-nodepool1-19289120-vmss000002   Ready    agent   5m32s   v1.16.13

kubectl create namespace web
kubectl create namespace api

kubectl apply -f tripinsights-poi.yaml  

kubectl get pods -n api

