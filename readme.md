# Feature Modules in iOS

In modern iOS development, organizing code into feature modules can greatly enhance the reusability and maintainability of your app. This article will guide you through creating feature modules using a simple example: FlowerList and FlowerDetails features. We will explore the main layers in an iOS project: View, ViewModel, Use Case, Repository, and Service, and implement async/await for service calls.

[This is the source repository of my related article on DEV.to](https://dev.to/ishouldhaveknown/feature-modules-in-ios-1h86).

## Main Layers in iOS Development Projects

1. **View**: Handles the UI components and user interactions.
2. **ViewModel**: Acts as an intermediary between the View and the Use Case, managing UI-related data.
3. **Use Case**: Encapsulates the business logic of a particular feature.
4. **Repository**: Manages data operations and acts as a single source of truth.
5. **Service**: Handles network or database operations.

## Shared data manipulation layer

1. **FlowerRepository**

```swift
import Foundation

protocol FlowerRepository {

    func getFlowers() async -> [Flower]
    func getFlowerDetails(id: Int) async -> Flower
}

class FlowerRepositoryImpl: FlowerRepository {

    private let flowerService: FlowerService

    init(flowerService: FlowerService) {
        self.flowerService = flowerService
    }

    func getFlowers() async -> [Flower] {
        await flowerService.fetchFlowers()
    }

    func getFlowerDetails(id: Int) async -> Flower {
        await flowerService.fetchFlowerDetails(id: id)
    }
}
```

2. **FlowerService Protocol and Implementation**

```swift
protocol FlowerService {

    func fetchFlowers() async -> [Flower]
    func fetchFlowerDetails(id: Int) async -> Flower
}

class FlowerServiceImpl: FlowerService {

    func fetchFlowers() async -> [Flower] {
        /// Simulating network call
        [Flower(id: 1, name: "Rose"), Flower(id: 2, name: "Tulip")]
    }

    func fetchFlowerDetails(id: Int) async -> Flower {
        /// Simulating network call
        Flower(id: id, name: "Random flower", description: "A beautiful flower")
    }
}
```

## Creating Feature Modules

### FlowerList Feature

1. **FlowerListView**

```swift
import SwiftUI

struct FlowerListView: View {

    @StateObject var viewModel: FlowerListViewModel

    var body: some View {
        NavigationStack {
            List(viewModel.flowers) { flower in
                NavigationLink {
                    Assembler.default.flowerDetailsView(id: flower.id)
                } label: {
                    Text(flower.name)
                }
            }
            .onAppear {
                Task {
                    await viewModel.fetchFlowers()
                }
            }
        }
    }
}
```

2. **FlowerListViewModel**

```swift
import Combine

class FlowerListViewModel: ObservableObject {

    @Published var flowers: [Flower] = []

    private let flowerListUseCase: FlowerListUseCase

    init(flowerListUseCase: FlowerListUseCase) {
        self.flowerListUseCase = flowerListUseCase
    }

    @MainActor
    func fetchFlowers() async {
        flowers = await flowerListUseCase.getFlowers()
    }
}
```

3. **FlowerListUseCase**

```swift
import Foundation

protocol FlowerListUseCase {

    func getFlowers() async -> [Flower]
}

class FlowerListUseCaseImpl: FlowerListUseCase {

    private let flowerRepository: FlowerRepository

    init(flowerRepository: FlowerRepository) {
        self.flowerRepository = flowerRepository
    }

    func getFlowers() async -> [Flower] {
        await flowerRepository.getFlowers()
    }
}
```

### FlowerDetails Feature

1. **FlowerDetailsView**

```swift
import SwiftUI

struct FlowerDetailsView: View {

    @StateObject var viewModel: FlowerDetailsViewModel

    let id: Int

    var body: some View {
        VStack {
            if let flower = viewModel.flower {
                Text("\(flower.id)")
                Text(flower.name)
                Text(flower.description ?? "")
            }
        }
        .onAppear {
            Task {
                await viewModel.fetchFlowerDetails(id: id)
            }
        }
    }
}
```

2. **FlowerDetailsViewModel**

```swift
import Combine

class FlowerDetailsViewModel: ObservableObject {

    @Published var flower: Flower?

    private let flowerDetailsUseCase: FlowerDetailsUseCase

    init(flowerDetailsUseCase: FlowerDetailsUseCase) {
        self.flowerDetailsUseCase = flowerDetailsUseCase
    }

    @MainActor
    func fetchFlowerDetails(id: Int) async {
        flower = await flowerDetailsUseCase.getFlowerDetails(id: id)
    }
}
```

3. **FlowerDetailsUseCase**

```swift
protocol FlowerDetailsUseCase {

    func getFlowerDetails(id: Int) async -> Flower
}

class FlowerDetailsUseCaseImpl: FlowerDetailsUseCase {

    private let flowerRepository: FlowerRepository

    init(flowerRepository: FlowerRepository) {
        self.flowerRepository = flowerRepository
    }

    func getFlowerDetails(id: Int) async -> Flower {
        await flowerRepository.getFlowerDetails(id: id)
    }
}
```

## Conclusion

By organizing your iOS project into feature modules with distinct layers (View, ViewModel, Use Case, Repository, and Service), you create a clean and maintainable codebase. The FlowerList and FlowerDetails features demonstrate how to keep related business logic within their respective modules, ensuring reusability and separation of concerns. Using async/await for service calls modernizes the code, making it more efficient and easier to read.
