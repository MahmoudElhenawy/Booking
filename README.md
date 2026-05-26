<div align="center">

# 🚌🚆✈️ Booking App

### A modern Flutter travel booking application built with Clean Architecture

![Flutter](https://img.shields.io/badge/Flutter-3.x-02569B?style=for-the-badge&logo=flutter&logoColor=white)
![Dart](https://img.shields.io/badge/Dart-3.x-0175C2?style=for-the-badge&logo=dart&logoColor=white)
![Clean Architecture](https://img.shields.io/badge/Clean-Architecture-4CAF50?style=for-the-badge)
![State Management](https://img.shields.io/badge/Cubit-flutter__bloc-purple?style=for-the-badge)

</div>

---

## 📖 Overview

**Booking App** is a Flutter application that allows users to search and browse available trips across multiple transport types. Designed with a **modern, responsive UI** inspired by leading travel apps like Booking.com and Expedia.

> Built using **Clean Architecture** principles with local dummy data — no backend or APIs required.

---

## ✨ Features

### 🔐 Authentication
- Login & Register screens
- Responsive, reusable UI components

### 🌍 Localization
- 🇸🇦 Arabic & 🇺🇸 English support
- Dynamic language switching
- Full RTL / LTR layout support

### 🎫 Booking System
- Select departure & arrival locations
- Choose transport type (Bus / Train / Flight)
- Select trip type, date, and time
- Search available trips

### 📋 Search Results
- Available tickets with company info
- Price, duration, seat number
- Departure & arrival times

---

## 🏗️ Architecture

The project follows **Clean Architecture** with a strict separation of concerns:

```
lib/
 ├── core/                    # Shared utilities & config
 │    ├── error/
 │    ├── localization/
 │    ├── router/
 │    ├── utils/
 │    └── widgets/
 │
 ├── features/
 │    ├── auth/               # Authentication feature
 │    │    ├── data/
 │    │    ├── di/
 │    │    ├── domain/
 │    │    └── presentation/
 │    │
 │    └── booking/            # Booking feature
 │         ├── data/
 │         ├── di/
 │         ├── domain/
 │         └── presentation/
 │              ├── cubit/
 │              ├── screens/
 │              └── widgets/
 │
 └── main.dart
```

### Layer Breakdown

| Layer | Responsibility |
|-------|---------------|
| **Data** | Models, Repository implementations, Dummy data source |
| **Domain** | Entities, Use cases, Repository contracts |
| **Presentation** | Screens, Widgets, Cubit, States |

---

## 📦 Packages

| Package | Purpose |
|---------|---------|
| `flutter_bloc` | State Management (Cubit) |
| `equatable` | Value-based state comparison |
| `get_it` | Dependency Injection |
| `go_router` | Declarative navigation |
| `easy_localization` | Multi-language & RTL support |

---

## 🚀 Getting Started

```bash
# Install dependencies
flutter pub get

# Run the app
flutter run
```

---

## 🎬 Demo Flow

1. **Authentication** — Login / Register screens
2. **Language Switching** — Toggle Arabic / English
3. **Home Booking Screen** — Select trip parameters
4. **Search Trips** — Apply filters and search
5. **Search Results** — Browse available tickets
6. **Ticket Selection** — View trip details

---

## 🔮 Future Improvements

- [ ] Firebase Authentication
- [ ] Real APIs Integration
- [ ] Online Booking Flow
- [ ] Payment Gateway
- [ ] User Profiles & Favorites
- [ ] Dark Mode
- [ ] Real Company Logos

---

## ⚙️ Tech Stack

```
Flutter + Dart
├── State Management  →  Cubit (flutter_bloc)
├── DI               →  GetIt
├── Navigation       →  GoRouter
└── Localization     →  Easy Localization
```

---

<div align="center">

Made with ❤️ using Flutter

</div>
