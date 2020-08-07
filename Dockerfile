FROM rhel7
WORKDIR seeker/
RUN echo "America/Sao_Paulo" > /etc/timezone
RUN yum update > install.log
RUN yum -y install tzdata >> install.log
RUN yum -y install python3 python3-pip php openssh-server openssh-clients 
RUN pip3 install requests >> install.log
ADD . /seeker
RUN chmod 777 template/nearyou/php/info.txt
RUN chmod 777 template/nearyou/php/result.txt
CMD ["./seeker.py"]
