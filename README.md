# .dotfiles

- ...
- [zsh](zsh/.config/zsh)
- tmux
- [NeoVim](nvim/.config/nvim)

<br/>

## Manage `dotfiles` using `stow`

https://toabr.de/node/169

**Clone the repo**

`git clone https://github.com/toabr/.dotfiles.git ~/.mydotfiles`

**Install Stow:**

`sudo apt install stow`

**Cd into `.mydotfiles` and install nvim configs**

`stow -Svt ~ nvim`
