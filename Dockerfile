# Based on alpine
FROM alpine

# Install open-ssh server
RUN apk add --no-cache openssh-server

# Lets enable root login
RUN echo "" >> /etc/ssh/sshd_config && echo "PermitRootLogin yes" >> /etc/ssh/sshd_config

# Environment variable, used to setup root password (instead of having a fixed one)
ENV SSH_USER root
ENV SSH_PASS password_pls_change

# Expose port 22 (for SSH)
EXPOSE 22

# Copy over entrypoint file
COPY entry.sh /start.sh

# Logging of entrypoint file into autobuilds
RUN chmod +x /start.sh && cat /entry.sh

# Lets setup entry, and command arguments
ENTRYPOINT [ "/start.sh" ]
CMD ["/usr/sbin/sshd", "-D", "-e", "-f", "/etc/ssh/sshd_config"]
