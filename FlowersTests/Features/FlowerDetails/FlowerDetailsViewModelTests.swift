//
//  FlowerDetailsViewModelTests.swift
//  FlowersTests
//
//  Created by Tomi on 11.07.24.
//

import XCTest
import Combine
@testable import Flowers

class FlowerDetailsViewModelTests: XCTestCase {

    var viewModel: FlowerDetailsViewModel!
    var mockFlowerDetailsUseCase: MockFlowerDetailsUseCase!

    override func setUp() {
        super.setUp()
        mockFlowerDetailsUseCase = MockFlowerDetailsUseCase()
        viewModel = FlowerDetailsViewModel(flowerDetailsUseCase: mockFlowerDetailsUseCase)
    }

    override func tearDown() {
        viewModel = nil
        mockFlowerDetailsUseCase = nil
        super.tearDown()
    }

    func testFetchFlowerDetails() async {
        await viewModel.fetchFlowerDetails(id: 1)
        XCTAssertNotNil(viewModel.flower)
        XCTAssertEqual(viewModel.flower?.id, 1)
        XCTAssertEqual(viewModel.flower?.name, "Mock Flower")
        XCTAssertEqual(viewModel.flower?.description, "Mock Description")
    }
}

class MockFlowerDetailsUseCase: FlowerDetailsUseCase {

    func getFlowerDetails(id: Int) async -> Flower {
        Flower(id: id, name: "Mock Flower", description: "Mock Description")
    }
}
