kubectl create namespace smart-devices

kubectl apply -f admin.yaml
kubectl apply -f owner.yaml
kubectl apply -f technical.yaml

kubectl get sa,role,rolebinding -n smart-devices
