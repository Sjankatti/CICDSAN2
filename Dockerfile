# Use official Node image
FROM node:18
# Set working directory
WORKDIR /app
# Copy package files first (better caching)
COPY package*.json ./
# Install dependencies
RUN npm install
# Copy rest of application
COPY . .
# Expose port
EXPOSE 3000
# Start app
CMD ["node", "app.js"]