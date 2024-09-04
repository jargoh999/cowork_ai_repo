

# Use the official Node.js image as the base image
FROM node:20-alpine

# Set the working directory inside the container
WORKDIR /app

# Copy package.json and package-lock.json to the working directory
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application code to the working directory
COPY . .

# Build the frontend
RUN npm run build

# Expose the port that the app runs on
EXPOSE 5173

# Command to run the app
CMD ["npm", "run", "dev"]
