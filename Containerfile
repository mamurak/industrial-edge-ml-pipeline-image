FROM registry.access.redhat.com/ubi8/python-38

USER root

RUN dnf -y update \
 && dnf -y install python3-pip \
 && dnf -y clean all \
 && rm -rf /var/cache/dnf \
 && cd /tmp \
 && curl -f -o git.tar.gz -L https://mirrors.edge.kernel.org/pub/software/scm/git/git-2.27.0.tar.gz \
 && tar xzf git.tar.gz --no-same-owner \
 && cd git-2.27.0 \
 && ./configure --prefix=/usr \
            --with-gitconfig=/etc/gitconfig \
            --with-python=python3 \
 && make \
 && chmod a+rx git \
 && mv git /usr/bin \
 && cd /opt \
 && rm -rf /tmp/* \
 && pip install --upgrade pip --no-cache-dir \
 && pip install pipenv --no-cache-dir

USER 1001

COPY Pipfile Pipfile.lock ./

RUN pipenv install --system --deploy
