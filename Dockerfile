FROM golang:alpine as app
RUN mkdir -p /yopass
WORKDIR /yopass
COPY . .
RUN go build ./cmd/yopass && go build ./cmd/yopass-server

FROM node as website
COPY website /website
WORKDIR /website
RUN yarn install && yarn build

FROM alpine
ENV PORT=1337
COPY --from=app /yopass/yopass /yopass/yopass-server /
COPY --from=website /website/build /public
ADD docker-entrypoint.sh /bin/start.sh
RUN apk update && apk add memcached redis && \
    addgroup -S yopass && adduser -S yopass -G yopass
USER yopass
ENTRYPOINT ["/bin/start.sh"]
