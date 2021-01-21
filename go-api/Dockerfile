FROM golang:latest 

ARG APP_NAME
ARG DEPLOY_ENV
ARG AUTHOR

ENV APP_NAME=${APP_NAME}
ENV DEPLOY_ENV=${DEPLOY_ENV}
ENV AUTHOR=${AUTHOR}

RUN mkdir /app 
ADD *.go /app/
WORKDIR /app 
RUN go build -o main

CMD ["/app/main"]