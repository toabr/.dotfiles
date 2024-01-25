#!/usr/bin/bash

# install nix
# curl -L https://nixos.org/nix/install | sh -s -- --daemon

# install packages
nix-env -iA \
	nixpkgs.bat \
	nixpkgs.direnv \
	nixpkgs.fd \
	nixpkgs.fzf \
	nixpkgs.gcc \
	nixpkgs.gnumake \
    nixpkgs.lazygit \
	nixpkgs.neovim \
	nixpkgs.nodejs_20 \
	nixpkgs.ripgrep \
	nixpkgs.stow \
	nixpkgs.tmux \
	nixpkgs.yarn \
	nixpkgs.zsh \
	nixpkgs.python311Packages.pip \
	nixpkgs.python311Packages.pynvim

# # stow dotfiles
# stow -Svt ~ git
#
# mkdir -p ~/.config/nvim
# stow -Svt ~ nvim
#
# mkdir -p ~/.local/bin
# mkdir -p ~/.config/tmux
# stow -Svt ~ tmux
#
# mkdir -p ~/.config/zsh
# stow -Svt ~ zsh
#
# # add zsh as a login shell
# command -v zsh | tee -a /etc/shells
#
# # use zsh as default shell
# chsh -s $(which zsh)

