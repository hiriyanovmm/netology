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

Запустите второй контейнер из образа debian в фоновом режиме, подключив текущий рабочий каталог $(pwd) в /data контейнера.
<img width="1303" height="272" alt="image" src="https://github.com/user-attachments/assets/b7b5598b-7e57-48d9-8bed-0537520a6217" />

Подключитесь к первому контейнеру с помощью docker exec и создайте текстовый файл любого содержания в /data.
<img width="527" height="64" alt="image" src="https://github.com/user-attachments/assets/dff78b38-3194-4feb-9c79-96d1c62c0d5f" />

Добавьте ещё один файл в текущий каталог $(pwd) на хостовой машине.
<img width="371" height="49" alt="image" src="https://github.com/user-attachments/assets/59e06ce6-9447-48a1-bd3f-0de307d808fd" />

Подключитесь во второй контейнер и отобразите листинг и содержание файлов в /data контейнера.
<img width="533" height="489" alt="image" src="https://github.com/user-attachments/assets/5fdb1b08-699e-43c8-952c-284dcafe5ddd" />


### Задача 5
2. Отредактируйте файл compose.yaml так, чтобы были запущенны оба файла. (подсказка: https://docs.docker.com/compose/compose-file/14-include/)

<img width="493" height="238" alt="image" src="https://github.com/user-attachments/assets/3d89ee2f-9064-44eb-9001-d762f97659e7" />

3. Выполните в консоли вашей хостовой ОС необходимые команды чтобы залить образ custom-nginx как custom-nginx:latest в запущенное вами, локальное registry. Дополнительная документация: https://distribution.github.io/distribution/about/deploying/

<img width="966" height="268" alt="image" src="https://github.com/user-attachments/assets/a4e54174-c6fc-4c49-9358-fe24c83c2b08" />


6. Перейдите на страницу "http://127.0.0.1:9000/#!/2/docker/containers", выберите контейнер с nginx и нажмите на кнопку "inspect". В представлении <> Tree разверните поле "Config" и сделайте скриншот от поля "AppArmorProfile" до "Driver"
   
<img width="641" height="848" alt="image" src="https://github.com/user-attachments/assets/574129fc-d5a6-4012-a7b9-2fdf7b1dee6a" />
