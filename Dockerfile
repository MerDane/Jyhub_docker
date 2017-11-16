FROM ubuntu:16.04
MAINTAINER M. Merdan <maierdan.maimaitimin@tadano.com>

ENV LANG=C.UTF-8 LC_ALL=C.UTF-8

# install Dependences
RUN apt-get update --fix-missing && apt-get install -y wget bzip2 ca-certificates \
    libglib2.0-0 libxext6 libsm6 libxrender1 \
    git mercurial subversion curl grep

# install Anaconda
RUN echo 'export PATH=/opt/conda/bin:$PATH' > /etc/profile.d/conda.sh && \
    wget --quiet https://repo.continuum.io/archive/Anaconda3-5.0.1-Linux-x86_64.sh -O ~/anaconda.sh && \
    /bin/bash ~/anaconda.sh -b -p /opt/conda && \
    /opt/conda/bin/conda install --yes python=3.6 pip seaborn && \
    /opt/conda/bin/conda install --yes -c anaconda keras-gpu && \
    /opt/conda/bin/conda install --yes -c conda-forge \
     sqlalchemy tornado jinja2 traitlets requests pip pycurl \
      nodejs configurable-http-proxy && \
    /opt/conda/bin/pip install --upgrade pip && \
    rm ~/anaconda.sh

# install Tini
RUN apt-get install -y curl grep sed dpkg && \
    TINI_VERSION=`curl https://github.com/krallin/tini/releases/latest | grep -o "/v.*\"" | sed 's:^..\(.*\).$:\1:'` && \
    curl -L "https://github.com/krallin/tini/releases/download/v${TINI_VERSION}/tini_${TINI_VERSION}.deb" > tini.deb && \
    dpkg -i tini.deb && \
    rm tini.deb && \
    apt-get clean

ENV PATH /opt/conda/bin:$PATH

#jupyter hub setting
ADD . /src/jupyterhub
WORKDIR /src/jupyterhub
#COPY package.json requirements.txt bower-lite setup.py /src/jupyterhub/

RUN npm install --unsafe-perm && \
    pip install . && \
    rm -rf $PWD ~/.cache ~/.npm

# RUN npm install -g configurable-http-proxy && \
#     pip install pydot-ng && \
#     pip install jupyterhub && \
#     mkdir -p /srv/jupyterhub/

WORKDIR /srv/jupyterhub/
EXPOSE 8000

LABEL multi.label1="TADANO Ltd." \
      multi.label2="TRU" \
      other="GPU"

CMD ["jupyterhub"]
