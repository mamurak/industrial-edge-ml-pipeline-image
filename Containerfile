FROM registry.access.redhat.com/ubi8/python-38

USER root

RUN dnf -y update \
 && dnf -y install python3-pip git \
 && dnf -y clean all \
 && rm -rf /var/cache/dnf

USER 1001

COPY requirements.txt ./
RUN pip3 install --no-cache-dir -r requirements.txt
