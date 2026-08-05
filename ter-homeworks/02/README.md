# Задание 1

скриншот ЛК Yandex Cloud с созданной ВМ, где видно внешний ip-адрес

<img width="1649" height="85" alt="image" src="https://github.com/user-attachments/assets/9c2a19c7-1234-4545-af0c-fb0f22af8387" />  

  
скриншот консоли, curl должен отобразить тот же внешний ip-адрес

<img width="379" height="31" alt="image" src="https://github.com/user-attachments/assets/55e53e4c-9f76-429c-805f-afbd75fee003" />


ответы на вопросы:
- Ошибка в платформе, "Platform "standart-v4" not found". Такой платформы нет https://yandex.cloud/ru/docs/compute/concepts/vm-platforms
- выбрал платформу standart-v2 изменив v4 на v2, получил ошибку "Platform "standart-v2" not found", скопировал название платформы из документации.
- выбрал платформу standart-v2, получил ошибку "the specified number of cores is not available on platform "standard-v2"; allowed core number: 2, 4". Исправил количество ядер на 2
- preemptible = true и core_fraction = 5 позволяет создать максимально бюджетную ВМ

# Задание 2

<img width="1214" height="197" alt="image" src="https://github.com/user-attachments/assets/267362ab-2402-4765-9125-8558ea69db34" />

# Задание 3

<img width="1367" height="127" alt="image" src="https://github.com/user-attachments/assets/edf3bb9f-732e-4dca-9d1d-143086683f65" />


# Задание 4

<img width="518" height="236" alt="image" src="https://github.com/user-attachments/assets/464eacb7-a021-4aa3-a3d7-25d4df158113" />

# Задание 5

Добавил в имя ВМ зону доступности

<img width="1066" height="266" alt="image" src="https://github.com/user-attachments/assets/f4df63ca-c04a-4ebc-8f9e-7cebb4768e92" />

# Задание 6

<img width="805" height="221" alt="image" src="https://github.com/user-attachments/assets/574c4430-e31b-4ee8-8b31-98b25c9553c5" />

# Задание 7*

1. local.test_list[1]
2. length(local.test_list)
3. local.test_map.admin
4. "${local.test_map.admin} is ${keys(local.test_map)[0]} for ${local.test_list[2]} server based on OS ${local.servers.production.image} with ${local.servers.production.cpu} vcpu, ${local.servers.production.ram} ram and ${length(local.servers.production.disks)} virtual disks"

# Задание 9*

<img width="558" height="166" alt="image" src="https://github.com/user-attachments/assets/db27d092-acd1-45dd-a7ef-e9c8c45eb92c" />

