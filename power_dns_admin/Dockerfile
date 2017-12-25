FROM debian:stretch-slim

RUN apt-get update -y; \
    apt-get upgrade -y; \
    apt-get install -y python python-pip virtualenv sqlite3 git libffi-dev libldap2-dev libsasl2-dev

RUN cd /usr/local/bin; \
    git clone https://github.com/ngoduykhanh/PowerDNS-Admin.git;

RUN cd /usr/local/bin/PowerDNS-Admin; \
    pip install virtualenv; \
    virtualenv flask; \
    source ./flask/bin/activate; \
    pip install -r requirements.txt

ADD config.py /usr/local/bin/PowerDNS-Admin/config.py

ADD run.sh /usr/local/bin/PowerDNS-Admin/run.sh

RUN chmod +x /usr/local/bin/PowerDNS-Admin/run.sh

CMD [ "/usr/local/bin/PowerDNS-Admin/run.sh" ]