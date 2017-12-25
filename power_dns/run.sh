#!/bin/sh

SQLITE_DB_PATH=/usr/local/pdns/sqlite/pdns_table.db

echo "Check sqliteDB : ${SQLITE_DB_PATH}"

if [ ! -e "${SQLITE_DB_PATH}" ]; then
  echo "Create db."
  sqlite3 ${SQLITE_DB_PATH} < /usr/local/pdns/create_table.sql
  RTN_CDE=$?
  if [ ${RTN_CDE} -ne 0 ]; then
    exit 1
  fi
  echo "Success."
fi

echo "Start PowerDNS."

/usr/sbin/pdns_server --daemon=no --guardian=no --loglevel=9
