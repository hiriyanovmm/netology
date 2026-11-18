### Задание 1. Volume: обмен данными между контейнерами в поде
``` bash
kubectl describe pods data-exchangege
```
``` text
Name:             data-exchange-c978d86f6-mctrx
Namespace:        default
Priority:         0
Service Account:  default
Node:             k8s-w1/192.168.88.31
Start Time:       Mon, 16 Nov 2026 18:59:56 +0000
Labels:           app=data-exchange
                  pod-template-hash=c978d86f6
Annotations:      cni.projectcalico.org/containerID: 6ec6dde5785f914f67c3823b52c0c8b5356aebfda59bec7043d2d22f5007bf7f
                  cni.projectcalico.org/podIP: 10.233.103.170/32
                  cni.projectcalico.org/podIPs: 10.233.103.170/32
Status:           Running
IP:               10.233.103.170
IPs:
  IP:           10.233.103.170
Controlled By:  ReplicaSet/data-exchange-c978d86f6
Containers:
  busybox:
    Container ID:  containerd://515ccba8c759933f3a0c3eb6fcac819d62eed7bcb9b15b329d49b5682decab0a
    Image:         busybox
    Image ID:      docker.io/library/busybox@sha256:a46257e06c82ad85242d0d38077d0a52d9896389ca60a1a59d3463db586e5fa4
    Port:          <none>
    Host Port:     <none>
    Command:
      /bin/sh
      -c
    Args:
      while true; do
        echo "$(date) — сообщение от busybox" >> /data/shared-file.txt;
        sleep 5;
      done
      
    State:          Running
      Started:      Mon, 16 Nov 2026 19:00:10 +0000
    Ready:          True
    Restart Count:  0
    Environment:    <none>
    Mounts:
      /data from shared-data (rw)
      /var/run/secrets/kubernetes.io/serviceaccount from kube-api-access-pmw8p (ro)
  multitool:
    Container ID:  containerd://9d5faa1042c5445f103bf6b77a9bddfacfa564712ff7f7da4d3ca1de98516bed
    Image:         wbitt/network-multitool
    Image ID:      docker.io/wbitt/network-multitool@sha256:98d24ba5e94c74b153603dc4022aa15100ce33bccf7d0d59f8c2a3e088c90471
    Port:          <none>
    Host Port:     <none>
    Command:
      /bin/sh
      -c
    Args:
      tail -f /data/shared-file.txt
    State:          Running
      Started:      Mon, 16 Nov 2026 19:00:14 +0000
    Ready:          True
    Restart Count:  0
    Environment:    <none>
    Mounts:
      /data from shared-data (rw)
      /var/run/secrets/kubernetes.io/serviceaccount from kube-api-access-pmw8p (ro)
Conditions:
  Type                        Status
  PodReadyToStartContainers   True 
  Initialized                 True 
  Ready                       True 
  ContainersReady             True 
  PodScheduled                True 
Volumes:
  shared-data:
    Type:       EmptyDir (a temporary directory that shares a pod's lifetime)
    Medium:     
    SizeLimit:  <unset>
  kube-api-access-pmw8p:
    Type:                    Projected (a volume that contains injected data from multiple sources)
    TokenExpirationSeconds:  3607
    ConfigMapName:           kube-root-ca.crt
    Optional:                false
    DownwardAPI:             true
QoS Class:                   BestEffort
Node-Selectors:              <none>
Tolerations:                 node.kubernetes.io/not-ready:NoExecute op=Exists for 300s
                             node.kubernetes.io/unreachable:NoExecute op=Exists for 300s
Events:
  Type    Reason     Age   From               Message
  ----    ------     ----  ----               -------
  Normal  Scheduled  37s   default-scheduler  Successfully assigned default/data-exchange-c978d86f6-mctrx to k8s-w1
  Normal  Pulling    35s   kubelet            Pulling image "busybox"
  Normal  Pulled     25s   kubelet            Successfully pulled image "busybox" in 10.712s (10.712s including waiting). Image size: 2236767 bytes.
  Normal  Created    24s   kubelet            Created container: busybox
  Normal  Started    24s   kubelet            Started container busybox
  Normal  Pulling    24s   kubelet            Pulling image "wbitt/network-multitool"
  Normal  Pulled     20s   kubelet            Successfully pulled image "wbitt/network-multitool" in 3.455s (3.455s including waiting). Image size: 26477354 bytes.
  Normal  Created    20s   kubelet            Created container: multitool
  Normal  Started    19s   kubelet            Started container multitool
```

``` bash
kubectl exec -it $POD -c multitool -- tail -f /data/shared-file.txt
```
``` text
Mon Nov 16 19:00:20 UTC 2026 — сообщение от busybox
Mon Nov 16 19:00:25 UTC 2026 — сообщение от busybox
Mon Nov 16 19:00:30 UTC 2026 — сообщение от busybox
Mon Nov 16 19:00:35 UTC 2026 — сообщение от busybox
Mon Nov 16 19:00:40 UTC 2026 — сообщение от busybox
```
