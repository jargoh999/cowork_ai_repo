## Use the official Node.js image as the base image
#FROM node:20-alpine
#
## Set the working directory inside the container
#WORKDIR /app
#
## Copy package.json and package-lock.json to the working directory
#COPY package*.json ./
#
## Install dependencies
#RUN npm install
#
## Copy the rest of the application code to the working directory
#COPY . .
#
## Build the frontend
#RUN npm run build --prefix frontend
#
## Expose the ports that the apps run on
#EXPOSE 3000 5173
#
## Command to run both the backend and frontend
#CMD ["sh", "-c", "npm run start & npm run dev --prefix frontend"]

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

# Expose the ports that the apps run on
EXPOSE 3000 5173

# Command to run both the backend and frontend
CMD ["sh", "-c", "npm run start & npm run dev"]
