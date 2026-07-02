FROM node:20-alpine AS build

WORKDIR /app

ARG VITE_SUPABASE_KEY

ARG VITE_SUPABASE_URL

ARG VITE_N8N_WEBHOOK_URL

ENV VITE_SUPABASE=$VITE_SUPABASE

ENV VITE_N8N_WEBHOOK_URL=$VITE_N8N_WEBHOOK_URL

COPY package*.json ./

RUN npm install

COPY . .

RUN npm run build

FROM nginx:1.27-alpine

COPY --from=build /app/dist /usr/share/nginx/html

COPY nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]