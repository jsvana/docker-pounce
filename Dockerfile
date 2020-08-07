FROM alpine:3.7

RUN apk update && \
	apk --no-cache add wget build-base linux-headers ctags && \
	wget https://ftp.openbsd.org/pub/OpenBSD/LibreSSL/libressl-3.1.3.tar.gz && \
	tar xvf libressl-3.1.3.tar.gz && \
	cd /libressl-3.1.3 && \
	./configure && make && make install && \
	cd / && \
	wget https://git.causal.agency/pounce/snapshot/pounce-1.3.tar.gz && \
	tar xvf pounce-1.3.tar.gz && \
	cd /pounce-1.3 && \
	./configure && make && make install

VOLUME /etc/letsencrypt
VOLUME /config

# TODO(jsvana): figure out how SSL connections work since
# we're forcing a bind to 0.0.0.0
EXPOSE 6697

ENTRYPOINT ["pounce", "/config", "-H", "0.0.0.0"]
