# PowerDNS for Armhf

Minimal PowerDNS and PowerDNS-Admin for ARM.

Backend databease for sqlite3.

Application image

```
Client computer
  \/
PowerDNS Recursor -> local domain Å® PowerDNS Authoritative Server 
  \/
other than local domain
  \/
Internet
```

## TODO

* Corresponding to uWSGI

## How to

### build

```
docker-compose build
```

### run

```
docker-compose up
```

## sqlite db file directory

### PowerDNS

```
power_dns/sqlite/pdns_table.db
```

### PowerDNS-Admin

```
power_dns_admin/sqlite/pdns_admin_table.db
```