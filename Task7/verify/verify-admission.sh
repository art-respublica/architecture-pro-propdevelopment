kubectl apply -f ./../01-create-namespace.yaml

kubectl apply -f ./../gatekeeper/constraint-templates/privileged.yaml
kubectl apply -f ./../gatekeeper/constraint-templates/runasnonroot.yaml
kubectl apply -f ./../gatekeeper/constraint-templates/readonlyroot.yaml
kubectl apply -f ./../gatekeeper/constraint-templates/hostpath.yaml

kubectl apply -f ./../gatekeeper/constraints/privileged.yaml
kubectl apply -f ./../gatekeeper/constraints/runasnonroot.yaml
kubectl apply -f ./../gatekeeper/constraints/readonlyroot.yaml
kubectl apply -f ./../gatekeeper/constraints/hostpath.yaml