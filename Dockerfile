FROM node:18-slim

# تثبيت FFmpeg والأدوات المطلوبة
RUN apt-get update && apt-get install -y \
    ffmpeg \
    libsodium23 \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# نسخ الملفات
COPY package*.json ./
RUN npm install

COPY . .

# تعيين متغيرات البيئة
ENV NODE_ENV=production
ENV PORT=3000

# شغّل البوت
CMD ["npm", "start"]

