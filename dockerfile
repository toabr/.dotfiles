FROM ubuntu:latest
ENV LANG C.UTF-8

RUN apt update && apt install -y git curl xz-utils sudo

RUN \
  useradd -m host && echo "host:toor" | chpasswd && usermod -aG sudo host && \
  mkdir -m 0755 /nix && chown host /nix

CMD ["/bin/bash", "-l"]
USER host
ENV USER host
WORKDIR /home/host

RUN \
  touch .bash_profile && \
  curl -L https://nixos.org/nix/install | sh

RUN \
  git clone https://github.com/toabr/.dotfiles.git && \
  . $HOME/.nix-profile/etc/profile.d/nix.sh && \
  .dotfiles/install.sh
