# Use the official Jenkins LTS image
FROM jenkins/jenkins:lts

# Switch to root to install tools
USER root

# Install Node.js, npm, and git
RUN apt-get update && \
    apt-get install -y curl git && \
    curl -fsSL https://deb.nodesource.com/setup_18.x | bash - && \
    apt-get install -y nodejs && \
    node -v && npm -v

# Create directory for the Node.js app
RUN mkdir -p /var/jenkins_home/simple-nodejs-app

# Change to Jenkins user
USER jenkins

# Clone the repository (can also be done in a Jenkins job instead)
RUN git clone https://github.com/smayonise/simple-nodejs-app_Lab_Exam.git /var/jenkins_home/simple-nodejs-app

# Set working directory
WORKDIR /var/jenkins_home/simple-nodejs-app

# Install dependencies (optional here – can be done in the Jenkins pipeline)
RUN npm install

# Expose default Jenkins port
EXPOSE 8080

# Jenkins will start by default, no need for entrypoint changes
