# Build phase:
FROM node:18-alpine as builder

WORKDIR /app

COPY package.json .
RUN npm install
COPY . .

RUN npm run build

#  /app/build <--- this is the directory created by npm run build, which we need to copy
#  on the next phase:

# Run phase:
FROM nginx

#  we shall copy from the `builder` phase directory `/app/build`
# into nginx specific dir for static files `/usr/share/nginx/html`
# ( this location is specified in the docker hub for nginx )
COPY --from=builder /app/build /usr/share/nginx/html

# we don't need to explicitly write  the `CMD [commands]`, 
# because the nginx base image already has the
# instruction to run nginx server on container startup
# also, the build phase's files will be automatically discarded ( eg. node_modules etc.)