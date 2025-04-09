FROM  python:2.7.18-stretch

WORKDIR /opt

RUN curl https://bootstrap.pypa.io/pip/2.7/get-pip.py --output get-pip.py; \
    python2 ./get-pip.py; \
    git clone https://github.com/mdsecactivebreach/SharpShooter.git;  \
    cd SharpShooter/;  \
    python2 -m pip install --upgrade setuptools pip==20.3.4;  \
    pip2 install -r requirements.txt; \
    chmod +x SharpShooter.py

WORKDIR /opt/SharpShooter

CMD ["/bin/bash"]
