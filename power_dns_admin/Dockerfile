FROM python:2.7.14-slim-stretch

RUN apt-get update -y; \
    apt-get upgrade -y; \
    apt-get install -y sqlite3 git libffi-dev libldap2-dev libsasl2-dev build-essential

RUN cd /usr/local/lib; \
    git clone https://github.com/ngoduykhanh/PowerDNS-Admin.git; \
    cd /usr/local/lib/PowerDNS-Admin; \
    pip install virtualenv; \
    virtualenv flask; \
    source ./flask/bin/activate; \
    pip install -r requirements.txt;


ADD config.py /usr/local/lib/PowerDNS-Admin/config.py

ADD run.sh /usr/local/lib/PowerDNS-Admin/run.sh

RUN chmod +x /usr/local/lib/PowerDNS-Admin/run.sh;

CMD [ "/usr/local/lib/PowerDNS-Admin/run.sh" ]