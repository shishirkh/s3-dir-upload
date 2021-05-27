FROM node:12
COPY . .
ENTRYPOINT ["/bin/sh","-c","node index.js"]
