FROM python:3.11-alpine

RUN apk update \
&& apk upgrade --available \
&& apk add git tzdata \
&& mkdir /app \
&& cd /app \
&& git clone https://github.com/rshipp/python-nut2.git \
&& cd python-nut2 \
&& python setup.py install \
&& cd .. \
&& git clone https://github.com/rshipp/webNUT.git \
&& cd webNUT \
&& pip install -e . \
&& rm -rf /var/cache/apk/*

COPY /docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod +x /docker-entrypoint.sh

WORKDIR /app/webNUT

ENTRYPOINT ["/docker-entrypoint.sh"]

EXPOSE 6543
