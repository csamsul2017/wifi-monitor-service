# Pake Node versi LTS (Long Term Support) yang ringan
FROM node:18-alpine

WORKDIR /app

# Copy package dulu biar cache npm jalan
COPY package*.json ./

# Install dependencies (ci = clean install, lebih cepet & stabil buat server)
RUN npm ci

# Copy sisa codingan
COPY . .

# Generate Prisma Client (Wajib buat Docker)
RUN npx prisma generate

# Buka jalur port 3000
EXPOSE 3000

# Jalanin server
CMD ["node", "index.js"]