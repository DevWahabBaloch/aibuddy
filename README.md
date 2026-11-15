# AI Buddy

AI chat assistant built with Flutter and the Google Gemini API, with Firebase Auth, saved conversations and GetX.

## Overview

A conversational AI assistant. Users sign in with email or Google, chat with Google's Gemini model and come back to earlier conversations.

## Features

- Chat with the Gemini API (`gemini-1.5-pro`) over REST using Dio
- Email/password and Google Sign-In through Firebase Authentication
- Conversations saved per user in the Firebase Realtime Database and listed in a drawer
- GetX for state management, dependency bindings and routing
- Reusable UI kit: custom app bar, buttons, text fields, typing indicator and chat tiles
- Form validation through a mixin and extension methods

## Tech stack

Flutter · Dart · GetX · Dio · Firebase Auth · Google Sign-In · Firebase Realtime Database · flutter_dotenv

## Project structure

```text
lib/
├── config/routes/        # GetX routes
├── core/                 # constants, services, mixins, extensions, shared widgets
└── features/
    ├── auth/             # sign-in (binding · controller · view)
    ├── sign_up/
    ├── home_page/
    └── chat_page/        # binding · controllers · models · repos · view · widgets
```

## Getting started

```bash
flutter pub get
cp .env.example .env   # then fill in the values
flutter run
```

The app loads its configuration from a `.env` file at the project root. That file isn't committed; see `.env.example` for the variables it needs.

---

Built by [Abdul Wahab](https://github.com/DevWahabBaloch), Senior Flutter Developer · [Portfolio](https://devwahabbaloch.web.app/)
