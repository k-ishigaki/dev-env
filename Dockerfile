FROM ubuntu
MAINTAINER k-ishigaki <k-ishigaki@frontier.hokudai.ac.jp>

ENV PATH=/root/.pyenv/bin:$PATH

RUN useradd k-ishigaki

RUN echo "RUN start" &&\
    apt-get update && apt-get install -y --no-install-recommends curl git &&\
    apt-get install -y software-properties-common &&\
    add-apt-repository -y ppa:neovim-ppa/stable &&\
    apt-get update && apt-get install -y neovim &&\
    apt-get install -y build-essential &&\
    cd ~ && mkdir workspace && cd - &&\
    git clone https://github.com/k-ishigaki/dotfiles &&\
    cd dotfiles && make && cd - &&\
    apt-get install -y libssl-dev zlib1g-dev &&\
    curl -L https://github.com/pyenv/pyenv-installer/raw/master/bin/pyenv-installer | bash &&\
    pyenv update && pyenv install 3.6.5 && pyenv global 3.6.5 &&\
    apt-get install -y python3-pip &&\
    pip3 install neovim && pip3 install --upgrade neovim &&\
    echo "RUN end"
