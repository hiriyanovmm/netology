# Домашнее задание к занятию 3 «Использование Ansible»

## Ansible Playbook: ClickHouse, Vector, LightHouse

### clickhouse — установка ClickHouse, перезапуск сервиса и создание БД logs.

### vector — установка Vector через официальный скрипт.

### lighthouse — установка Nginx, загрузка и установка LightHouse, настройка Nginx.

Playbook состоит из трёх отдельных plays и может применяться как целиком, так и по группам хостов из inventory.

Что делает playbook

### Play 1: Install Clickhouse
Для группы clickhouse playbook выполняет следующие действия:

- Скачивает RPM-пакеты ClickHouse по указанной версии.

При ошибке URL в блоке загрузки выполняет rescue и повторно скачивает clickhouse-common-static с другого URL.

- Устанавливает пакеты:

clickhouse-common-static
clickhouse-client
clickhouse-server

- Перезапускает сервис clickhouse-server через handler.

- Принудительно выполняет handlers через meta: flush_handlers.

- Создаёт БД logs, если она ещё не существует.

Особенность логики создания БД:

код возврата 0 считается успешным созданием;
код возврата 82 интерпретируется как ситуация, когда база уже существует;

в этом случае задача не считается ошибочной.

### Play 2: Install Vector
Для группы vector playbook:

- Скачивает официальный скрипт Vector в /tmp/vector-installer.sh.

- Запускает установку через команду.

- Передаёт версию через переменную окружения VECTOR_VERSION.

- Помечает задачу как изменённую только если Vector не был установлен ранее.


### Play 3: Install LightHouse
Для группы lighthouse playbook:

- Добавляет репозиторий nginx-stable.

- Устанавливает Nginx.

- Создаёт каталог /usr/share/nginx/html/lighthouse.

- Скачивает архив LightHouse c GitHub.

- Устанавливает unzip.

- Распаковывает архив во временный каталог.

- Копирует файлы LightHouse в web-root Nginx.

- Записывает конфигурацию Nginx из шаблона lighthouse.conf.j2.

- Запускает и включает сервис nginx.

- При изменении конфигурации перезапускает Nginx через handler.

### Параметры

Ниже перечислены переменные, которые используются в playbook.

- clickhouse_version	Версия ClickHouse, используемая при скачивании и установке RPM-пакетов.
- clickhouse_packages	['clickhouse-common-static', 'clickhouse-client', 'clickhouse-server']	Список пакетов ClickHouse для загрузки.
- vector_version	Да	0.34.0	Версия Vector, передаваемая через переменную окружения VECTOR_VERSION.

### Требования к inventory
В inventory должны быть определены группы:

- clickhouse
- vector
- lighthouse

### Внешние зависимости
Для корректной работы playbook необходимы:

доступ хостов к интернет-ресурсам packages.clickhouse.com, sh.vector.dev, nginx.org, github.com;

наличие шаблона lighthouse.conf.j2 в каталоге templates/ ;


### Теги

Добавлены такие теги:

- clickhouse	Все задачи первого play	Установка и настройка ClickHouse.
- vector	Все задачи второго play	Установка Vector.
- lighthouse	Все задачи третьего play	Установка LightHouse и Nginx.

Пример возможного запуска тегов:

- ansible-playbook site.yml --tags clickhouse
- ansible-playbook site.yml --tags lighthouse
- ansible-playbook site.yml --tags vector

Пример запуска только для одной группы хостов:

ansible-playbook playbook.yml -i inventory/prod.yml --limit clickhouse
