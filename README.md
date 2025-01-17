# Reusable API Service Architecture with Flutter

This project demonstrates a reusable architecture for managing API services in Flutter applications. It leverages `Dio` for API communication, `Freezed` for model generation, and `GetIt` for dependency injection. The architecture simplifies handling REST API interactions using generic and reusable services.

## Features

- **Reusable API Service**: Flexible CRUD operations for any model type.
- **Dependency Injection**: Simplified service management with `GetIt`.
- **Model Serialization**: JSON-compatible models powered by `Freezed`.
- **Extensibility**: Easy to integrate new resources by adding models and endpoints.

## Usage

- Define your models by extending the `JsonConvertibleModel` interface.
- Register services in the `injection_container.dart` file.
- Use the `ResourceApiService` for CRUD operations in your app.

## Project Structure

- **`api_service.dart`**: Core service for API requests.
- **`models/`**: Contains Freezed-generated data models.
- **`core/`**: Includes dependency injection and reusable components.
- **`main.dart`**: Entry point demonstrating API usage with examples.

## Getting Started

1. Clone this repository.
2. Run `flutter pub get` to fetch dependencies.
3. Explore `main.dart` for API examples using `ResourceApiService`.

## Requirements

- Dart 3.0+s
- Flutter 3.0+
- Dependencies: `dio`, `freezed`, `get_it`
