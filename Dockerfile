FROM alpine
MAINTAINER k-ishigaki <k-ishigaki@frontier.hokudai.ac.jp>

ENV PATH=/root/.pyenv/bin:$PATH

RUN apk update && \
    apk upgrade && \
	apk add --no-cache \
	curl \
	gcc \
	git \
	linux-headers \
	musl-dev \
	neovim \
	python-dev \
	py-pip \
	python3-dev \
	py3-pip \
	make \
	gcc-avr \
	binutils-avr \
	avr-libc && \
	rm -rf /var/cache/apk/*

ENV LANG="ja_JP.UTF-8" LANGUAGE="ja_JP:ja" LC_ALL="ja_JP.UTF-8"

RUN pip3 install --upgrade pip neovim

RUN git clone https://github.com/k-ishigaki/dotfiles && \
    cd dotfiles && make && cd - && \
    # install plugins and exit
	nvim -c qa

WORKDIR /home/workspace

ENTRYPOINT ["nvim"]
