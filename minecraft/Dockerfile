FROM alpine:3.15

ENV VANILLA_VERSION=latest
ENV SERVER_MEMORY=1024M
ENV PORT=25564

WORKDIR /server

COPY setup_server.sh .

RUN chmod +x setup_server.sh
RUN ./setup_server.sh
RUN /usr/bin/java -version
ENV JAVA_OPTS="-Xms128m -Xmx$SERVER_MEMORY"  
RUN echo eula=true > eula.txt
RUN echo server-port=${PORT} > server.properties
CMD /usr/bin/java ${JAVA_OPTS} -jar server.jar nogui