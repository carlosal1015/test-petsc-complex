FROM ghcr.io/carlosal1015/aur/petsc-complex:latest

ARG PACKAGES="\
  docker \
  "

RUN sudo pacman --needed --noconfirm --noprogressbar -Syyuq && \
  sudo pacman --needed --noconfirm --noprogressbar -S ${PACKAGES} && \
  sudo systemctl enable docker && \
  sudo pacman -Scc <<< Y <<< Y && \
  sudo rm -r /var/lib/pacman/sync/*