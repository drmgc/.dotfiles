# drmgc-dotfiles

Configs that I use

## Installation

### WSL

```
wsl --install -d Ubuntu
```

### Linux Dependecies

#### Ubuntu

```sh
sudo apt update && \
sudo apt install -y \
    curl wget build-essential bsdmainutils \
    zsh \
    ripgrep bat \
    git \
    gpg pass \
    lazygit \
    htop bat fzf \
    gawk dirmngr procps file \
    mc
```

```
sudo ln -s $(which batcat) /usr/local/bin/bat
```

### Alacritty

> TODO: refine alacritty part
> TODO: write note on Hack Nerd Fonts
```
cp $HOME/.config/alacritty/alacritty.toml \
    /mnt/c/Users/_USERNAME_/AppData/Roaming/alacritty

mkdir -p ~/.config/alacritty/themes
git clone https://github.com/alacritty/alacritty-theme ~/.config/alacritty/themes
```

### Oh My Zsh


```sh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

### Linking Up Configs

```
make git zsh
```

### Generating SSH keys

```sh
ssh-keygen -t ed25519 -C "drmgc@yandex.ru"
ln -svn ~/.ssh/id_ed25519 ~/.ssh/id_ed25519_git && \
    ln -svn ~/.ssh/id_ed25519_pub ~/.ssh/id_ed25519_git.pub
```


### NeoVim

```sh
cd /tmp

# https://github.com/neovim/neovim/releases
wget https://github.com/neovim/neovim/releases/download/v0.12.5/nvim-linux-x86_64.tar.gz

tar xzcf nvim-linux-x86_64.tar.gz

mkdir -p ~/.local/opt
mv ./nvim-linux-x86_64 ~/.local/opt/nvim

ln -s ~/.local/opt/nvim/bin/nvim ~/.local/bin/nvim

# Check if it is running
nv 
```

```sh
git clone git@github.com:drmgc/nvim.d.git ~/.config/nvim
```

### Rust

```sh
# Install Rust
curl https://sh.rustup.rs -sSf | sh

# You probably will need it OR exit the shell
. "$HOME/.cargo/env"
```


### Zellij

```sh
# Install Zellij
cargo install --locked zellij
```

### Brew

```sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
```

### asdf

```sh
brew install asdf
asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git
asdf install nodejs latest
asdf set nodejs VERSION
echo 'legacy_version_file = yes' >> .asdfrc
```

