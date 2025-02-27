# Flutter App Challenge for The Ksquare Group

This Flutter app was developed as part of a technical challenge for a **Flutter Developer** role at **The Ksquare Group**. The app demonstrates expertise in **MVVM architecture**, **Clean Architecture principles**, **dependency injection**, and **advanced Flutter concepts**.

## Architecture & State Management

- **MVVM with Clean Architecture**: The app follows a modular architecture, separating concerns into data, domain, and presentation layers.
- **Dependency Injection**: Uses `get_it` and `injectable` for better scalability and testability.
- **State Management**: Utilizes **Flutter Bloc**, focusing on the **Cubit** approach for lightweight state management.
- **Unit Testing**: A set of test cases has been implemented for a specific Bloc in the **"Pokemon Details"** feature.

## Routing System

The app uses **GoRouter** for managing navigation. A **custom routing system** has been implemented, featuring:

- A **Bottom Navigation Bar with two tabs**, each maintaining its own navigation stack.
- **Independent navigation stacks per tab**, meaning users can navigate within one tab, switch to another, and return to the first tab without losing its navigation history.

## Features

- **Pokémon API Integration**: Fetches Pokémon data using the [PokeAPI](https://pokeapi.co/).
- **Pagination Support**: Efficiently loads Pokémon list data in a paginated manner.
- **Detailed Pokémon View**: When selecting a Pokémon, the user navigates to a detailed page displaying:
    - Name
    - Height & Weight
    - Stats (e.g., Attack, Defense, Speed)
    - Other relevant attributes

This app effectively showcases **Flutter best practices**, **modern state management**, and **clean navigation strategies**, making it a well-structured and scalable solution.

---

## Dependencies

The project uses the following dependencies:

### Core Dependencies

```yaml
dependencies:
  flutter:
    sdk: flutter

  cached_network_image: ^3.4.1
  dio: ^5.8.0+1
  injectable: ^2.5.0
  internet_connection_checker_plus: ^2.7.0
  flutter_bloc: ^9.0.0
  flutter_gen: ^5.9.0
  flutter_svg: ^2.0.17
  fpdart: ^1.1.1
  get_it: ^8.0.3
  go_router: ^14.8.0
  safe_extensions: ^1.1.0

dev_dependencies:
  flutter_test:
    sdk: flutter

  bloc_test: ^10.0.0
  build_runner: ^2.4.15
  injectable_generator: ^2.7.0
  flutter_gen_runner: ^5.9.0
  flutter_lints: ^5.0.0
  mockito: ^5.4.5
```
