FROM maven

EXPOSE 9090

COPY /root/game-of-life/gameoflife-web/target/gameoflife.war /opt/app/gameoflife.war 

RUN mvn -f /opt/app/gameoflife.war jetty:run

