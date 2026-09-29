FROM node:20-bookworm-slim
RUN apt-get update && apt-get install -y --no-install-recommends python3 unzip ca-certificates && rm -rf /var/lib/apt/lists/*
WORKDIR /app
COPY app_bundle.zip /tmp/app_bundle.zip
RUN unzip -q /tmp/app_bundle.zip -d /app && rm /tmp/app_bundle.zip && mkdir -p /app/data
ENV NODE_ENV=production
ENV PORT=3000
EXPOSE 3000
CMD ["node", "server.js"]
