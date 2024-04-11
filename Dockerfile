# First stage: Install dependencies and build the project
FROM node:20.10.0-alpine as builder
WORKDIR /usr/src/app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

# Second stage: Setup production image
FROM node:20.10.0-alpine
ENV NODE_ENV production
WORKDIR /usr/src/app
COPY --from=builder /usr/src/app/dist ./dist
COPY package*.json ./
RUN npm ci --only=production
EXPOSE 8000
CMD ["node", "dist/src/index.js"]
