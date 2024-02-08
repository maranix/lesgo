# Lesgo Assignment

An assignment implemented to showcase Infinite Scrolling & Auto-fetching on scroll using `MobX` state-management & `freezed` for data models.

https://github.com/maranix/lesgo/assets/59292838/451eeffc-aacb-4a88-9aa7-74f834d59f20

## Tech Stack

- Flutter 3.10
- Dart 3.0
- MobX
- Freezed
- http
- share_plus
- flutter_toast

## Project Structure

```
src
│
├── models
│      ├── deal_model.dart
│      └── model.dart
│
├── repository
│       ├── assignment
│       ├── base.dart
│       └── repository.dart
│
├── stores
│   ├── deals_store.dart
│   └── stores.dart
│
├── presentation
│   ├── deals
│   │   ├── deals_page.dart
│   │   └── widgets
│   └── presentation.dart
│
└── utils
    ├── string_extensions
    └── utils.dart
```

## Architecture
The project Architecture and structure was inspired from the official MobX examples and its directory.

## Setup Instructions

To run this project locally, follow these steps:

1. Clone the repository: `git clone https://github.com/maranix/lesgo`
2. Navigate to the project directory: `cd lesgo`
3. Ensure you have Flutter and Dart SDK installed. If not, you can download them from the official Flutter website.
5. Install project dependencies: `flutter pub get`
6. Run the project on your preferred device or emulator: `flutter run`

## License

This project is licensed under the MIT License.

## Contact

For any inquiries or questions, you can reach me  at ramanverma4183@gmail.com.
