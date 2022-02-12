FROM fluent/fluentd
USER root
# https://docs.fluentd.org/output/elasticsearch
#RUN ["gem", "install", "fluent-plugin-elasticsearch", "--no-rdoc", "--no-ri"]
RUN gem install fluent-plugin-elasticsearch --no-rdoc --no-ri   && \
     gem sources --clear-all
COPY ./fluentd/fluentd.conf /fluentd/etc/fluent.conf
RUN chown fluent /fluentd/etc/fluent.conf
USER fluent
ENTRYPOINT ["fluentd", "-c", "/fluentd/etc/fluent.conf"]
