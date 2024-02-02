# .dotfiles

**README:**

- [zsh](zsh)
- [tmux](tmux)
- [vim](vim)
- [NeoVim](nvim)

<br/>

## Manage dotfiles using `stow`

https://toabr.de/node/169

```
sudo apt install stow
```

### Clone the .dotfiles repo

```
cd ~ && git clone https://github.com/toabr/.dotfiles.git
```

### Stow configs

```
cd ~/.dotfiles

# pay attention to your folder structure
mkdir ~/.config/nvim

stow -Svt ~ nvim
```

<br/>

## Using [nix](https://nixos.org/)

**Requirements:** git, curl, xz-utils, sudo

### Download [nix package manager](https://nixos.org/manual/nix/stable/installation/installing-binary.html#multi-user-installation) 
```
curl -L https://nixos.org/nix/install | sh -s -- --daemon
```

### Run the install script

```
~/.dotfiles/install.sh
```

