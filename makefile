install: sencillito.sh
	cp sencillito.sh /usr/bin/sencillito
	chmod +x /usr/bin/sencillito

uninstall: /usr/bin/sencillito
	rm /usr/bin/sencillito
