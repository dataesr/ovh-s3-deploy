FROM python:3-slim
WORKDIR /usr/src/app
RUN pip3 install awscli awscli-plugin-endpoint
COPY entrypoint.sh /usr/local/bin/
COPY . .
RUN ls -a
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
