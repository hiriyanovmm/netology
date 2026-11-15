### Задание 1.

Продемонстрировать количество подов до и после масштабирования.
kubectl get pods -l app=nginx-multitool -o wide
NAME                               READY   STATUS    RESTARTS   AGE   IP               NODE     NOMINATED NODE   READINESS GATES
nginx-multitool-74c8fddf54-fqsjm   2/2     Running   0          37s   10.233.103.154   k8s-w1   <none>           <none>

kubectl get pods -l app=nginx-multitool
NAME                               READY   STATUS              RESTARTS   AGE
nginx-multitool-74c8fddf54-fqsjm   2/2     Running             0          87s
nginx-multitool-74c8fddf54-zzjct   0/2     ContainerCreating   0          4s

Создать Service, который обеспечит доступ до реплик приложений из п.1
kubectl get svc nginx-multitool-svc
NAME                  TYPE        CLUSTER-IP     EXTERNAL-IP   PORT(S)           AGE
nginx-multitool-svc   ClusterIP   10.233.29.22   <none>        80/TCP,8080/TCP   10s

Создать отдельный Pod с приложением multitool и убедиться с помощью curl, что из пода есть доступ до приложений из п.1.
kubectl exec -it multitool-client -- curl -s http://nginx-multitool-svc:80
<!DOCTYPE html>
<html>
<head>
<title>Welcome to nginx!</title>

kubectl exec -it multitool-client -- curl -s http://nginx-multitool-svc:8080
WBITT Network MultiTool (with NGINX) - nginx-multitool-74c8fddf54-zzjct - 10.233.103.155 - HTTP: 8080 , HTTPS: 443 . (Formerly praqma/network-multitool)

### Задание 2.

kubectl get pods -l app=nginx-init -w
NAME                          READY   STATUS     RESTARTS   AGE
nginx-init-6d94f46f88-2nlv4   0/1     Init:0/1   0          66s

kubectl get svc nginx-init-svc
NAME             TYPE        CLUSTER-IP     EXTERNAL-IP   PORT(S)   AGE
nginx-init-svc   ClusterIP   10.233.16.50   <none>        80/TCP    4m34s

kubectl get pods -l app=nginx-init -w
NAME                          READY   STATUS    RESTARTS   AGE
nginx-init-6b676c6558-2v29t   1/1     Running   0          9m8s
