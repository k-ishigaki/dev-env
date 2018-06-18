FROM ubuntu
MAINTAINER k-ishigaki <k-ishigaki@frontier.hokudai.ac.jp>

# proxy settings
#ENV http_proxy
#ENV https_proxy

RUN useradd k-ishigaki

RUN echo "RUN start" &&\
    apt-get update && apt-get install -y --no-install-recommends curl git &&\
    apt-get install -y software-properties-common &&\
    add-apt-repository -y ppa:neovim-ppa/stable &&\
    apt-get update && apt-get install -y neovim &&\
    apt-get install -y build-essential &&\
    cd ~ && mkdir workspace && cd workspace &&\
    git clone https://github.com/k-ishigaki/dotfiles &&\
    cd dotfiles && make && cd .. &&\
    apt-get install -y cabal-install &&\
    cabal update && cabal install idris &&\
    echo "RUN end"





