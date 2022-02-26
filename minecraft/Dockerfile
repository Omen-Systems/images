FROM alpine:3.15

ARG VANILLA_VERSION=latest
ARG SERVER_MEMORY=1024M
ARG PORT=25565

WORKDIR /server

COPY setup_server.sh .

RUN chmod +x setup_server.sh
RUN ./setup_server.sh
RUN /usr/bin/java -version
ENV JAVA_OPTS="-Xms128m -Xmx$SERVER_MEMORY"  
RUN echo $JAVA_OPTS
RUN echo eula=true >> eula.txt
RUN echo server-port=$PORT >> eula.txt
CMD /usr/bin/java ${JAVA_OPTS} -jar server.jar