FROM alpine:3.5
MAINTAINER Benjamin Borbe <bborbe@rocketnews.de>

RUN apk add --update \
	ca-certificates \
	squid \
	ca-certificates \
	bash \
	&& rm -rf /var/cache/apk/*

COPY files/htpasswd /etc/squid/auth/htpasswd
COPY files/squid.conf /etc/squid/squid.conf
COPY files/entrypoint.sh /usr/local/bin/entrypoint.sh

EXPOSE 3128

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
CMD ["squid","-f","/etc/squid/squid.conf","-NYCd","1"]
