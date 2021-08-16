FROM ardourtech/habitat:2021-08-16
LABEL maintainer="Alexander Scott <xander@axrs.io>"
ARG HABITAT_USER
ARG HABITAT_USER_PASSWORD

# Drop down to the default ubuntu `root` user and change the `habitat` user to be something more personal
USER root
COPY scripts/as_root/rename_habitat_user.sh ./
RUN bash rename_habitat_user.sh
RUN rm -f rename_habitat_user.sh

COPY scripts/as_root/install_docker.sh ./
RUN bash install_docker.sh && rm -f install_docker.sh

USER $HABITAT_USER
WORKDIR /home/$HABITAT_USER

# Import our own dotfiles, to merge with Habitat
ADD --chown=$HABITAT_USER:$HABITAT_USER dotfiles /home/$HABITAT_USER/dotfiles
RUN rsync -avz $HOME/dotfiles/ $HOME/ && rm -rf dotfiles

ARG IDEA_VERSION=2021.2

COPY scripts/setup.sh ./
RUN bash setup.sh && rm -f setup.sh

ENTRYPOINT ["fish"]