FROM anapsix/alpine-java

ADD ./build/libs/java-app-0.1.0.jar .

EXPOSE 8080

CMD java -jar java-app-0.1.0.jar