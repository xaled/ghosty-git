FROM ubuntu
MAINTAINER xaled

RUN apt-get update && \
    apt-get install -y wget && \
    apt-get clean

RUN useradd -u 1000 --create-home -s /bin/bash user
WORKDIR /home/user
#RUN echo "user:user" | chpasswd

	

RUN su user -c 'cd /home/user && wget -O - "https://www.dropbox.com/download?plat=lnx.x86_64" | tar xzf -' 
RUN su user -c "mkdir /home/user/Dropbox"
RUN su user -c "mkdir /home/user/.dropbox"

VOLUME /home/user/Dropbox
VOLUME /home/user/.dropbox

USER user

CMD /home/user/.dropbox-dist/dropboxd
