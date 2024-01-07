FROM ghcr.io/carlosal1015/aur/petsc-complex:latest

ARG PACKAGES="\
  docker \
  git \
  "

RUN sudo pacman --needed --noconfirm --noprogressbar -Syuq && \
  sudo pacman --needed --noconfirm --noprogressbar -S ${PACKAGES} && \
  sudo systemctl enable docker && \
  sudo pacman -Scc <<< Y <<< Y && \
  sudo rm -r /var/lib/pacman/sync/*