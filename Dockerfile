FROM node:20.14-alpine


USER ${EUID}

WORKDIR /app