FROM debian:stretch-slim

RUN apt-get update -y; \
    apt-get upgrade -y; \
    apt-get install -y curl; \
    echo "deb http://repo.powerdns.com/raspbian jessie-rec-master main" > /etc/apt/sources.list.d/pdns_rec.list; \
    curl -fsL https://repo.powerdns.com/CBC8B383-pub.asc | apt-key add -; \
    apt-get update -y; \
    apt-get install -y pdns-recursor

ADD recursor.conf /etc/powerdns/recursor.conf
ADD run.sh /usr/local/pdns/run.sh

RUN chmod +x /usr/local/pdns/run.sh

CMD [ "/usr/local/pdns/run.sh" ]

