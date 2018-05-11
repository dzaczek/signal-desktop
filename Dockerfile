 FROM  ubuntu
 
 RUN apt-get update && apt-get upgrade -y && apt-get install -y curl gnupg gnupg2 gnupg1 sudo
 RUN curl -s https://updates.signal.org/desktop/apt/keys.asc | apt-key add -
 RUN echo "deb [arch=amd64] https://updates.signal.org/desktop/apt xenial main" | tee -a /etc/apt/sources.list.d/signal-xenial.list
 RUN DEBIAN_FRONTEND=noninteractive apt-get install -y pulseaudio
 RUN apt-get update && apt-get install -y  signal-desktop
 #RUN apt-get update && apt-get install -y firefox
 
 # Replace 1000 with your user / group id
 RUN export uid=1000 gid=1000 && \
     mkdir -p /home/developer && \
         echo "developer:x:${uid}:${gid}:Developer,,,:/home/developer:/bin/bash" >> /etc/passwd && \
         echo "developer:x:${uid}:" >> /etc/group && \
         echo "developer ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/developer && \
         chmod 0440 /etc/sudoers.d/developer && \
         chown ${uid}:${gid} -R /home/developer
 
 
 USER developer
 ENV HOME /home/developer
 CMD /usr/local/bin/signal-desktop
 
