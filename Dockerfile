FROM node:20-buster-slim AS base-image
WORKDIR /app
EXPOSE 8000
COPY package*.json .
RUN npm i --omit=optional
ENTRYPOINT [ "/bin/bash" ]


FROM base-image AS aula
ENV AULA=''
COPY . .
CMD [ "start.sh" ]
