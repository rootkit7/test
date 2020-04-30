FROM registry.redhat.io/rhoar-nodejs/nodejs-10

USER root

# Copying in source code

COPY upload/src /tmp/src

# Change file ownership to the assemble user.

RUN chown -R 1001:0 /tmp/src

# Run assemble as non-root user

USER 1001

# Assemble script sourced from builder image based on user input or image metadata.

RUN /usr/libexec/s2i/assemble

# Run script sourced from builder image based on user input or image metadata.

CMD /usr/libexec/s2i/run
