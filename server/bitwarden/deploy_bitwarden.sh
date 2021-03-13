#!/bin/bash

env="$1"

RELEASE_DUPLICACY="https://github.com/gilbertchen/duplicacy/releases/download/v2.7.2/duplicacy_linux_x64_2.7.2"
GH_URL="https://ghproxy.com/"
DOCKER_COMPOSE="https://raw.githubusercontent.com/jasmineamber/server_deploy/master/server/bitwarden/docker-compose.yml"
DOCKER_DAEMON="https://raw.githubusercontent.com/jasmineamber/server_deploy/master/server/bitwarden/daemon.json"

if [[ ! -z "$env" && $env == "china" ]]; then
  #  配置 docker registry-mirrors
  wget ${GH_URL}${DOCKER_DAEMON} -O /etc/docker/daemon.json
  #  duplicacy 下载地址
  RELEASE_DUPLICACY=${GH_URL}${RELEASE_DUPLICACY}
  # docker compose 配置文件
  DOCKER_COMPOSE=${GH_URL}${DOCKER_COMPOSE}
fi

# 下载duplicacy
wget ${RELEASE_DUPLICACY} -O /usr/bin/duplicacy
chmod +x /usr/bin/duplicacy

# 配置onedriver token
read -p "please input onedrive token: " onetoken
echo $onetoken >one-token.json

# 初始化duplicacy
mkdir bw-data
cd bw-data
duplicacy init bitwarden one://Bitwarden

# 配置duplicacy排除文件
echo "-icon_cache/" >.duplicacy/filters

# 恢复数据
duplicacy list | awk 'END{print $4}' | xargs duplicacy restore -r

# 切换到上级目录
cd ..

# 下载docker配置文件
wget ${DOCKER_COMPOSE}

# 启动docker
docker-compose up -d
