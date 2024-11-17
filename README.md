```markdown
# UI-Ecommerce-Flutter

<p align="center">
  <img src="assets/images/logo.png" alt="E-Commerce Logo" width="200"/>
</p>

Aplikasi E-Commerce mobile yang dibangun menggunakan Flutter, menyediakan pengalaman belanja yang modern dan user-friendly. Project ini fokus pada implementasi UI/UX yang clean dan responsive dengan fitur-fitur e-commerce standar industri.

## 📱 Preview Aplikasi

<p align="center">
  <img src="screenshots/welcome.png" width="200" alt="Welcome Screen"/>
  <img src="screenshots/home.png" width="200" alt="Home Screen"/>
  <img src="screenshots/cart.png" width="200" alt="Cart Screen"/>
  <img src="screenshots/payment.png" width="200" alt="Payment Screen"/>
</p>

## ✨ Fitur Utama

### 🏠 Home & Katalog

- Tampilan grid produk yang responsive
- Kategori produk (Semua, Komputer, Hardware, Aksesoris)
- Search bar dengan fitur filter
- Product detail dengan gambar dan deskripsi lengkap

### 🛒 Shopping Cart

- Add to cart dengan animasi
- Adjustment quantity produk
- Kalkulasi total otomatis
- Cart summary

### 💳 Payment System

- Multiple payment methods:
  - Virtual Account
  - E-Wallet
  - Bank Transfer
- Payment confirmation
- Timer pembayaran
- Status tracking

### 📋 Order Management

- Order history
- Status tracking:
  - Menunggu Pembayaran
  - Diproses
  - Dalam Pengiriman
  - Selesai
  - Dibatalkan
- Detail transaksi
- Invoice generation

### 👤 User Profile

- User information management
- Address management
- Order history
- Settings

## 🛠 Teknologi

- Flutter SDK
- Dart
- State Management:
  - Provider
  - ChangeNotifier
- UI Components:
  - Flutter ScreenUtil
  - Google Fonts
  - Cached Network Image
- Utilities:
  - Intl
  - URL Launcher
  - Share Plus

## 🏗 Arsitektur Project
```

lib/
├── core/
│ ├── constants/
│ │ ├── app_colors.dart
│ │ ├── app_images.dart
│ │ └── app_sizes.dart
│ ├── theme/
│ │ └── app_theme.dart
│ └── utils/
│ ├── currency_formatter.dart
│ └── date_formatter.dart
├── features/
│ ├── auth/
│ │ ├── screens/
│ │ ├── providers/
│ │ └── models/
│ ├── cart/
│ │ ├── screens/
│ │ ├── providers/
│ │ └── models/
│ ├── history/
│ ├── home/
│ ├── main/
│ ├── profile/
│ └── welcome/
└── shared/
└── widgets/
├── custom_button.dart
├── custom_text_field.dart
└── loading_indicator.dart

````

## 🚀 Memulai

### Prerequisites
- Flutter SDK (2.5.0 atau lebih tinggi)
- Dart SDK (2.14.0 atau lebih tinggi)
- Android Studio/VS Code
- iOS Simulator/Android Emulator

### Instalasi

1. Clone repository
```bash
git clone https://github.com/yourusername/UI-Ecommerce-Flutter.git
````

2. Masuk ke direktori project

```bash
cd UI-Ecommerce-Flutter
```

3. Install dependencies

```bash
flutter pub get
```

4. Jalankan aplikasi

```bash
flutter run
```

## 📱 Supported Platforms

- Android
- iOS
- Web (Responsive)

## 🎯 State Management

Project ini menggunakan Provider sebagai state management solution. Beberapa keuntungan menggunakan Provider:

- Mudah diimplementasikan
- Performance yang baik
- Maintainable code
- Flutter recommended

Contoh penggunaan Provider:

```dart
// Define provider
class CartProvider extends ChangeNotifier {
  List<CartItem> _items = [];

  void addItem(Product product) {
    _items.add(CartItem(product: product));
    notifyListeners();
  }
}

// Consume provider
Consumer<CartProvider>(
  builder: (context, cart, child) {
    return Text('${cart.totalItems} items');
  },
)
```

## 🎨 UI Components

Project menggunakan beberapa custom components:

- CustomButton
- CustomTextField
- ProductCard
- LoadingIndicator
- ErrorDialog

## 📦 Assets

```
assets/
├── images/
│   ├── logo.png
│   ├── products/
│   └── icons/
└── fonts/
```

## 🔧 Configuration

Konfigurasi aplikasi dapat diubah di:

```dart
lib/core/constants/app_config.dart
```

## 🤝 Kontribusi

1. Fork repository
2. Create feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to branch (`git push origin feature/AmazingFeature`)
5. Open Pull Request

## 📝 License

Distributed under the MIT License. See `LICENSE` for more information.

## 📞 Contact

Your Name - [@yourusername](https://twitter.com/yourusername)

Project Link: [https://github.com/yourusername/UI-Ecommerce-Flutter](https://github.com/yourusername/UI-Ecommerce-Flutter)

## 🙏 Acknowledgments

- [Flutter](https://flutter.dev)
- [Provider](https://pub.dev/packages/provider)
- [Google Fonts](https://pub.dev/packages/google_fonts)
- [Flutter ScreenUtil](https://pub.dev/packages/flutter_screenutil)

```

```
