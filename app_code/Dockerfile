FROM alpine
COPY . .
RUN apk add --update nodejs npm
RUN npm install
CMD ["npm","start"]
