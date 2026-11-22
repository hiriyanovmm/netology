### Задание 1: Работа с ConfigMaps

#### Скриншот вывода curl или браузера

<img width="610" height="429" alt="image" src="https://github.com/user-attachments/assets/0043e8c7-87d0-4357-a6a1-6a18e1e55839" />


### Задание 2: Настройка HTTPS с Secrets

#### Скриншот вывода curl -k

<img width="621" height="446" alt="image" src="https://github.com/user-attachments/assets/333c9b96-4683-4a92-a1fd-e1551353f3f6" />


### Задание 3: Настройка RBAC

Что сдать на проверку
Манифесты:
role-pod-reader.yaml
rolebinding-developer.yaml

#### Команды генерации сертификатов
``` bash
openssl genrsa -out developer.key 2048
openssl req -new -key developer.key -out developer.csr -subj '/CN=developer'
CSR_NAME="developer-lab-$(date +%s)"
```
``` bash
kubectl create -f - <<EOF
apiVersion: certificates.k8s.io/v1
kind: CertificateSigningRequest
metadata:
  name: ${CSR_NAME}
spec:
  request: $(base64 -w0 developer.csr)
  signerName: kubernetes.io/kube-apiserver-client
  expirationSeconds: 86400
  usages:
    - client auth
EOF
certificatesigningrequest.certificates.k8s.io/developer-lab-1795359607 created
```
``` bash
kubectl certificate approve "$CSR_NAME"
certificatesigningrequest.certificates.k8s.io/developer-lab-1795359607 approved
```
``` bash
openssl x509 -in developer.crt -noout -subject -issuer -dates
subject=CN = developer
issuer=CN = kubernetes
notBefore=Nov 22 14:56:08 2026 GMT
notAfter=Nov 23 14:56:08 2026 GMT
```

#### Скриншот проверки прав (kubectl get pods --as=developer)

<img width="735" height="62" alt="image" src="https://github.com/user-attachments/assets/cdb6708c-bda2-45bb-b8c3-f49e85741d92" />
