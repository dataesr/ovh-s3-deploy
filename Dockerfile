FROM python:3-slim
RUN pip3 install awscli awscli-plugin-endpoint
COPY entrypoint.sh /usr/local/bin/
COPY . .
RUN ls -a
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
