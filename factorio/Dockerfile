FROM amazonlinux

MAINTAINER threes33 <github@reackt.com>

ENV FACTORIO_SITE www.factorio.com
ENV SAVEGAME /opt/factorio/saves

RUN yum install -y \
  shadow-utils \
  findutils \
  update \
  && yum clean all \
  && rm -rf /var/cache/yum/* \
  /tmp/* \
  /var/tmp/*

RUN groupadd -g 34197 factorio \
  && useradd \
  -u 34197 -g 34197 \
  -m -d /opt/factorio \
  -s /usr/sbin/nologin \
  -r -g factorio \
  factorio \
  && mkdir ${SAVEGAME} \
  && chown -R factorio:factorio /opt/factorio

ADD start.sh /opt/factorio/start.sh
WORKDIR /opt/factorio

RUN chmod 755 /opt/factorio/start.sh \
  && chown -R factorio:factorio ${SAVEGAME}

USER factorio

VOLUME ${SAVEGAME}

RUN curl https://${FACTORIO_SITE}/download-headless/stable 2>&1 \
  | grep -o -m1 get-download/.*/headless/linux64 \
  | awk -v factorio_site=${FACTORIO_SITE} '{print "-kLs https://"factorio_site"/"$1}' \
  | xargs curl \
  | tar xzC /opt

EXPOSE 34197/udp

CMD ["/opt/factorio/start.sh"]
