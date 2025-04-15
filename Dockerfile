# Use official Node.js LTS image
FROM node:18

# Set working directory inside container
WORKDIR /app

# Clone the GitHub repository
RUN git clone https://github.com/smayonise/simple-nodejs-app_Lab_Exam.git .

# Install dependencies
RUN npm install

# Expose app port (update if app uses a different port)
EXPOSE 8080

# Start the app
CMD ["npm", "start"]
