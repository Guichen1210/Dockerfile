FROM debian
RUN apt update
RUN apt-get install openssh-server -y
RUN apt install vim -y
RUN DEBIAN_FRONTEND=noninteractive apt install firefox-esr mate-system-monitor  git lxde tightvncserver wget   -y
RUN wget https://github.com/novnc/noVNC/archive/refs/tags/v1.3.0.tar.gz
RUN tar -xvf v1.3.0.tar.gz
RUN mkdir  /root/.vnc
RUN echo 'asdf2121..' | vncpasswd -f > /root/.vnc/passwd
RUN chmod 600 /root/.vnc/passwd
RUN cp /noVNC-1.3.0/vnc.html /noVNC-1.3.0/index.html
RUN echo 'cd /root' >>/feng.sh
RUN echo "su root -l -c 'vncserver :2000 ' "  >>/feng.sh
RUN echo 'cd /noVNC-1.3.0' >>/feng.sh
RUN echo './utils/launch.sh  --vnc localhost:7900 --listen 80 ' >>/feng.sh
RUN echo root:asdf2121..|chpasswd
RUN chmod 755 /feng.sh
EXPOSE 80
CMD  /feng.sh
