#!/usr/bin/env bash

# Переключаемся на master ветку
git fetch && git checkout master && git pull && \

# Удаляем контейнер
docker compose rm -f -s sa-demo && \

# Удаляем образ
docker rmi -f sa-demo:0.0.1-SNAPSHOT && \

# Удаление предыдущего билда на всякий случай
rm -rf target && \

# Собираем новый образ
mvn -DskipTests spring-boot:build-image && \

# Запускаем контейнер
docker compose up -d sa-demo && \

# Смотрим логи, чтобы убедится в успешном запуске
docker compose logs -f sa-demo