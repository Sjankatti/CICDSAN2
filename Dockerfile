# Use official Node image
FROM node:18

# Set working directory
WORKDIR /app

# Copy files
COPY . .

# Expose port
EXPOSE 3000

# Run application
CMD ["node", "app.js"]