#!/bin/bash

# Install Firebase CLI
npm install -g firebase-tools

# Authenticate with Firebase using the stored credentials
firebase login:ci --no-localhost --token "$FIREBASE_TOKEN"

# Navigate to the web project directory
cd web

# Build the Flutter web app
flutter build web

# Deploy the app to Firebase hosting
firebase deploy --only hosting
