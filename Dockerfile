FROM dockerfile/nodejs:latest

# Install Git
RUN apt-get install -y git

# Add source
ADD ./node_modules /opt/zorium-paper-demo/node_modules
ADD . /opt/zorium-paper-demo

WORKDIR /opt/zorium-paper-demo

# Install app deps
RUN npm install

CMD ["npm", "start"]
