FROM registry.access.redhat.com/ubi8/ubi

USER root

RUN dnf -y update \
 && dnf -y install python3-pip \
 && dnf -y clean all && \
 rm -rf /var/cache/dnf

USER 8888

COPY requirements.txt ./requirements.txt
RUN pip3 install -r ./requirements.txt
