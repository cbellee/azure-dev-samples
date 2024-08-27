#############################################
# create pvc deployment
kubectl apply -n default -f manifests/pvc-deployment.yml

# list pods in default namespace
kubectl get pod -o=custom-columns=NAME:.metadata.name,HOSTIP:.status.hostIP,NODE:.spec.nodeName

# list user nodes in zones
kubectl get nodes -L kubernetes.azure.com/agentpool,topology.kubernetes.io/region,topology.kubernetes.io/zone -l kubernetes.azure.com/mode=user

# get the node name the pod is running on
NODE_NAME=$(curl http://zonal-pvc.apps.kainiindustries.net/info | jq .Node -r)

# cordon & drain the node on which the deployment was scheduled
kubectl drain $NODE_NAME --ignore-daemonsets

# list pods in default namespace
kubectl get pod -o=custom-columns=NAME:.metadata.name,HOSTIP:.status.hostIP,NODE:.spec.nodeName

# uncordon node & delete deployment
kubectl uncordon $NODE_NAME
kubectl delete deployment pvc-app
