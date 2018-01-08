FROM debian:stretch-slim

RUN apt-get update -y; \
    apt-get upgrade -y; \
    apt-get install -y curl gnupg gnupg2 expect; \
    echo "deb http://repo.powerdns.com/raspbian jessie-auth-master main" > /etc/apt/sources.list.d/pdns.list; \
    curl -fsL https://repo.powerdns.com/CBC8B383-pub.asc | apt-key add -; \
    apt-get update -y; \
    apt-get install -y pdns-server; \
    expect -c 'set timeout 10; spawn apt-get install -y pdns-backend-sqlite3; expect "yes/no"; send "no\n"; expect "#"; exit 0'

RUN apt-get remove -y expect; \
    apt-get clean; \
    mkdir -vp /usr/local/pdns/sqlite /tmp/pdns

EXPOSE 53 53/udp 8081

ADD pdns.conf /etc/powerdns/pdns.conf
ADD create_table.sql /usr/local/pdns/create_table.sql
ADD run.sh /usr/local/pdns/run.sh

RUN chmod +x /usr/local/pdns/run.sh

CMD [ "/usr/local/pdns/run.sh" ]
