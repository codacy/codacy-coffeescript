FROM alpine:3.18.3 as builder

WORKDIR /app

RUN apk --update add openssh-client git nodejs npm
RUN rm -rf /var/cache/apk/*
RUN npm install -g grunt-cli

ADD . .
RUN npm install && grunt

FROM alpine:3.18.3

WORKDIR /usr/src/app

RUN adduser -u 2004 -D docker

ADD --chown=docker:docker docs /docs
COPY --chown=docker:docker package.json /usr/src/app
COPY --chown=docker:docker package-lock.json /usr/src/app
COPY --from=builder --chown=docker:docker /app/target /usr/src/app/target

RUN apk add --no-cache bash nodejs npm
RUN npm install --only=production

USER docker

ENTRYPOINT ["node"]
CMD ["target/codacy-coffeescript.js"]
