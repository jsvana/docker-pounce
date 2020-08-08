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
	./configure && make && make install && \
	cd / && \
	rm -rf pounce-1.3.tar.gz && \
	rm -rf pounce-1.3 && \
	rm -rf libressl-3.1.3.tar.gz && \
	rm -rf libressl-3.1.3 && \
	apk --no-cache del wget build-base linux-headers ctags

VOLUME /etc/letsencrypt
VOLUME /config

EXPOSE 6697

CMD ["pounce", "/config"]
