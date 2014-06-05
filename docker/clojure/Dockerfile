FROM java7
RUN mkdir bin
ENV PATH $PATH:$HOME/bin
WORKDIR /bin
RUN wget https://raw.githubusercontent.com/technomancy/leiningen/stable/bin/lein
RUN chmod +x lein
WORKDIR /root
ENV LEIN_ROOT ""
ENV HTTP_CLIENT wget --no-check-certificate -O
RUN lein