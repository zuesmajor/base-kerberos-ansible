FROM centos:centos7

RUN sed -i 's/enabled=1/enabled=0/' /etc/yum/pluginconf.d/fastestmirror.conf
RUN mkdir -p /ansible/requirements/
COPY python-requirements.txt /ansible/requirements/python-requirements.txt
RUN yum update -y \
    && yum install epel-release -y \
    && yum install python-pip -y

WORKDIR /ansible/requirements/
RUN pip install -r python-requirements.txt
