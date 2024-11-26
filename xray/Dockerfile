FROM alpine:3.20.2

RUN apk --no-cache add wget unzip

ARG XRAY_DIRECTORY=/usr/local/xray

RUN wget https://github.com/XTLS/Xray-core/releases/download/v24.11.21/Xray-linux-64.zip \
&& unzip -d $XRAY_DIRECTORY Xray-linux-64.zip \
&& rm Xray-linux-64.zip

WORKDIR $XRAY_DIRECTORY

COPY config.json config.json

ENTRYPOINT ["./xray"]
CMD ["run", "-c", "./config.json"]
