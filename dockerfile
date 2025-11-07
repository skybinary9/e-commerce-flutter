# ================================
# Flutter + Android + Web Builder
# ================================
FROM ghcr.io/cirruslabs/flutter:latest

LABEL maintainer="Muhammad Shoaib <skybinary.net>" \
      description="Docker image to build Flutter apps for Web and Android."

# Set working directory
WORKDIR /app

# Copy project files
COPY . .

# Get Flutter dependencies
RUN flutter pub get

# Enable Flutter web
RUN flutter config --enable-web

# Pre-cache necessary Flutter artifacts
RUN flutter precache --web --android

# Optional: Clean previous builds
RUN flutter clean

# =====================
# Build Web and Android
# =====================
# Uncomment the builds you need:

# 🧭 Build Web Release
# RUN flutter build web --release

# 📱 Build Android APK
# RUN flutter build apk --release

# 🧩 Build Android App Bundle
# RUN flutter build appbundle --release

# Default command: show Flutter version
CMD ["flutter", "--version"]
