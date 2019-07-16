#!/bin/sh

# Setting up ssh-keygen
ssh-keygen -A

# Setup the user and pass
echo "$SSH_USER:$SSH_PASS" | chpasswd

# And run sshd, while passing arguments over
exec "$@"
