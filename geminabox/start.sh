unset BUNDLE_PATH
unset BUNDLE_BIN

/usr/sbin/sshd -D &
unicorn /app/config.ru