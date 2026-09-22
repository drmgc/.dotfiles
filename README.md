# drmgc-dotfiles

## Описание
**drmgc-dotfiles** -- это набор конфигов, которым я пользуюсь

## Установки

Склонируйте репозиторий, а затем чтобы конфиги заработали нужно выполнить `make` в директории конфигов

```console
cd ~/.dotfiles
make
```

Также в Vim для установки плагинов нужно выполнить `:VundleInstall`

## Контакты
[Bitbucket](https://bitbucket.org/drmgc)
[GitHub](https://github.com/DrMGC)

## Dependecies

### Ubuntu

```sh
sudo apt install -y \
    curl wget build-essential \
    zsh \
    ripgrep \
    git lazygit
    mc

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```
