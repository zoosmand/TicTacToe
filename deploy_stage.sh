#!/bin/bash

DEPLOY_USERNAME="zoosman"
DEPLOY_STAGE="mira.asart.ru"
DEPLOY_SSH_PORT_STAGE=22051
DEPLOY_SSH_KEY_STAGE="deploy_stage.key"
STAGE_SH="deploy_host_stage.sh"
TEST_SH="deploy_host_test.sh"

/usr/bin/scp -i ~/.ssh/${DEPLOY_SSH_KEY_STAGE} -P ${DEPLOY_SSH_PORT_STAGE} depl.tgz ${DEPLOY_USERNAME}@${DEPLOY_STAGE}:depl.tgz
/usr/bin/ssh -i ~/.ssh/${DEPLOY_SSH_KEY_STAGE} -p ${DEPLOY_SSH_PORT_STAGE} ${DEPLOY_USERNAME}@${DEPLOY_STAGE} \
    "tar xzvf depl.tgz -C .; bash ./${STAGE_SH}; bash ./${TEST_SH}; rm ./depl.tgz ./${STAGE_SH} ./${TEST_SH}"

exit 0
