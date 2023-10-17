FROM ubuntu:latest
RUN apt-get update && apt-get install -y\
    sudo\
    wget\
    vim
WORKDIR /opt
RUN wget https://repo.anaconda.com/archive/Anaconda3-2022.05-Linux-x86_64.sh && \
    bash Anaconda3-2022.05-Linux-x86_64.sh -b -p /opt/anaconda3 && \
    rm -f Anaconda3-2022.05-Linux-x86_64.sh
ENV PATH /opt/anaconda3/bin:$PATH
RUN pip install --upgrade pip
WORKDIR /
COPY requirements.txt /root/
RUN pip install -r ./root/requirements.txt 
CMD ["jupyter","lab","--ip=0.0.0.0","--allow-root","--LabApp.token=''"]