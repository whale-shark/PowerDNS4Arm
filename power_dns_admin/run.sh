#!/bin/sh

SQLITE_DB_PATH=/usr/local/bin/PowerDNS-Admin/sqlite/pdns_admin_table.db

echo "Check sqliteDB : ${SQLITE_DB_PATH}"

cd /usr/local/bin/PowerDNS-Admin
virtualenv flask

if [ ! -e "${SQLITE_DB_PATH}" ]; then
  echo "Create db."
  ./create_db.py
  RTN_CDE=$?
  if [ ${RTN_CDE} -ne 0 ]; then
    exit 1
  fi
  echo "Success."
fi

./run.py