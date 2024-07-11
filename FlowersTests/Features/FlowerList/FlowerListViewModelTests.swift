//
//  FlowerListViewModelTests.swift
//  FlowersTests
//
//  Created by Tomi on 11.07.24.
//

import XCTest
import Combine
@testable import Flowers

class FlowerListViewModelTests: XCTestCase {

    var viewModel: FlowerListViewModel!
    var mockFlowerListUseCase: MockFlowerListUseCase!

    override func setUp() {
        super.setUp()
        mockFlowerListUseCase = MockFlowerListUseCase()
        viewModel = FlowerListViewModel(flowerListUseCase: mockFlowerListUseCase)
    }

    override func tearDown() {
        viewModel = nil
        mockFlowerListUseCase = nil
        super.tearDown()
    }

    func testFetchFlowers() async {
        await viewModel.fetchFlowers()
        XCTAssertEqual(viewModel.flowers.count, 2)
        XCTAssertEqual(viewModel.flowers[0].name, "Mock Rose")
        XCTAssertEqual(viewModel.flowers[1].name, "Mock Tulip")
    }
}

class MockFlowerListUseCase: FlowerListUseCase {

    func getFlowers() async -> [Flower] {
        [Flower(id: 1, name: "Mock Rose"), Flower(id: 2, name: "Mock Tulip")]
    }
}
