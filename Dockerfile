# Stage 1: Build the app
FROM node:16-slim as build

WORKDIR /app

COPY package*.json ./
RUN npm install

COPY . .

RUN npm run build

# Stage 2: Serve the static site with Apache
FROM httpd:2.4

COPY --from=build /app/dist /usr/local/apache2/htdocs/
