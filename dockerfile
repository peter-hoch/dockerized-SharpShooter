FROM  kalilinux/kali-rolling

WORKDIR /opt


RUN apt-get update ; apt-get install -y wget make gcc curl zlib1g-dev libssl-dev openssl git python2
    
# install python https://gist.github.com/iscle/66e946553e74a883b4494d3b6df0ee82

# RUN wget https://www.python.org/ftp/python/2.7.18/Python-2.7.18.tgz; \
#     tar xzf Python-2.7.18.tgz;  \
#     rm  Python-2.7.18.tgz; 
# WORKDIR /opt/Python-2.7.18
# RUN ./configure --enable-optimizations; \
#      make altinstall; 
# RUN ln -s "/usr/local/bin/python2.7" "/usr/bin/python"; 
# RUN ln -s "/usr/local/bin/python2.7" "/usr/bin/python2"

WORKDIR /opt

RUN curl https://bootstrap.pypa.io/pip/2.7/get-pip.py --output get-pip.py; \
    python2 ./get-pip.py; \
    git clone https://github.com/mdsecactivebreach/SharpShooter.git;  
WORKDIR /opt/SharpShooter
RUN python2 -m pip install --upgrade setuptools pip==20.3.4;  
RUN    pip2 install -r requirements.txt; 
RUN    chmod +x SharpShooter.py; 
RUN    echo "PATH=$PATH:/opt/SharpShooter/" >> /root/.bashrc

