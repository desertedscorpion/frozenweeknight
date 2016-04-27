FROM taf7lwappqystqp4u7wjsqkdc7dquw/easternmoose
ENV GIT_HOST="github.com" GIT_USER="git" GIT_URL="github.com:desertedscorpion:frozenweekend.git"
VOLUME /var/private
VOLUME /var/workspace
COPY frozenweeknight.sh /usr/local/sbin/frozenweeknight.sh
RUN dnf update --assumeyes && dnf install --assumeyes git && dnf update --assumeyes && dnf clean all && systemctl enable frozenweeknight.timer
CMD 