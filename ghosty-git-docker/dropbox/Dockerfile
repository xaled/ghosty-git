FROM ubuntu
MAINTAINER xaled

RUN useradd --create-home -s /bin/bash user
WORKDIR /home/user
RUN echo "user:user" | chpasswd

	

RUN mkdir /var/run/sshd
RUN /usr/sbin/sshd

RUN su user -c 'cd ~ && wget -O - "https://www.dropbox.com/download?plat=lnx.x86_64" | tar xzf -'


EXPOSE 22


