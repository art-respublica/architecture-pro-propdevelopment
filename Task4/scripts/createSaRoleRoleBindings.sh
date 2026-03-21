kubectl create namespace smart-devices

kubectl apply -f ./united/admin.yaml
kubectl apply -f ./united/owner.yaml
kubectl apply -f ./united/technical.yaml

kubectl get sa,role,rolebinding -n smart-devices
