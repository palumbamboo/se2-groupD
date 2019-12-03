FROM ubuntu:latest

WORKDIR ./
COPY ./js-server/package.json .
RUN apt update
RUN apt install -y nodejs npm mysql-server
RUN npm install
RUN printf "#!/bin/sh\nexit 0" > /usr/sbin/policy-rc.d
COPY ./js-server ./
COPY ./mysql_db ./db
COPY ./startup.sh ./startup.sh
EXPOSE 8000
EXPOSE 8080

#ENTRYPOINT ["./startup.sh"]
#CMD ["node", "server.js"]
CMD ["/bin/bash", "startup.sh"]