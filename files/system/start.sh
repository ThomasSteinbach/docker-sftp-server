#!/bin/bash

chown ftp:ftp /mount/.ssh
chown ftp:ftp /mount/data

if [[ ! -z "$USER_PASSWORD" ]]; then
  echo "ftp:${USER_PASSWORD}" | chpasswd
  sed -i "s/CONFIG_REPLACE_PASSWORD_AUTHENTICATION/yes/g" /etc/ssh/sshd_config
else
  sed -i "s/CONFIG_REPLACE_PASSWORD_AUTHENTICATION/no/g" /etc/ssh/sshd_config
fi

if [[ -f /mount/.ssh/authorized_keys ]]; then
  chmod 0600 /mount/.ssh/authorized_keys
  chown ftp:ftp /mount/.ssh/authorized_keys
fi

exec /usr/sbin/sshd -D
