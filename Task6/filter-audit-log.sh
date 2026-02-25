# 1. Доступ к секретам:
jq 'select(.objectRef.resource=="secrets" and .verb=="get" and .stage=="ResponseComplete")' audit.log

# 2. Привилегированные поды:
jq 'select(.objectRef.resource=="pods" and .requestObject.spec.containers[].securityContext.privileged==true)' audit.log

# 3. Использование kubectl exec в чужом поде:
jq 'select(.verb=="create" and .objectRef.subresource=="exec")' audit.log

# 4. Создание RoleBinding с правами cluster-admin:
grep -i 'cluster-adimin' audit.log

# 5. Удаление audit-policy.yaml:
grep -i 'audit-policy' audit.log
