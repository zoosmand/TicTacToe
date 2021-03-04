FROM ubuntu

ARG DEPLOYER_NAME=Deployer
ARG DEPLOYER_VER=0.0.1

EXPOSE 0

LABEL name=${DEPLOYER_NAME}
LABEL version=${DEPLOYER_VER}

COPY ./deploy*.sh /
RUN chmod 700 deploy*.sh
RUN tar czvf depl.tgz deploy_host*.sh 
RUN rm deploy_host*.sh

# RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys AA8E81B4331F7F50
    # gnupg2 \
    # gnupg1 \
    # apt-utils \
    # iproute2 \

RUN apt-get update && apt-get install -y \
    ssh-tools \
    curl \
    \
    && apt-get clean

CMD [ "bash", "deploy_stage.sh" ]
