### Задание 1:

Создать Deployment с двумя контейнерами

``` bash
kubectl get deployment multi-container-app
```
``` text
NAME                  READY   UP-TO-DATE   AVAILABLE   AGE
multi-container-app   3/3     3            3           23s
```
``` bash
kubectl get pods -l app=multi-container-app -o wide
```
``` text
NAME                                   READY   STATUS    RESTARTS   AGE   IP               NODE     NOMINATED NODE   READINESS GATES
multi-container-app-774bb87f65-2xg2f   2/2     Running   0          31s   10.233.103.162   k8s-w1   <none>           <none>
multi-container-app-774bb87f65-8t5qh   2/2     Running   0          31s   10.233.103.161   k8s-w1   <none>           <none>
multi-container-app-774bb87f65-p6slr   2/2     Running   0          31s   10.233.103.163   k8s-w1   <none>           <none>
```

Создать Service типа ClusterIP, который
``` bash
kubectl get svc multi-container-clusterip multi-container-nodeport
```
``` text
NAME                        TYPE        CLUSTER-IP      EXTERNAL-IP   PORT(S)             AGE
multi-container-clusterip   ClusterIP   10.233.22.147   <none>        9001/TCP,9002/TCP   31s
multi-container-nodeport    NodePort    10.233.51.14    <none>        80:30080/TCP        23s
```

Проверить доступность изнутри кластера:

``` bash
kubectl run test-pod --image=wbitt/network-multitool --rm -it -- sh
```
``` text
If you don't see a command prompt, try pressing enter.
/ # curl multi-container-clusterip:9001
<!DOCTYPE html>
<html>
<head>
<title>Welcome to nginx!</title>
<style>
html { color-scheme: light dark; }
body { width: 35em; margin: 0 auto;
font-family: Tahoma, Verdana, Arial, sans-serif; }
</style>
</head>
<body>
<h1>Welcome to nginx!</h1>
<p>If you see this page, the nginx web server is successfully installed and
working. Further configuration is required.</p>

<p>For online documentation and support please refer to
<a href="http://nginx.org/">nginx.org</a>.<br/>
Commercial support is available at
<a href="http://nginx.com/">nginx.com</a>.</p>

<p><em>Thank you for using nginx.</em></p>
</body>
</html>
/ # curl multi-container-clusterip:9002
WBITT Network MultiTool (with NGINX) - multi-container-app-774bb87f65-p6slr - 10.233.103.163 - HTTP: 8080 , HTTPS: 443 . (Formerly praqma/network-multitool)
```

### Задание 2

Создать Deployment с двумя контейнерами:
``` bash
kubectl get deployments
```
``` text
NAME                  READY   UP-TO-DATE   AVAILABLE   AGE
backend               1/1     1            1           27s
frontend              1/1     1            1           34s
```

Создать Service для каждого приложения:
``` bash
kubectl get svc frontend-svc backend-svc
```
``` text
NAME           TYPE        CLUSTER-IP      EXTERNAL-IP   PORT(S)   AGE
frontend-svc   ClusterIP   10.233.11.197   <none>        80/TCP    38s
backend-svc    ClusterIP   10.233.57.242   <none>        80/TCP    32s
```

Включить Ingress-контроллер:
``` bash
kubectl get ingress example-ingress -o wide
```
``` text
NAME              CLASS    HOSTS   ADDRESS   PORTS   AGE
example-ingress   <none>   *                 80      4m48s
```

Проверить доступность:
``` bash
curl -v http://192.168.88.31:31966/
```
``` text
*   Trying 192.168.88.31:31966...
* Connected to 192.168.88.31 (192.168.88.31) port 31966
> GET / HTTP/1.1
> Host: 192.168.88.31:31966
> User-Agent: curl/8.5.0
> Accept: */*
>
< HTTP/1.1 200 OK
< Date: Sun, 15 Nov 2026 16:43:51 GMT
< Content-Type: text/html
< Content-Length: 615
< Connection: keep-alive
< Last-Modified: Wed, 16 Apr 2025 12:01:11 GMT
< ETag: "67ff9c07-267"
< Accept-Ranges: bytes
<
<!DOCTYPE html>
<html>
<head>
<title>Welcome to nginx!</title>
<style>
```
``` bash
curl -v http://192.168.88.31:31966/api
```
``` text
*   Trying 192.168.88.31:31966...
* Connected to 192.168.88.31 (192.168.88.31) port 31966
> GET /api HTTP/1.1
> Host: 192.168.88.31:31966
> User-Agent: curl/8.5.0
> Accept: */*
>
< HTTP/1.1 200 OK
< Date: Sun, 15 Nov 2026 16:51:09 GMT
< Content-Type: text/html
< Content-Length: 143
< Connection: keep-alive
< Last-Modified: Sun, 15 Nov 2026 16:31:59 GMT
< ETag: "6af9de7f-8f"
< Accept-Ranges: bytes
<
WBITT Network MultiTool (with NGINX) - backend-77bc84588d-srhml - 10.233.103.166 - HTTP: 80 , HTTPS: 443 . (Formerly praqma/network-multitool)
* Connection #0 to host 192.168.88.31 left intact
```
