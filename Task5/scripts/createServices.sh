kubectl apply -f ./part/front-end-deployment.yaml
kubectl apply -f ./part/front-end-service.yaml

kubectl apply -f ./part/back-end-api-deployment.yaml
kubectl apply -f ./part/back-end-service.yaml

kubectl apply -f ./part/admin-front-end-deployment.yaml
kubectl apply -f ./part/admin-front-end-service.yaml

kubectl apply -f ./part/admin-back-end-api-deployment.yaml
kubectl apply -f ./part/admin-back-end-service.yaml