FROM taf7lwappqystqp4u7wjsqkdc7dquw/easternmoose
ENV GIT_HOST="github.com" GIT_USER="git" GIT_URL="github.com:desertedscorpion:frozenweekend.git" PARENT_BRANCH=master DESCRIPTION="blah"
VOLUME /var/private
VOLUME /var/workspace
COPY frozenweeknight.sh /usr/local/sbin/frozenweeknight.sh
COPY pre-commit.sh /usr/local/sbin/pre-commit.sh
COPY push.sh /usr/local/sbin/push.sh
RUN dnf update --assumeyes && dnf install --assumeyes git && dnf update --assumeyes && dnf clean all && chmod 0500 /usr/local/sbin/frozenweeknight.sh
CMD /usr/local/sbin/frozenweeknight.sh