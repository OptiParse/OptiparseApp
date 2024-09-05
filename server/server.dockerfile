# Use Node.js 20 as the base image
FROM node:20

# Set the working directory in the container
WORKDIR /app

# Copy package.json and package-lock.json to the working directory
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the Prisma schema to the working directory
COPY prisma ./prisma

# Generate Prisma client code
RUN npx prisma generate

# Copy the rest of the application files to the working directory
COPY . .

# Expose port 4000 for the application
EXPOSE 4000

# Run Prisma migrations and start the application
CMD ["sh", "-c", "npx prisma migrate deploy && node app.js"]
