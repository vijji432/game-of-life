FROM maven

EXPOSE 9090

COPY target/gameoflife.war /home/app/gameoflife.war

WORKDIR /home/app

RUN mvn jetty:run
