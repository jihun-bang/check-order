# Tablet Order App & Web

This is an order-checking application built with Flutter. The project adopts **Clean Architecture** and the **MVVM (Model-View-ViewModel)** pattern to create a modern and scalable application. State management is handled by **Riverpod**, with extensive use of code generation to maximize productivity and type safety.

## 🏛️ Tech Stack & Architecture

This project is designed with a combination of design patterns and libraries to enhance maintainability and scalability.

### 1. Clean Architecture
Following the principle of separation of concerns, the project is structured into three core layers: **Presentation, Domain, and Data**. This clearly separates business logic from the UI, allowing each layer to be developed and tested independently.

-   **Presentation**: Handles the UI and state management (View, ViewModel).
-   **Domain**: Contains pure business logic (UseCase, Entity, Repository Interface).
-   **Data**: Manages communication with data sources (network, local DB) through repository implementations and data sources.

### 2. MVVM Pattern
Within the Presentation layer, the **MVVM (Model-View-ViewModel)** pattern is applied.
-   **View**: Renders the UI and forwards user input to the ViewModel.
-   **ViewModel**: Manages the data and state required by the View, invoking business logic (UseCases) to update the UI. Riverpod's `Notifier` fulfills this role.
-   **Model**: Corresponds to the Entity in the Domain layer and defines the data structure.

### 3. State Management
**Riverpod** is used as the core state management solution for the project.
-   It enables writing **type-safe** and concise code using `riverpod_generator` and `hooks_riverpod`.
-   It implements the ViewModel using `NotifierProvider` to efficiently manage complex state logic.

### 4. Dependency Injection
Dependencies between components are managed using **Injectable** and **GetIt**. This reduces coupling, creating a flexible and easily testable codebase.

### 5. Backend & Database
**Firebase** is used as the primary backend service.
-   **Firestore ODM (Object Data Mapper)**: Securely maps Firestore data to statically-typed Dart objects using `cloud_firestore_odm`. This reduces errors during data processing.
-   **Firebase Core**: Includes the basic setup for connecting the app to a Firebase project.

---

## 📦 Key Packages Used

The following is a list of the core libraries used in this project.

| Category | Package Name | Description |
| :--- | :--- | :--- |
| **State Management**| `flutter_riverpod`, `hooks_riverpod` | Declarative and reactive state management. |
| | `riverpod_annotation`, `riverpod_generator` | Riverpod code generation and boilerplate reduction. |
| **Architecture** | `injectable`, `get_it` | Dependency Injection (DI) container. |
| | `dartz` | Provides functional programming concepts like `Either` for error handling. |
| **Data Models** | `freezed`, `json_serializable` | Immutable objects and JSON serialization/deserialization. |
| **Networking** | `dio` | A powerful HTTP client for non-Firebase API communication. |
| **Database** | `cloud_firestore`, `cloud_firestore_odm` | Firebase Firestore integration and type-safe ODM. |
| **Routing** | `go_router`, `go_router_builder` | URL-based declarative navigation. |
| **Security/Storage**| `flutter_secure_storage`, `shared_preferences`| Secure storage and simple key-value data storage. |
| **UI** | `cached_network_image`, `flutter_svg` | Caching network images and displaying SVG assets. |

---

## 🚀 Getting Started

### Prerequisites
-   Flutter SDK (version 3.1.2 or later)
-   A configured Firebase project and the `firebase_options.dart` file.

### Installation & Setup

1.  **Clone the repository**
    ```bash
    git clone https://github.com/jihun-bang/tablet_order_app.git
    cd tablet_order_app
    ```
2.  **Install packages**
    ```bash
    flutter pub get
    ```
3.  **Run code generator**
    This project uses `build_runner` to generate necessary files. Run the following command to generate the code:
    ```bash
    dart run build_runner build --delete-conflicting-outputs
    ```
4.  **Run the app**
    ```bash
    flutter run
    ```
