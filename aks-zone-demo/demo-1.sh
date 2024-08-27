###########################################
# create deployment
kubectl apply -n default -f manifests/deployment.yml

# list pods in default namespace
kubectl get pod -o=custom-columns=NAME:.metadata.name,HOSTIP:.status.hostIP,NODE:.spec.nodeName

# list user nodes zones
kubectl get nodes -L kubernetes.azure.com/agentpool,topology.kubernetes.io/region,topology.kubernetes.io/zone -l kubernetes.azure.com/mode=user

# get the first user node name
NODE_NAME=$(kubectl get node -l kubernetes.azure.com/mode=user -o json | jq .items[0].metadata.name -r)

# cordon & drain the node
kubectl drain $NODE_NAME --ignore-daemonsets

# list user nodes - note that one node is cordonded and will not be considered for new deployments
kubectl get nodes -o=custom-columns=NAME:.metadata.name,IP:.status.addresses[1].address -l kubernetes.azure.com/mode=user

# list pods in default namespace
kubectl get pod -o=custom-columns=NAME:.metadata.name,HOSTIP:.status.hostIP,NODE:.spec.nodeName

# uncordon node & delete deployment
kubectl uncordon $NODE_NAME
kubectl delete deployment app
