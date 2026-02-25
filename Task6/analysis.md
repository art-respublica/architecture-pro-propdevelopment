# Отчёт по результатам анализа Kubernetes Audit Log

## Подозрительные события

1. Доступ к секретам:
    - Кто: kubernetes-admin
    - Где: /api/v1/namespaces/kube-system/secrets/bootstrap-token-allm8k?timeout=10s
    - Почему подозрительно: ответ со статусом Failure и пояснением 'secrets \"bootstrap-token-allm8k\" not found'

2. Привилегированные поды:
    - Кто: minikube-user
    - Комментарий: pod/privileged-pos успешно создан, статус ответа 201

3. Использование kubectl exec в чужом поде:
    - Кто: --
    - Что делал: не выполнено. OCI runtime exec failed: unable to start container process exec: "cat": executable file not found

4. Создание RoleBinding с правами cluster-admin:
    - Кто: kubernetes-admin
    - К чему привело: rolebinding.rbac.authorization.k8s.io/escalate-binding createde

5. Удаление audit-policy.yaml:
    - Кто: system:node:minikube
    - Возможные последствия: Действия не выполнено. Предоставление права менять Policy на лету даст злоумышленнику возможность скрыть следы своей деятельности 

## Вывод
Система аудита информационной безопасности kubernetes - это мощный инструмент по анализу действий с k8s и позволяет своевременно определять злонаправленные действия. 
