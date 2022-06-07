FROM alpine:3.16
RUN apk add gcc python3-dev py3-pip musl-dev libffi-dev openssh
RUN pip install ansible
COPY deploy.yaml inv key entrypoint.sh ./
RUN chmod 0400 inv key
RUN chmod u+x entrypoint.sh
ENTRYPOINT ["./entrypoint.sh"]
