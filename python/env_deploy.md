# 安装pyenv
- 安装依赖
```shell script
apt-get install --no-install-recommends make build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev
```
- 官方安装方式
```shell script
curl -L https://github.com/pyenv/pyenv-installer/raw/master/bin/pyenv-installer | bash
```

- 国内安装方式

由于从github上clone很慢, 使用[ghproxy](https://ghproxy.com/)加速, 修改`pyenv-installer`后, 执行
```shell script
bash pyenv-installer
```

# 安装poetry
- 官方安装方式
```shell script
curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/get-poetry.py | python -
```

- 国内安装方式

由于从github上clone很慢, 使用[ghproxy](https://ghproxy.com/)加速, 修改`get-poetry.py`后, 执行
```shell script
python get-poetry.py
```