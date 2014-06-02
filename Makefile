default: pushlogind

pushlogind:
	$(CC) -O3 -fomit-frame-pointer -funroll-loops -o pushlogind src/pushlogind.c -lcurl

install: pushlogind
	mv pushlogind /usr/bin/pushlogind
	$(if wildcard "/etc/init.d", cp pushlogind.sh /etc/init.d/pushlogind; echo "Run 'rc-update add pushlogind' to start pushlogind on startup!")
