# architecture-pro-propdevelopment
Учебный репозиторий проектной работы 5-го спринта


# Задание 1: Разработка проверочного листа по безопасности данных

[Результат визуализации анализа рисков компании](/Task1/task1.drawio)


# Задание 2: Разработка и заполнение проверочного листа для бизнес-систем

[Проверочный лист безопасности для бизнес-систем](/Task2/ПроверочныйЛистАудитИБ.md)


# Задание 3: Внешние интеграции

[Диаграмма контекста](/Task3/PropDevelopment_context_smart_devices.puml)
[Обновленная диаграмма контейнеров PropDevelopment](/Task3/PropDevelopment_С4_model.drawio)
[Список требования для внешних интеграций](/Task3/FURPS+_требования.md)


# Задание 4: Защита доступа к кластеру Kubernetes

[Роли и их полномочия при работе с kubernetes](/Task4/РолиИхПолномочия.md)

Скрипты для создания сервис аккаунтов, ролей и их связывания расположены в папке /Task4/scripts

Для запуска общего скрипта выполните
```shell
sh /Task4/scripts/createSaRoleRoleBindings.sh
```
Для запуска по частям выполните
```shell
cd /Task4/scripts
sh /createNamespace.sh
sh /createServiceAccounts.sh
sh /createRoles.sh
sh /createRoleBindings.sh
```

# Задание 5. Управление трафиком внутри кластера Kubertnetes

Скрипты для создания сетевых политик расположены в папке /Task5/scripts

Для запуска общего скрипта выполните
```shell
sh /Task5/scripts/createCommon.sh
```
Для запуска по частям выполните
```shell
cd /Task5/scripts
sh /createNamespace.sh
sh /createNetworkPolicies.sh
sh /createNetworkPolicies.sh
```
Для проверки корректности работы использовался скрипт check.sh


# Задание 6. Аудит активности пользователей и обнаружение инцидентов
