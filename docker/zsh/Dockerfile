FROM ubuntu
RUN apt-get update
RUN apt-get install -y wget tmux git emacs24-nox zsh openssh-server
ENV HOME /root
RUN chsh -s /usr/bin/zsh
RUN cd
RUN wget --no-check-certificate http://install.ohmyz.sh -O - | sh || echo "working"
WORKDIR /root
CMD /usr/bin/zsh
ONBUILD WORKDIR /root