# Kubernetes: Deployment, Service и Init-контейнеры

## Задание 1. Deployment с nginx и multitool

Создан Deployment `nginx-multitool`, содержащий два контейнера:

- `nginx` — слушает порт `80`;
- `multitool` — слушает порт `8080`.

Порт multitool изменён на `8080`, чтобы избежать конфликта с nginx, который по умолчанию использует порт `80`.

### Масштабирование Deployment

Количество подов до масштабирования:

```bash
kubectl get pods -l app=nginx-multitool -o wide
```

```text
NAME                               READY   STATUS    RESTARTS   AGE   IP               NODE     NOMINATED NODE   READINESS GATES
nginx-multitool-74c8fddf54-fqsjm   2/2     Running   0          37s   10.233.103.154   k8s-w1   <none>           <none>
```

Увеличение количества реплик:

```bash
kubectl scale deployment nginx-multitool --replicas=2
```

Количество подов после масштабирования:

```text
NAME                               READY   STATUS              RESTARTS   AGE
nginx-multitool-74c8fddf54-fqsjm   2/2     Running             0          87s
nginx-multitool-74c8fddf54-zzjct   0/2     ContainerCreating   0          4s
```

### Создание Service

Создан Service типа `ClusterIP`, который обеспечивает доступ к репликам Deployment внутри кластера:

```bash
kubectl get svc nginx-multitool-svc
```

```text
NAME                  TYPE        CLUSTER-IP     EXTERNAL-IP   PORT(S)           AGE
nginx-multitool-svc   ClusterIP   10.233.29.22   <none>        80/TCP,8080/TCP   10s
```

### Проверка доступа из отдельного Pod

Создан отдельный Pod `multitool-client` с образом `wbitt/network-multitool`.

Проверка доступа к nginx через Service:

```bash
kubectl exec -it multitool-client -- curl -s http://nginx-multitool-svc:80
```

```text
<!DOCTYPE html>
<html>
<head>
<title>Welcome to nginx!</title>
```

Проверка доступа к multitool через Service:

```bash
kubectl exec -it multitool-client -- curl -s http://nginx-multitool-svc:8080
```

```text
WBITT Network MultiTool (with NGINX) - nginx-multitool-74c8fddf54-zzjct - 10.233.103.155 - HTTP: 8080 , HTTPS: 443 . (Formerly praqma/network-multitool)
```

## Задание 2. Deployment с Init-контейнером

Создан Deployment `nginx-init` с основным контейнером `nginx` и init-контейнером на основе образа `busybox`.

Init-контейнер ожидает появления Service `nginx-init-svc` в DNS кластера. Основной контейнер nginx запускается только после успешного завершения init-контейнера.

### Состояние до создания Service

```bash
kubectl get pods -l app=nginx-init -w
```

```text
NAME                          READY   STATUS     RESTARTS   AGE
nginx-init-6d94f46f88-2nlv4   0/1     Init:0/1   0          66s
```

Pod находится в статусе `Init:0/1`. Это означает, что init-контейнер ещё не завершил работу, поэтому основной контейнер nginx не запускается.

### Создание Service

```bash
kubectl get svc nginx-init-svc
```

```text
NAME             TYPE        CLUSTER-IP     EXTERNAL-IP   PORT(S)   AGE
nginx-init-svc   ClusterIP   10.233.16.50   <none>        80/TCP    4m34s
```

После создания Service init-контейнер обнаруживает DNS-имя `nginx-init-svc` и успешно завершается.

### Состояние после запуска Service

```bash
kubectl get pods -l app=nginx-init -w
```

```text
NAME                          READY   STATUS    RESTARTS   AGE
nginx-init-<new-pod-hash>     1/1     Running   0          <time>
```

После появления Service Pod переходит в статус `Running` и становится готовым (`1/1`). Основной контейнер nginx запускается только после успешного выполнения init-контейнера.
