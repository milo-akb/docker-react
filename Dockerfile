# First phase build
FROM node:16-alpine AS builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# Second phase run
FROM nginx
# Copy everything from previous phase
COPY --from=builder /app/build /usr/share/nginx/html
