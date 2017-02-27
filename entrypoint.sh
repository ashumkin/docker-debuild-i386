#!/bin/sh

if ! test -d /build
then
	echo "Please, mount your output directory as /build" 1>&2
	exit 1
fi

if ! test -d /build/source
then
	echo "Please, mount your source directory as /build/source" 1>&2
	exit 2
fi

if ! test -d /gnupg
then
	echo "WARNING! Please, mount your \$HOME/.gnupg directory as /gnupg" 1>&2
else
	cp -r /gnupg /root/.gnupg
	/bin/chmod -R 0400 /root/.gnupg
fi

cd /build/source
/usr/bin/debuild $@
# correct owner:group for output files
/bin/chown --recursive --reference /build/source/Makefile /build
/bin/chown --recursive --reference /build/source/Makefile /build/source
