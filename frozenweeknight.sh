#!/bin/bash

if [ ! -d /root/.ssh ]
then
    mkdir /root/.ssh
fi &&
    if [ ! -f /root/.ssh/id_rsa ]
    then
	cp /var/private/id_rsa /root/.ssh &&
	    chmod 0600 /root/.ssh/id_rsa &&
	    true
    fi &&
    if [ ! -f /root/.ssh/config ]
    then
	(cat > /root/.ssh/config <<EOF
Host ${GIT_HOST}
User ${GIT_USER}
IdentityFile /root/.ssh/id_rsa
StrictHostKeyChecking no
EOF
	) &&
	    chmod 0600 /root/.ssh/config
    fi &&
    if [ ! -d /var/workspace/.git ]
    then
	git -C /var/workspace init &&
	    true
    fi &&
    if [ -z "$(git -C /var/workspace remote)" ]
    then
	git -C /var/workspace remote add ${GIT_URL}
    fi &&
    if [ -z "$(git -C /var/workspace branch)" ]
    then	
	git -C /var/workspace fetch origin master &&
	    git -C /var/workspace checkout master &&
	    true
    fi &&
    if [ ! -f /var/workspace/.git/hooks/pre-commit ]
    then
	cp /usr/local/sbin/pre-commit.sh /var/workspace/.git/hooks/pre-commit &&
	    chmod 0500 /var/workspace/.git/hooks/pre-commit &&
	    true
    fi &&
    true
