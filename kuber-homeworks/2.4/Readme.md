
``` bash
helm install app-v1 . -n app1 --create-namespace -f values-v1.yaml
```
``` text
NAME: app-v1
LAST DEPLOYED: Sat Nov 28 07:14:03 2026
NAMESPACE: app1
STATUS: deployed
REVISION: 1
DESCRIPTION: Install complete
TEST SUITE: None
```
``` bash
helm install app-v2 . -n app1 -f values-v2.yaml
```
``` text
NAME: app-v2
LAST DEPLOYED: Sat Nov 28 07:16:56 2026
NAMESPACE: app1
STATUS: deployed
REVISION: 1
DESCRIPTION: Install complete
TEST SUITE: None
```
``` bash
helm install app-v3 . -n app2 --create-namespace -f values-v3.yaml
```
``` text
NAME: app-v3
LAST DEPLOYED: Sat Nov 28 07:18:40 2026
NAMESPACE: app2
STATUS: deployed
REVISION: 1
DESCRIPTION: Install complete
TEST SUITE: None
```
``` bash
kubectl get po -n app1
```
``` text
NAME                               READY   STATUS    RESTARTS   AGE
app-v1-backend-7ff5bd4464-xn9x8    1/1     Running   0          7m15s
app-v1-db-0                        1/1     Running   0          7m15s
app-v1-frontend-c8fc798f7-z99tr    1/1     Running   0          7m15s
app-v2-backend-66d86d9c89-z55nj    1/1     Running   0          4m22s
app-v2-db-0                        1/1     Running   0          4m22s
app-v2-frontend-6776796848-g9nvn   1/1     Running   0          4m22s
```
``` bash
kubectl get po -n app2
```
``` text
NAME                              READY   STATUS    RESTARTS   AGE
app-v3-backend-7d4576878-2j7qr    1/1     Running   0          2m43s
app-v3-db-0                       1/1     Running   0          2m43s
app-v3-frontend-886d78798-ckjsg   1/1     Running   0          2m43s
```
