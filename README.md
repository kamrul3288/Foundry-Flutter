<div align="center">

# 🏗 Foundry Flutter

**A scalable, modular, and feature-driven Flutter application template using Clean Architecture, BLoC, and Dart Workspaces.**

[![Flutter SDK](https://img.shields.io/badge/Flutter-%5E3.11.0-02569B?logo=flutter)](https://flutter.dev)
[![Dart Workspace](https://img.shields.io/badge/Dart-Workspace-1C2C39?logo=dart)](https://dart.dev)
[![Melos](https://img.shields.io/badge/Melos-%5E7.4.0-FF4081)](https://melos.invertase.dev)
[![State](https://img.shields.io/badge/State-BLoC%20%2F%20Riverpod-blue)](#-state-management)

</div>

<br />

Welcome to **Foundry Flutter**! This project serves as a robust foundation for building production-ready, highly maintainable, and scalable enterprise iOS and Android applications. It leverages the Dart workspace feature supported by [Melos](https://melos.invertase.dev/) to split functionality logically into standalone packages, maintaining strict separation of concerns through Clean Architecture.

---

<p align="center">
  <img src="https://github.com/user-attachments/assets/7a7a4c2a-a173-4484-844f-33d0501901da" width="30%">
  &nbsp;
  <img src="https://github.com/user-attachments/assets/572c29c6-a173-4eb5-9160-3db39eec6c07" width="30%">
  &nbsp;
  <img src="https://github.com/user-attachments/assets/eaed11af-72ec-4eba-b228-7878496c676e" width="30%">
</p>


## 🌟 Key Features

- **🏛 Architectural Pattern**: Implements **Clean Architecture**, completely decoupling the presentation, domain, and data layers.
- **🧩 Modularity (Monorepo)**: Uses **Dart Workspaces via Melos** to orchestrate independent packages (`packages`, `features`, `components`).
- **🎛 State Management**: Integrates **BLoC** (Business Logic Component) and **Riverpod** for reactive and predictable widget states.
- **🔗 Advanced Routing**: Managed with both **GoRouter** (`go_router`) and **AutoRoute** (`auto_router`) depending on package needs.
- **💉 Dependency Injection**: Utilizes `get_it` combined with Riverpod / BLoC strategies for decoupled dependencies.
- **📡 Network Resilience**: Configured `dio` client wrapper (`dio`) with interceptors ensuring robust API interactions.
- **🎨 Design System**: Reusable foundational UI & tokens located in `feature_playground_atoms/flutter_design_system`.
- **🚀 CI/CD Ready**: Built-in scripts for pushing ad-hoc and release builds directly to **TestApp.io**.

---

## 📂 Project Structure

This workspace is composed of several nested Flutter packages, keeping core domain rules strictly independent from UI layers:

```text
foundry_flutter/
├── app/                                 # Entry-point Flutter Application
├── foundry_core/                        # Base app constants, configuration, and interfaces
├── foundry_native/                      # Native platform specific integrations
├── feature_playground_atoms/            # Foundational features & architecture setups
│   ├── clean_architecture_bloc/         # Feature set using BLoC & Clean Arch (Login, Splash)
│   └── flutter_design_system/           # Tokens, Colors, Theming, Base Widgets
├── feature_playground_molecules/        # Composite features & interactions
│   ├── go_router_navigation/            # Feature set demonstrating Router navigation setups
│   └── media_picker/                    # Abstract image/video picker implementations
└── flutter_popular_packages/            # Reusable Application Infrastructures
    ├── auto_router/                     # AutoRoute extensions & configurations
    ├── dio/                             # Networking (Dio wrappers & interceptors)
    ├── flutter_secure_storage/          # Encrypted local key-value storage
    ├── get_it/                          # Dependency injection setup
    └── go_router/                       # GoRouter extensions & implementations
```

---

## 🛠 Getting Started

### Prerequisites

Ensure you have the following installed on your local development environment:

- **Flutter SDK**: `^3.11.0` or higher ([Installation Guide](https://docs.flutter.dev/get-started/install))
- **Melos**: A Dart tool for managing Dart projects with multiple packages.

To activate Melos globally, run:
```bash
dart pub global activate melos
```

### Installation

1. **Clone the repository:**
   ```bash
   git clone <repository-url>
   cd foundry_flutter
   ```

2. **Bootstrap the workspace:**
   Use the custom script or melos directly to fetch all dependencies across modules:
   ```bash
   melos run clean_and_get
   ```
   *Alternative:* `melos bootstrap`

3. **Generate Code (Freezed, Riverpod, AutoRoute, REST API clients):**
   Generating the required generated files (`.g.dart`, `.freezed.dart`, etc.) is essential before running the app.
   ```bash
   melos run build_runner
   ```
   *To watch for changes during development:*
   ```bash
   melos run build_runner_watch
   ```

4. **Run the Application:**
   ```bash
   cd app
   flutter run
   ```

---

## 📜 Available Scripts

We have configured several Melos wrapper scripts located in `pubspec.yaml` to streamline routine tasks:

| Command | Description |
| ------- | ----------- |
| `melos run clean_and_get` | Cleans the Flutter cache and bootstraps (pub get) across all packages. |
| `melos run build_runner` | Triggers a one-time intensive code generation via `build_runner`. |
| `melos run build_runner_watch` | Runs code generators in continuous tracking (watch) mode. |
| `melos run auto_route_generate` | Restricts build runner generation specifically to AutoRoute configuration. |
| `melos run publish-android-app-ta` | Builds a Release APK and uploads it to TestApp.io using `ta-cli`. |
| `melos run publish-ios-app-ta` | Builds a Release IPA (Ad-Hoc) and uploads it to TestApp.io using `ta-cli`. |
| `melos run update_minor_deps` | Executes `update_melos_minor_deps.dart` script. |
| `melos run update_major_deps` | Executes `update_melos_major_deps.dart` script. |

---

## 📝 Conventions and Guidelines

1. **Clean Architecture Compliance**: Features must reside within `feature_playground_atoms/` or `feature_playground_molecules/` and internally separate their logic via Data, Domain, and Presentation directories.
2. **Localization First**: Raw strings should be kept to a minimum in presentation codes. Leverage `.arb` translations.
3. **No Direct Package Dependency Abuse**: If package `A` needs something from package `B`, ensure the interaction boundary passes strictly through interfaces (`foundry_core` or explicit bridges).
4. **Responsive UI**: Apply responsive sizing (e.g., `flutter_screenutil`) through the robust design system components (`feature_playground_atoms/flutter_design_system`).
