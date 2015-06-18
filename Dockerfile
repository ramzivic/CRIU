FROM ubuntu:14.04

RUN apt-get update && apt-get install -y \
		build-essential	\
		protobuf-c-compiler \
		libprotobuf-c0-dev \
		libprotobuf-dev	\
		bsdmainutils \
		protobuf-compiler \
		python-minimal \
		libaio-dev \
		iptables \
        asciidoc \
        libtool

COPY . /criu
WORKDIR /criu

RUN make -j $(nproc) && make install

ENTRYPOINT ["criu"]
