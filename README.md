<div align="center">
  <h1>H-Talk Chat App</h1>
</div>

A modern, cross-platform chat application built with Flutter and Firebase. H-Talk supports real-time messaging, authentication, localization, and a beautiful UI for both Android and iOS.

**SDK Version:** Flutter 3.7.2  
**Languages Used:** Dart, English, Arabic

## Features

- 🔥 Real-time chat using Firebase Firestore
- 🔒 Secure authentication with Firebase Auth
- 🌍 Multi-language support (English & Arabic)
- 🎨 Custom UI components and theming
- 📱 Responsive design for mobile devices
- 🖼️ SVG and image assets for a rich experience
- 🧪 Widget and integration tests

## Screenshots

![Welcome Screen](assets/images/main_top.png)
![Chat Screen](assets/images/login_bottom.png)

## Getting Started

### Prerequisites

- [Flutter SDK](https://flutter.dev/docs/get-started/install)
- [Firebase Project](https://console.firebase.google.com/)
- Android Studio or Xcode for mobile development

### Installation

1. **Clone the repository:**
   ```sh
   git clone https://github.com/HamzaAlwajeeh/Chat-APP.git
   cd chat_app
   ```
2. **Install dependencies:**
   ```sh
   flutter pub get
   ```
3. **Configure Firebase:**

   - Add your `google-services.json` to `android/app/`
   - Add your `GoogleService-Info.plist` to `ios/Runner/`
   - Update Firebase settings in `lib/firebase_options.dart`

4. **Run the app:**
   ```sh
   flutter run
   ```

## Project Structure

```
lib/
  constants/         # App constants
  gen/               # Generated assets
  helper/            # Helper functions (snack bar, etc.)
  models/            # Data models
  routes/            # App routes
  views/             # Screens (login, signup, chat, welcome)
  widgets/           # Reusable widgets
  generated/         # Localization files
assets/
  icons/             # SVG icons
  images/            # PNG images
android/ios/web/     # Platform-specific files
```

## Localization

- English and Arabic translations are available in `lib/l10n/`.
- Easily add more languages by updating `.arb` files and running the Flutter Intl plugin.

## Testing

- Run widget tests with:
  ```sh
  flutter test
  ```

## Contributing

Pull requests are welcome! For major changes, please open an issue first to discuss what you would like to change.

## License

This project is licensed under the MIT License.

---

Made with ❤️ by Hamza Alwajeeh
