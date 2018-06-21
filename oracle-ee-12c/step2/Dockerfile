FROM walokra/oracle12c:installed
MAINTAINER walokra

RUN mkdir /data && chmod 777 /data
COPY colorecho /bin/
COPY start.sh /bin/
RUN chmod +x /bin/start.sh /bin/colorecho

ENV ORACLE_HOME /u01/app/oracle/product/11.2.0/db_home1
ENV ORACLE_SID  orcl
ENV PATH /bin:$ORACLE_HOME/bin:$PATH

EXPOSE 1521
EXPOSE 8080

USER oracle

ENTRYPOINT ["start.sh"]
CMD ["database"]