FROM phusion/baseimage
#This needs to be cleaned up but works for now. Think need to use 'FROM python:2.7' with no virtualenv and install in base python. #python:2.7-onbuild
MAINTAINER Mark Stacy <markstacy@ou.edu>

RUN apt-get update
RUN apt-get  --force-yes -y install gcc python python-pip python-dev libssl-dev sqlite3 libsqlite-dev libxslt-dev libxml2-dev libz-dev libffi-dev bc wget

#RUN wget -O /install.sh https://raw.githubusercontent.com/Prodiguer/synda/master/sdc/install.sh
#Customize install.sh to remove spinner and redirect to screen instead of log_file. Plus changed g__prefix=/
ADD src/install.sh /install.sh
RUN chmod +x /install.sh

ENV ST_HOME /sdt
ENV PATH $ST_HOME/bin:$PATH

RUN /install.sh

