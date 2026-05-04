FROM node:18-alpine AS build
WORKDIR /app
COPY package*.json ./
RUN npm ci
COPY . .
RUN npm run build

FROM nginx:alpine
COPY --from=build /app/build /usr/share/nginx/html
ENV SECRET_KEY
ENV DEBUG
ENV DJANGO_ALLOWED_HOSTS
EXPOSE 8080
HEALTHCHECK CMD curl -f http://localhost:8080 || exit 1
CMD ["nginx", "-g", "daemon off;"]