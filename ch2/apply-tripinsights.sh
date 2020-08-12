set -eu

kubectl apply -f tripinsights-user-java.yaml  
kubectl apply -f tripinsights-userprofile.yaml 
kubectl apply -f tripinsights-trips.yaml 
kubectl apply -f tripinsights-poi.yaml 
kubectl apply -f tripinsights-tripviewer.yaml 