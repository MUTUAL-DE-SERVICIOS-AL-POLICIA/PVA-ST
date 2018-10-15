FROM zammad/zammad:latest

ENV DEBIAN_FRONTEND noninteractive
ENV TZ America/La_Paz
ENV LANG es_BO.UTF-8

RUN echo "en_US.UTF-8 UTF-8" | tee -a /etc/locale.gen &&\
    echo "es_BO.UTF-8 UTF-8" | tee -a /etc/locale.gen &&\
    locale-gen --no-purge es_BO.UTF-8 &&\
    update-locale LANG=es_BO.UTF-8 &&\
    dpkg-reconfigure locales &&\
    ln -fs /usr/share/zoneinfo/America/La_Paz /etc/localtime &&\
    dpkg-reconfigure -f noninteractive tzdata

VOLUME ["/var/lib/postgresql/9.6/main"]
EXPOSE 80 5432

CMD ["zammad"]