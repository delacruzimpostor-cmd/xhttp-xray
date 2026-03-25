FROM alpine:latest

RUN apk add --no-cache curl unzip

ENV XRAY_VERSION=1.8.4
RUN curl -L https://github.com/XTLS/Xray-core/releases/download/v${XRAY_VERSION}/Xray-linux-64.zip -o xray.zip && \
    unzip xray.zip -d /usr/local/bin && \
    chmod +x /usr/local/bin/xray && \
    rm xray.zip

COPY config.json /etc/xray/config.json
EXPOSE 80

CMD ["/usr/local/bin/xray", "-config", "/etc/xray/config.json"]
