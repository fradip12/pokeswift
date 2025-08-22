# 🐾 Pokédex SwiftUI

A simple **Pokédex application** built with **SwiftUI**.  
This project is for **learning purposes**, focusing on practicing:

- Swift language fundamentals  
- Clean Architecture principles  
- Core Data for local persistence  
- Layered separation: **Core – Data – Domain – Presentation**  

---

## 📂 Project Structure

The project follows a **Clean Architecture** style:

```
pokeswift/
 ├── Core/                # Common utilities, helpers, constants
 ├── Data/                # Data sources, API services, Core Data implementations
 ├── Domain/              # Entities, repositories, use cases (business logic)
 ├── Presentation/        # SwiftUI Views, ViewModels, UI state management
 └── Resources/           # Assets, localization, app configuration
```

---

## ✨ Features

- 📋 List of Pokémon with images and basic info  
- 🔄 Pagination with load more functionality  
- 📖 Detail screen with Pokémon information  
- 💾 Offline support with **Core Data**  
- 🧩 Modularized into layers for better testability and scalability  

---

## 🛠️ Tech Stack

- **Swift 5**  
- **SwiftUI** for UI layer  
- **Combine** for reactive state management  
- **Core Data** for local persistence  
- **Clean Architecture** (Domain-driven design)

---

## 🚀 Getting Started

1. Clone the repository
   ```bash
   git clone https://github.com/your-username/pokeswift.git
   cd pokeswift
   ```
2. Open the project in **Xcode**  
3. Run the project on **iOS Simulator** or a physical device  

---

## 🏛️ Clean Architecture Flow

This project applies a **layered clean architecture**:

- **Domain Layer**  
  - Contains **entities** and **use cases**  
  - Pure business logic, independent from frameworks  

- **Data Layer**  
  - Implements repositories defined in the Domain layer  
  - Handles API calls and local persistence (Core Data)  

- **Presentation Layer**  
  - SwiftUI views and **ViewModels** (state management)  
  - Depends on the Domain layer to execute use cases  

- **Core Layer**  
  - Shared utilities, constants, and helpers used across modules  

---

## 📚 Learning Goals

- Understand how to structure an iOS app with **Clean Architecture**  
- Explore **SwiftUI** for building modern declarative UIs  
- Learn how to integrate **Core Data** with domain and presentation layers  
- Practice separation of concerns for maintainable code  

---

## 📝 License

This project is for **educational purposes only** and is not affiliated with or endorsed by Nintendo, Game Freak, or The Pokémon Company.
