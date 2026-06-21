FROM node:24-alpine

RUN apk add --no-cache bash bash-completion

WORKDIR /app

COPY .bashrc /root/.bashrc

ENV NODE_ENV=development
ENV NEXT_TELEMETRY_DISABLED=1

EXPOSE 3000

# package.json y código fuente se montan como volúmenes
# npm install en startup usa la caché de npm montada
CMD ["bash", "-c", "npm install --prefer-offline && npm run dev"]
