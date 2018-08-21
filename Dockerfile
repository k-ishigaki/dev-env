FROM ubuntu
MAINTAINER k-ishigaki <k-ishigaki@frontier.hokudai.ac.jp>

ENV DOCKER_CLIENT_VERSION=1.12.3

RUN apt-get update && apt-get install -y \
    curl \
    git \
    neovim \
    python3-dev \
    python3-pip \
	make \
	clang \
	&& apt-get clean \
	&& rm -rf /var/lib/apt/lists/*

# install docker client
RUN curl -fsSL https://get.docker.com/builds/Linux/x86_64/docker-${DOCKER_CLIENT_VERSION}.tgz > docker.tgz \
RUN aaa
    && tar xfz docker.tgz docker/docker \
    && mv docker/docker /usr/local/bin/docker \
    && rm -rf docker \
    && chmod +x /usr/local/bin/docker

RUN pip3 install --upgrade pip neovim
efwfeoij

RUN apt-get update && apt-get install -y \
fwaofewjfowa;f
    cmake \
    && git clone https://github.com/k-ishigaki/dotfiles \
    && cd dotfiles && make && cd - \
    # install language server for c++
	&& git clone https://github.com/cquery-project/cquery.git --recursive \
	&& cd cquery \
	&& git submodule update --init \
	&& mkdir build && cd build \
	&& cmake .. -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=release -DCMAKE_EXPORT_COMPILE_COMMANDS=YES \
	&& cmake --build . \
	&& cmake --build . --target install \
	&& export PATH=$PATH:/cquery/build/release/bin/
    # install plugins and exit
	&& nvim +PlugInstall +UpdateRemotePlugins +qa

WORKDIR /root/workspace

ENTRYPOINT ["bash"]
