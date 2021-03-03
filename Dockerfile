FROM node:latest

EXPOSE 3030

ENV APP=test-react-app
ENV APP_DIR=/opt/$APP

ENV CI=true

RUN echo "Asia/Yekaterinburg" > timezone
RUN cp /usr/share/zoneinfo/Asia/Yekaterinburg /etc/localtime

WORKDIR /opt
RUN git clone https://gitlab.com/zoosmand/${APP}.git
WORKDIR  $APP_DIR
RUN yarn install
RUN yarn test

ENV PATH=${APP_DIR}/:${PATH}
ENTRYPOINT [ "yarn", "start"]
