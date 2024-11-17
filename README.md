# 🛍️ UI-Ecommerce-Flutter

A mobile E-Commerce application built using Flutter, providing an intuitive and responsive shopping experience for users.

## 📝 Description

This application is a UI/UX implementation for an E-Commerce platform focusing on seamless user experience and modern design. Built using the Flutter framework to support cross-platform development.

## 📁 Project Structure

```
lib/
├── core/
│   ├── constants/
│   │   ├── app_colors.dart
│   │   ├── app_sizes.dart
│   │   └── app_text_styles.dart
│   ├── theme/
│   │   └── app_theme.dart
│   └── utils/
│       ├── page_transition.dart
│       └── size_config.dart
├── features/
│   ├── auth/
│   │   ├── providers/
│   │   ├── screens/
│   │   └── widgets/
│   ├── cart/
│   │   ├── models/
│   │   ├── providers/
│   │   ├── screens/
│   │   └── widgets/
│   ├── history/
│   │   ├── models/
│   │   ├── screens/
│   │   └── widgets/
│   ├── home/
│   │   ├── models/
│   │   ├── providers/
│   │   ├── screens/
│   │   └── widgets/
│   ├── main/
│   │   └── screens/
│   ├── payment/
│   │   ├── models/
│   │   ├── providers/
│   │   ├── screens/
│   │   └── widgets/
│   └── profile/
│       ├── models/
│       ├── screens/
│       └── widgets/
├── shared/
│   └── widgets/
│       ├── buttons/
│       ├── cards/
│       ├── inputs/
│       └── loading/
└── main.dart
```

## ⭐ Key Features

### 🔐 Authentication
- 👤 Login
- ✍️ Register
- 🔄 Forgot Password
- ✉️ Email Verification

### 🏠 Home & Catalog
- 📋 Product catalog with categories
- 🔍 Product search
- 🏷️ Filter by categories:
  - 📦 All Products
  - 💻 Computers
  - 🔧 Hardware
  - 🎮 Accessories
- 📱 Product details
- ⭐ Product recommendations

### 🛒 Cart & Checkout
- 🛍️ Shopping cart management
- 🧮 Automatic total calculation
- 📝 Product quantity management
- 💳 Checkout process
- 📍 Shipping address

### 💰 Payment System
- 💳 Multiple payment methods:
  - 🏦 Virtual Account
  - 🏧 Bank Transfer
  - 📱 E-Wallet
- 📄 Payment details
- ⏳ Real-time transaction status
- ⏰ Payment timer
- ✅ Payment confirmation

### 📋 Transaction History
- 📑 Transaction history list
- 🔍 Filter by status:
  - ⏳ Pending Payment
  - 🔄 Processing
  - 🚚 Shipping
  - ✅ Completed
  - ❌ Cancelled
- 📋 Transaction details
- 📃 Digital invoice

### 👤 Profile & Settings
- 👤 User information
- ✏️ Edit profile
- 🔔 Notification settings
- 🔒 Security settings
- 📍 Saved addresses
- 🚪 Logout

## 🛠️ Technology Stack

### 🎯 Core
- 📱 Flutter SDK
- 🎯 Dart
- 🔄 Provider (State Management)

### 🎨 UI/UX
- 📐 Flutter ScreenUtil
- 🔤 Google Fonts
- 🖼️ Cached Network Image
- ✨ Custom Animations
- 📱 Responsive Layout

### 🔧 Utilities
- 🌐 Intl (Internationalization)
- 🔗 URL Launcher
- 📤 Share Plus
- 📸 Image Picker
- 📂 Path Provider

## 🚀 Installation & Setup

### ⚙️ Prerequisites
- 📱 Flutter SDK (latest version)
- 💻 Android Studio / VS Code
- 📱 iOS Simulator / Android Emulator
- 📂 Git

### 📥 Installation Steps

1. Clone repository
```bash
git clone https://github.com/ellfarnaz/Ui-Ecommerce-Flutter.git
```

2. Navigate to project directory
```bash
cd Ui-Ecommerce-Flutter
```

3. Install dependencies
```bash
flutter pub get
```

4. Run the application
```bash
flutter run
```

### 🔧 Development Configuration

1. Debug Mode
```bash
flutter run --debug
```

2. Release Mode
```bash
flutter run --release
```

3. Profile Mode
```bash
flutter run --profile
```

## 🔄 State Management

This project uses Provider as the state management solution for several reasons:
- ✨ Easy to learn and implement
- 👍 Official recommendation from Flutter team
- ⚡ Good performance for medium-scale applications
- 🔄 Supports dependency injection

## 📝 Coding Standards

### 📌 Naming Conventions
- 📘 `UpperCamelCase` for class and enum names
- 📗 `lowerCamelCase` for variables and functions
- 📙 `lowercase_with_underscores` for file names

### 📂 File Organization
- 📱 One widget per file
- 🔄 Separation of logic and UI
- 🔄 Reusable widgets in shared folder
- 📁 Feature-based folder structure

## 🧪 Testing

### Unit Testing
```bash
flutter test test/unit/
```

### Widget Testing
```bash
flutter test test/widget/
```

### Integration Testing
```bash
flutter test integration_test/
```

## 🔨 Build & Release

### Android
```bash
flutter build apk --release
```

### iOS
```bash
flutter build ios --release
```

## ❗ Troubleshooting

### Common Issues

1. Build Failures
   - Clean project: `flutter clean`
   - Get dependencies: `flutter pub get`
   - Restart IDE

2. iOS Issues
   - Pod install: `cd ios && pod install`
   - Update pods: `pod update`

3. Android Issues
   - Invalidate caches: Android Studio -> File -> Invalidate Caches
   - Update Gradle

## 🤝 Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## 📌 Versioning

We use [SemVer](http://semver.org/) for versioning.

## 👨‍💻 Authors

- **Farel Naufal A** - _Initial work_ - [Ellfarnaz](https://github.com/ellfarnaz)

## 📄 License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details

## 🌟 Badges

![Flutter Version](https://img.shields.io/badge/Flutter-3.0.0-blue)
![Dart Version](https://img.shields.io/badge/Dart-3.0.0-blue)
![License](https://img.shields.io/badge/license-MIT-green)
![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen)

## 🙏 Acknowledgments

- Flutter Team
- Contributors
- Community Support
