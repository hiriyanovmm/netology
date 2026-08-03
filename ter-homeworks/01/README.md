<img width="186" height="43" alt="image" src="https://github.com/user-attachments/assets/7bb2e921-a90d-433f-80e4-eefbee1bc476" />

Задание 1
1. Перейдите в каталог src. Скачайте все необходимые зависимости, использованные в проекте.
<img width="793" height="167" alt="image" src="https://github.com/user-attachments/assets/d592b813-e8d6-4afa-b1d7-61e788a6a801" />

2. Изучите файл .gitignore. В каком terraform-файле, согласно этому .gitignore, допустимо сохранить личную, секретную информацию?(логины,пароли,ключи,токены итд)

.terraformrc

3. Выполните код проекта. Найдите в state-файле секретное содержимое созданного ресурса random_password, пришлите в качестве ответа конкретный ключ и его значение.

"result": "3UxeCo5ESTnAwMLY"

4. Раскомментируйте блок кода, примерно расположенный на строчках 29–42 файла main.tf. Выполните команду terraform validate. Объясните, в чём заключаются намеренно допущенные ошибки. Исправьте их.

- Ресурс docker_image имел только один label. All resource blocks must have 2 labels (type, name).
- Ошибка в имени label - "1nginx", имя label должно начинаться с буквы или символа нижнего подчеркивания.
- Ошибка в строке random_password.random_string_FAKE.resulT, правильно - random_password.random_string.result

<img width="624" height="40" alt="image" src="https://github.com/user-attachments/assets/61ea17cb-0791-49dd-bb9b-c3b648fb7f99" />

5. Выполните код. В качестве ответа приложите: исправленный фрагмент кода и вывод команды docker ps

<img width="1379" height="65" alt="image" src="https://github.com/user-attachments/assets/68eaaed5-541d-4676-8493-d959e6277eb9" />

6. Замените имя docker-контейнера в блоке кода на hello_world.

<img width="1324" height="61" alt="image" src="https://github.com/user-attachments/assets/5d83d5de-fa73-4664-8f5b-4c94ba2929c2" />

- terraform apply -auto-approve выполняется без запроса подтверждения, что приводит к риску изменения или удаления важных ресурсов
- ключ полезен в различных автоматизациях, скрипты, CI/CD

7. Уничтожьте созданные ресурсы с помощью terraform.

```
terraform.tfstate
{
  "version": 4,
  "terraform_version": "1.15.8",
  "serial": 16,
  "lineage": "04d3120f-cda5-8a56-ce56-fc7162d5df8d",
  "outputs": {},
  "resources": [],
  "check_results": null
}
```

8. Объясните, почему при этом не был удалён docker-образ nginx:latest

В коде указан параметр keep_locally

- keep_locally (Boolean) If true, then the Docker image won't be deleted on destroy operation. If this is false, it will delete the image from the docker local storage on destroy operation.
