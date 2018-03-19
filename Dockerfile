FROM python:2.7

RUN cd /tmp && curl http://snap.stanford.edu/snappy/release/snap-4.0.0-4.0-centos6.5-x64-py2.6.tar.gz -o snap.tar.gz && tar zxvf snap.tar.gz && cd snap-4.0.0-4.0-centos6.5-x64-py2.6 && python setup.py install && cd /

COPY ./pip.conf /tmp/pip.conf
RUN mkdir ~/.pip && cp /tmp/pip.conf ~/.pip/pip.conf
COPY ./requirements /tmp/requirements
RUN pip install numpy && pip install -r /tmp/requirements

RUN rm -rf /tmp/*

RUN mkdir /code
WORKDIR /code
