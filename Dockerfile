FROM debian:bullseye-slim
RUN apt update -y && apt dist-upgrade -y
RUN DEBIAN_FRONTEND=noninteractive apt install qemu-kvm *zenhei* xz-utils dbus-x11 curl firefox-esr gnome-system-monitor mate-system-monitor  git xfce4 xfce4-terminal tightvncserver wget   -y
RUN wget https://github.com/novnc/noVNC/archive/refs/tags/v1.4.0.tar.gz
RUN curl -LO https://proot.gitlab.io/proot/bin/proot
RUN chmod 755 proot
RUN mv proot /bin
RUN tar -xvf v1.4.0.tar.gz
RUN mkdir  $HOME/.vnc
RUN echo 'q111111' | vncpasswd -f > $HOME/.vnc/passwd
RUN chmod 600 $HOME/.vnc/passwd
RUN echo 'whoami ' >>/dog.sh
RUN echo 'cd ' >>/dog.sh
RUN echo "su -l -c  'vncserver :2000 -geometry 1280x800' "  >>/dog.sh
RUN echo 'cd /noVNC-1.4.0' >>/luo.sh
RUN echo './utils/launch.sh  --vnc localhost:7900 --listen 23123 ' >>/dog.sh
RUN chmod 755 /dog.sh
EXPOSE 23123
CMD  /dog.sh
