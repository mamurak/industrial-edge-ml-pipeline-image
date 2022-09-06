FROM registry.access.redhat.com/ubi8/ubi

USER root

RUN dnf -y update \
 && dnf -y install python3-pip \
 && dnf -y clean all && \
 rm -rf /var/cache/dnf

COPY requirements.txt ./requirements.txt
RUN pip3 install --no-cache-dir --user -r ./requirements.txt

USER 8888
