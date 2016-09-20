# INSTALL PYTHON IMAGE
FROM python:3.5.2

# INSTALL PYTHON IMAGE
FROM python:3.5.2

# INSTALL TOOLS
RUN apt-get update
RUN apt-get -y install unzip
RUN apt-get -y install libaio-dev

RUN mkdir -p /opt/data/api
RUN cd /opt/data

ADD ./oracle-instantclient/ /opt/data
ADD ./prepare-env.sh /opt/data

WORKDIR /opt/data

ENV ORACLE_HOME=/opt/oracle/instantclient
ENV LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$ORACLE_HOME

ENV OCI_HOME=/opt/oracle/instantclient
ENV OCI_LIB_DIR=/opt/oracle/instantclient
ENV OCI_INCLUDE_DIR=/opt/oracle/instantclient/sdk/include

RUN ["/bin/bash","./prepare-env.sh"]

EXPOSE 5000

CMD ["python","/opt/data/api/server.py"]