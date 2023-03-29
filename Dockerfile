FROM registry.cn-hangzhou.aliyuncs.com/acs/alpine:latest
RUN echo "https://mirrors.aliyun.com/alpine/latest-stable/main" > /etc/apk/repositories \
    && echo "https://mirrors.aliyun.com/alpine/latest-stable/community" >> /etc/apk/repositories

RUN apk add nodejs
RUN apk add npm

COPY ./ /var/chatgpt-api

WORKDIR /var/chatgpt-api
RUN npm ci --no-color --quiet

ENV API_HOST=0.0.0.0

EXPOSE 3000

ENTRYPOINT npm start
