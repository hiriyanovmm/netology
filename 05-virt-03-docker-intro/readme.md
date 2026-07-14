### Задача 1

https://hub.docker.com/repository/docker/mhiriyanov/custom-nginx/general

### Задача 2

![alt text](image.png)

![alt text](image-1.png)

### Задача 3

<img width="1275" height="522" alt="image" src="https://github.com/user-attachments/assets/0363c88a-298b-49fa-a135-3a5c7cf1bb22" />

Контейнер остановился потому что была передана команда Ctrl+C, которая отсановила главный процесс контейнера. Когда завершается процесс, контейнер останавливается.

<img width="825" height="80" alt="image" src="https://github.com/user-attachments/assets/ea98b105-570a-4935-ae47-333f5cc3eb59" />

<img width="1605" height="929" alt="image" src="https://github.com/user-attachments/assets/7ff3de46-ed60-42ac-a5f8-64c81fe20c98" />

<img width="974" height="479" alt="image" src="https://github.com/user-attachments/assets/6b056a8e-ea70-4cd7-a05c-e5fc28cd9083" />

Процесс ngins после команды ```nginx -s reload``` начал слушать порт 81, при этом docker продолжает отправлять трафик на порт 80.

Решить проблему можно через порт форвардинг:

```iptables -t nat -A OUTPUT -p tcp -d 127.0.0.1 --dport 8080 -j REDIRECT --to-ports 81```

<img width="744" height="56" alt="image" src="https://github.com/user-attachments/assets/a8bd4c29-afd0-4f8a-9535-ad09bb9371df" />

### Задача 4

Запустите первый контейнер из образа centos c любым тегом в фоновом режиме, подключив папку текущий рабочий каталог $(pwd) на хостовой машине в /data контейнера, используя ключ -v.
<img width="723" height="55" alt="image" src="https://github.com/user-attachments/assets/2b551b4e-9f67-44b0-aace-e486ef99f945" />


<img width="1303" height="272" alt="image" src="https://github.com/user-attachments/assets/b7b5598b-7e57-48d9-8bed-0537520a6217" />


<img width="527" height="64" alt="image" src="https://github.com/user-attachments/assets/dff78b38-3194-4feb-9c79-96d1c62c0d5f" />


<img width="371" height="49" alt="image" src="https://github.com/user-attachments/assets/59e06ce6-9447-48a1-bd3f-0de307d808fd" />


<img width="533" height="489" alt="image" src="https://github.com/user-attachments/assets/5fdb1b08-699e-43c8-952c-284dcafe5ddd" />


### Задача 5
