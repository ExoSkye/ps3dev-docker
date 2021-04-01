FROM debian:stable-slim
RUN apt update && apt install autoconf automake bison flex gcc libelf-dev make git texinfo libncurses5-dev patch python subversion wget zlib1g-dev libtool libtool-bin python-dev bzip2 libgmp3-dev pkg-config g++ libssl-dev clang -y
RUN mkdir /opt/ps3toolchain && git clone https://github.com/ps3dev/ps3toolchain.git /opt/ps3toolchain && cd /opt/ps3toolchain && export PS3DEV=/usr/local/ps3dev && export PSL1GHT=$PS3DEV && export PATH=$PATH:$PS3DEV/bin && export PATH=$PATH:$PS3DEV/ppu/bin && export PATH=$PATH:$PS3DEV/spu/bin && ./toolchain.sh
RUN mkdir /opt/PSL1GHT && git clone https://github.com/ps3dev/PSL1GHT.git /opt/PSL1GHT && cd /opt/PSL1GHT && mkdir build && export PSL1GHT=/opt/PSL1GHT/build && make install-ctrl && make && make install
