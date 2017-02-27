FROM mcandre/docker-debian-32bit
# maint details
MAINTAINER Alexey Shumkin <alex.crezoff@gmail.com>
# system installations
RUN apt-get update \
    && apt-get install -y wget less vim devscripts \
    && rm -rf /var/lib/apt/lists/*
# set Moscow timezone
RUN ln -sf /usr/share/zoneinfo/Europe/Moscow /etc/localtime
ADD entrypoint.sh /
ENTRYPOINT ["./entrypoint.sh"]
