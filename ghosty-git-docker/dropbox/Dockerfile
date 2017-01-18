FROM ubuntu
MAINTAINER xaled

RUN apt-get update && \
    apt-get install -y software-properties-common && \
    apt-get install -y openssh-server && \
    apt-get clean




RUN useradd --create-home -s /bin/bash user
WORKDIR /home/user
RUN echo "user:user" | chpasswd

	

RUN mkdir /var/run/sshd
RUN /usr/sbin/sshd

RUN su user -c 'cd ~ && wget -O - "https://www.dropbox.com/download?plat=lnx.x86_64" | tar xzf -'
RUN echo "===========================================================" && \
    echo "Authorise to access to your dropbox account" && \
    echo "===========================================================" && \
    su user -c '~/.dropbox-dist/dropboxd'


EXPOSE 22


