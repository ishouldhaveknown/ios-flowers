//
//  FlowerRepositoryTests.swift
//  FlowersTests
//
//  Created by Tomi on 11.07.24.
//

import XCTest
@testable import Flowers

class FlowerRepositoryTests: XCTestCase {

    var flowerRepository: FlowerRepository!
    var mockFlowerService: MockFlowerService!

    override func setUp() {
        super.setUp()
        mockFlowerService = MockFlowerService()
        flowerRepository = FlowerRepositoryImpl(flowerService: mockFlowerService)
    }

    override func tearDown() {
        flowerRepository = nil
        mockFlowerService = nil
        super.tearDown()
    }

    func testGetFlowers() async {
        let flowers = await flowerRepository.getFlowers()
        XCTAssertEqual(flowers.count, 2)
        XCTAssertEqual(flowers[0].name, "Mock Rose")
        XCTAssertEqual(flowers[1].name, "Mock Tulip")
    }

    func testGetFlowerDetails() async {
        let flower = await flowerRepository.getFlowerDetails(id: 1)
        XCTAssertEqual(flower.id, 1)
        XCTAssertEqual(flower.name, "Mock Flower")
        XCTAssertEqual(flower.description, "Mock Description")
    }
}

class MockFlowerService: FlowerService {

    func fetchFlowers() async -> [Flower] {
        [Flower(id: 1, name: "Mock Rose"), Flower(id: 2, name: "Mock Tulip")]
    }

    func fetchFlowerDetails(id: Int) async -> Flower {
        Flower(id: id, name: "Mock Flower", description: "Mock Description")
    }
}
