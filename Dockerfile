FROM dockerfile/nodejs:latest

# Install Git
RUN apt-get install -y git

# Add source
ADD ./node_modules /opt/zorium-site/node_modules
ADD . /opt/zorium-site

WORKDIR /opt/zorium-site

# Install app deps
RUN npm install

CMD ["npm", "start"]
