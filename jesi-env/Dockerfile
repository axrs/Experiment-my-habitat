FROM ardourtech/habitat:2021-08-16
LABEL maintainer="Alexander Scott <xander@axrs.io>"
ARG HABITAT_USER
ARG HABITAT_USER_PASSWORD
LABEL HABITAT_NETWORKS=jesi-dev
LABEL HABITAT_WITH_X11=true
LABEL HABITAT_WITH_DOCKER=true

# Drop down to the default ubuntu `root` user and change the `habitat` user to be something more personal
USER root
COPY scripts/as_root/rename_habitat_user.sh ./
RUN bash rename_habitat_user.sh && rm -f rename_habitat_user.sh

COPY scripts/as_root/install_docker.sh ./
RUN bash install_docker.sh && rm -f install_docker.sh

# Create Logical Volumes for use with other docker containers and environments
LABEL HABITAT_VOLUME_ROOT="/volumes/"
LABEL HABITAT_VOLUMES=projects,maven-cache,jesi
RUN mkdir -p /volumes/projects /volumes/maven-cache /volumes/jesi
RUN chown -R ${HABITAT_USER}:${HABITAT_USER} /volumes \
    && chmod -R 775 /volumes \
    && chmod -R g+s /volumes

USER $HABITAT_USER
WORKDIR /home/$HABITAT_USER

# Import our own dotfiles, to merge with Habitat
ADD --chown=$HABITAT_USER:$HABITAT_USER dotfiles /home/$HABITAT_USER/dotfiles
RUN rsync -avz $HOME/dotfiles/ $HOME/ && rm -rf dotfiles

# Install Software and Utilities
ARG IDEA_VERSION=2021.2
COPY scripts/setup.sh scripts/install_github_releases.sh ./
RUN bash setup.sh && rm -f setup.sh
RUN bash install_github_releases.sh && rm -f install_github_releases.sh

COPY jesi-env/jesi_setup.sh ./
RUN bash jesi_setup.sh && rm -f jesi_setup.sh

ENTRYPOINT ["fish"]