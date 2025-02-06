# Zsh Config

https://toabr.de/node/165

## Plugins

> Plugins are automatically downloaded to `$ZDOTDIR/plugins` and sourced, see [here](zsh/functions)

- [zsh-users/zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions)
- [zsh-users/zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting)
- [zsh-users/zsh-history-substring-search](https://github.com/zsh-users/zsh-history-substring-search)
- [zsh-git-prompt/zsh-git-prompt](https://github.com/zsh-git-prompt/zsh-git-prompt)

## Install zsh on Ubuntu

```
sudo apt install zsh

# change users default login shell
chsh -s /usr/bin/zsh
```

## Stow zsh config files

```
mkdir -p ~/.config/zsh/plugins && \
  cd ~/.dotfiles && \
  stow -Svt ~ zsh
```

## Download [fzf](https://github.com/junegunn/fzf)

```
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.local/fzf && \
  ~/.local/fzf/install --bin
```
