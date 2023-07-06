# 🖼️ Flutter Web

A showcase of my journey diving into the capabilities of Flutter Web, transforming my ideas into this interactive portfolio. Designed and built as an experimental endeavour, this portfolio reflects the growth and underlines the adaptability and robust features of Flutter Web.

## Table of Contents

- [🏗️ Architecture](#-architecture)
- [🔧 Technical Stack](#-technical-stack)
- [🚀 Getting Started](#-getting-started)
- [🧪  Unit Testing](#-unit-testing)
- [🤝 Contributing](#-contributing)
- [📝 License](#-license)
  
![1](https://github.com/freemantg/freeman_portfolio/assets/35115094/5d21ac73-948c-4d12-ac8b-eb83d9484158)
![2](https://github.com/freemantg/freeman_portfolio/assets/35115094/7f98dce9-8c8a-4bcc-890b-d6f71f78d5a4)
![3](https://github.com/freemantg/freeman_portfolio/assets/35115094/92bac170-237f-481f-88b6-9c45464cab6e)
![4](https://github.com/freemantg/freeman_portfolio/assets/35115094/104e1ec7-f289-4cb6-a70e-b353c91975b9)
![5](https://github.com/freemantg/freeman_portfolio/assets/35115094/85d730b9-9efb-4266-864f-4ecd1f89f967)

## 🏗️ Architecture

This portfolio follows principles from Domain-Driven Design (DDD) and Clean Architecture, resulting in a layered architectural style:

- **Presentation Layer**: This layer contains all the user interface components and user interactions. It communicates with the Application layer for action responses to user inputs.

- **Application Layer**: This layer works as the intermediary of the portfolio, taking user actions from the Presentation layer and directing them to the appropriate services in the Domain layer.

- **Domain Layer**: Encapsulating all the business logic. It includes the models and business rules for inspirations and tags.

- **Infrastructure Layer**: This layer is responsible for all data operations, managing data storage and retrieval through APIs and databases. It uses Dartz's `Either` type for robust error handling during data operations.


The use of Dartz `Either` type for error handling allows us to wrap computations that can potentially fail, making the system more robust and easier to debug.

## 🔧 Technical Stack

This portfolio is crafted using the following technology stack:

### Frontend:

- **Flutter:** A UI toolkit from Google for building natively compiled applications for mobile, web, and desktop from a single codebase.
- **Flutter Hooks:** A collection of utilities for managing state and other aspects of Flutter applications.
- **Riverpod:** For global state management.
- **Auto Route:** An easy yet powerful routing solution, that allows for complex route patterns and transitions.

### Backend:

- **Freezed:** A code generator for unions/pattern-matching/copy in Dart.
- **URL Launcher:** A Flutter plugin for launching URLs in the mobile platform.
- **Other Libraries:** adaptive_components, cupertino_icons, font_awesome_flutter and more.

## 🚀 Getting Started

1. Make sure you have [Flutter installed](https://flutter.dev/docs/get-started/install) on your local machine.
2. Clone the repository with `git clone https://github.com/freemantg/freeman_portfolio.git`.
3. Run `flutter packages get` in the root directory to fetch the project dependencies.
4. Finally, execute `flutter run` to run the project on your device/emulator.

## 🧪 Unit Testing

This project places a high priority on software quality and maintainability. As a result, extensive unit testing to ensure the software's robustness and reliability, with tests covering all major components of the application is used.

The project employs the `flutter_test` package for unit and widget tests, `mockito` for creating mocks in tests, and `ProviderContainer` for thoroughly testing the StateNotifiers to ensure that the app state is managed correctly.

To run the tests, simply execute the following command in the project root:

`Flutter Test`

## Contributing 🤝

We welcome contributions from the community. If you wish to contribute, please take a look at our contributing guidelines.

## License 📄

This portfolio is licensed under the MIT License. See `LICENSE` for more information.

## Contact 📞

If you have any questions or suggestions, please reach out to us at <hello@freemantang.dev>. We'd love to hear from you!
