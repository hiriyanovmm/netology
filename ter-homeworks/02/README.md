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
