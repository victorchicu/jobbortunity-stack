FROM mongo:8.0.3-noble
COPY ./mongo/mongo-keyfile /etc/mongo-keyfile
RUN chown mongodb:mongodb /etc/mongo-keyfile && chmod 400 /etc/mongo-keyfile

COPY ./mongo/entrypoint.sh /usr/local/bin/custom-entrypoint.sh
RUN chmod +x /usr/local/bin/custom-entrypoint.sh
ENTRYPOINT ["custom-entrypoint.sh"]