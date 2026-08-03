<img width="186" height="43" alt="image" src="https://github.com/user-attachments/assets/7bb2e921-a90d-433f-80e4-eefbee1bc476" />

Задание 1
1. Перейдите в каталог src. Скачайте все необходимые зависимости, использованные в проекте.
<img width="793" height="167" alt="image" src="https://github.com/user-attachments/assets/d592b813-e8d6-4afa-b1d7-61e788a6a801" />

2. Изучите файл .gitignore. В каком terraform-файле, согласно этому .gitignore, допустимо сохранить личную, секретную информацию?(логины,пароли,ключи,токены итд)

.terraformrc

4. Выполните код проекта. Найдите в state-файле секретное содержимое созданного ресурса random_password, пришлите в качестве ответа конкретный ключ и его значение.

"result": "3UxeCo5ESTnAwMLY"

5. Раскомментируйте блок кода, примерно расположенный на строчках 29–42 файла main.tf. Выполните команду terraform validate. Объясните, в чём заключаются намеренно допущенные ошибки. Исправьте их.

- Ресурс docker_image имел только один label. All resource blocks must have 2 labels (type, name).
- Ошибка в имени label - "1nginx", имя label должно начинаться с буквы или символа нижнего подчеркивания.
- Ошибка в строке random_password.random_string_FAKE.resulT, правильно - random_password.random_string.result

<img width="624" height="40" alt="image" src="https://github.com/user-attachments/assets/61ea17cb-0791-49dd-bb9b-c3b648fb7f99" />


6. 
