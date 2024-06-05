FROM amazoncorretto:17.0.6

LABEL maintainer "Michael Riffle <mriffle@uw.edu>"

# Add the required files to the container.
ADD PanoramaClient.jar /usr/local/bin/PanoramaClient.jar
ADD labkey-client-api-1.5.0-all.jar /usr/local/bin/labkey-client-api-1.5.0-all.jar
ADD entrypoint.sh /usr/local/bin/entrypoint.sh

RUN chmod 755 /usr/local/bin/entrypoint.sh && \
    yum install -y procps && \
    yum clean all && \
    rm -rf /var/cache/yum

WORKDIR /usr/local/bin

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
CMD []
