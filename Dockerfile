FROM ubuntu:vivid

RUN apt-get update && \
    apt-get install -y wget git openjdk-8-jre

RUN useradd -m -s /bin/bash soft-len-xub \
    && mkdir /home/soft-len-xub/.PhpStorm2016.2 \
    && touch /home/soft-len-xub/.PhpStorm2016.2/.keep \
    && chown -R soft-len-xub.soft-len-xub /home/soft-len-xub \
    && mkdir /opt/phpstorm \
    && wget -O - https://download.jetbrains.com/webide/PhpStorm-2016.2.tar.gz | tar xzf - --strip-components=1 -C "/opt/phpstorm"

USER soft-len-xub
VOLUME /home/soft-len-xub/.PhpStorm2016.2
CMD /opt/phpstorm/bin/phpstorm.sh
