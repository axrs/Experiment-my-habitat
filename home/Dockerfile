FROM ardourtech/habitat:2021-09-19
LABEL maintainer="Alexander Scott <xander@axrs.io>"
ARG HABITAT_USER
ARG HABITAT_USER_PASSWORD
LABEL HABITAT_NETWORKS=habitat,dev
LABEL HABITAT_WITH_X11=true
LABEL HABITAT_WITH_DOCKER=true

# Drop down to the default ubuntu `root` user and change the `habitat` user to be something more personal
USER root
COPY scripts/as_root/rename_habitat_user.sh ./
RUN bash rename_habitat_user.sh && rm -f /home/${HABITAT_USER}/rename_habitat_user.sh

COPY scripts/as_root/install_utilities.sh ./
RUN bash install_utilities.sh && rm -f install_utilities.sh

COPY scripts/as_root/install_docker.sh ./
RUN bash install_docker.sh && rm -f install_docker.sh

# Create Logical Volumes for use with other docker containers and environments
LABEL HABITAT_VOLUME_ROOT="/volumes/"
LABEL HABITAT_VOLUMES=projects,maven-cache,intellij-config
RUN mkdir -p /volumes/projects /volumes/maven-cache /volumes/intellij-config
RUN chown -R ${HABITAT_USER}:${HABITAT_USER} /volumes \
    && chmod -R 775 /volumes \
    && chmod -R g+s /volumes

USER $HABITAT_USER
WORKDIR /home/$HABITAT_USER

# Import our own dotfiles, to merge with Habitat
ADD --chown=$HABITAT_USER:$HABITAT_USER dotfiles /home/$HABITAT_USER/dotfiles
RUN rsync -avz $HOME/dotfiles/ $HOME/ && rm -rf dotfiles

# Install Software and Utilities
COPY scripts/*.sh ./
RUN bash setup.sh
RUN bash install_github_releases.sh
RUN bash install_intellij.sh
RUN rm -f *.sh

ENTRYPOINT ["fish"]