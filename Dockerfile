FROM ubuntu

# User specific configuration
ARG uid=1000
ARG gid=1000
ARG user=docker
ARG group=docker
RUN groupadd -f -g ${gid} ${group}
RUN useradd -m -u ${uid} -g ${gid} ${user}

ENV HOME /home/${user}
ENV DOT ${HOME}/.dotfiles
ENV USER ${user}

ADD . ${DOT}

WORKDIR ${DOT}
RUN ./scripts/setup.sh

USER ${user}

ENTRYPOINT ["zsh"]
