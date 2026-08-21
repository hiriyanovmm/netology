#!/usr/bin/env bash
set -euo pipefail

CENTOS_NAME="centos7"
UBUNTU_NAME="ubuntu"
CENTOS_IMAGE="centos:7"
UBUNTU_IMAGE="ubuntu:24.04"
INVENTORY_FILE="playbook/inventory/prod.yml"
PLAYBOOK_FILE="playbook/site.yml"
KEEP_CONTAINERS="${KEEP_CONTAINERS:-0}"

cleanup() {
  if [[ "$KEEP_CONTAINERS" == "1" ]]; then
    echo "KEEP_CONTAINERS=1, пропускаю остановку и удаление контейнеров"
    return
  fi

  docker rm -f "$CENTOS_NAME" "$UBUNTU_NAME" >/dev/null 2>&1 || true
}

trap cleanup EXIT

require_cmd() {
  command -v "$1" >/dev/null 2>&1 || {
    echo "Не найдена команда: $1" >&2
    exit 1
  }
}

require_cmd docker
require_cmd ansible-playbook

if [[ ! -f "$INVENTORY_FILE" ]]; then
  echo "Не найден inventory: $INVENTORY_FILE" >&2
  exit 1
fi

if [[ ! -f "$PLAYBOOK_FILE" ]]; then
  echo "Не найден playbook: $PLAYBOOK_FILE" >&2
  exit 1
fi

start_container() {
  local name="$1"
  local image="$2"

  if docker ps -a --format '{{.Names}}' | grep -Fxq "$name"; then
    docker rm -f "$name" >/dev/null 2>&1 || true
  fi

  docker run -d --name "$name" "$image" sleep infinity >/dev/null
}

install_python_ubuntu() {
  docker exec "$UBUNTU_NAME" sh -lc 'apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y python3 python3-apt'
}

echo "==> Поднимаю контейнеры"
start_container "$CENTOS_NAME" "$CENTOS_IMAGE"
start_container "$UBUNTU_NAME" "$UBUNTU_IMAGE"

echo "==> Устанавливаю Python в Ubuntu-контейнер"
install_python_ubuntu

echo "==> Запускаю ansible-playbook"
ansible-playbook -i "$INVENTORY_FILE" "$PLAYBOOK_FILE" --ask-vault-pass

echo "==> Playbook завершён успешно"
