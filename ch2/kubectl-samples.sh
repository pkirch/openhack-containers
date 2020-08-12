root@codespaces_f9f2a3:~/workspace/openhack-containers/ch2# kubectl get namespace web -o yaml > web-namespace.yaml
root@codespaces_f9f2a3:~/workspace/openhack-containers/ch2# kubectl delete namespace web
namespace "web" deleted
root@codespaces_f9f2a3:~/workspace/openhack-containers/ch2# kubectl apply 
error: must specify one of -f and -k
root@codespaces_f9f2a3:~/workspace/openhack-containers/ch2# kubectl apply -f web-namespace.yaml 
namespace/web created
root@codespaces_f9f2a3:~/workspace/openhack-containers/ch2# 


alias k=kubectl

root@codespaces_f9f2a3:~/workspace/openhack-containers/ch2# k get deployment -A    
NAMESPACE     NAME                        READY   UP-TO-DATE   AVAILABLE   AGE
api           poi                         1/1     1            1           35s
kube-system   coredns                     2/2     2            2           19h
kube-system   coredns-autoscaler          1/1     1            1           19h
kube-system   dashboard-metrics-scraper   1/1     1            1           19h
kube-system   kubernetes-dashboard        1/1     1            1           19h
kube-system   metrics-server              1/1     1            1           19h
kube-system   tunnelfront                 1/1     1            1           19h


root@codespaces_f9f2a3:~/workspace/openhack-containers/ch2# k get deployment poi -n api
NAME   READY   UP-TO-DATE   AVAILABLE   AGE
poi    1/1     1            1           26s


root@codespaces_f9f2a3:~/workspace/openhack-containers/ch2# k delete deployment tripinsights-poi -n api
deployment.apps "tripinsights-poi" deleted
root@codespaces_f9f2a3:~/workspace/openhack-containers/ch2# k apply -f tripinsights-poi.yaml       
deployment.apps/poi created

root@codespaces_f9f2a3:~/workspace/openhack-containers/ch2# kubectl get deployment tripinsights-poi -n api -o yaml 

root@codespaces_f9f2a3:~/workspace/openhack-containers/ch2# k describe deployment -n api tripinsights-poi

root@codespaces_f9f2a3:~/workspace/openhack-containers/ch2# k get pod -n api
NAME                  READY   STATUS    RESTARTS   AGE
poi-95f55f6cc-vz6cm   1/1     Running   0          12m

root@codespaces_f9f2a3:~/workspace/openhack-containers/ch2# k logs poi-95f55f6cc-vz6cm -n api


root@codespaces_f9f2a3:~/workspace/openhack-containers/ch2# az acr repository list -n registrycum5425
[
  "grafana-sim",
  "insurance",
  "prometheus-sim",
  "tripinsights/poi",
  "tripinsights/trips",
  "tripinsights/tripviewer",
  "tripinsights/user-java",
  "tripinsights/userprofile",
  "tripviewer2",
  "wcfservice"
]

k port-forward service/tripviewer-svc :80 -n web
curl -vkL http://localhost:44053/