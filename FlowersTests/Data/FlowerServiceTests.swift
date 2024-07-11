//
//  FlowerServiceTests.swift
//  FlowersTests
//
//  Created by Tomi on 11.07.24.
//

import XCTest
@testable import Flowers

class FlowerServiceTests: XCTestCase {

    var flowerService: FlowerService!

    override func setUp() {
        super.setUp()
        flowerService = FlowerServiceImpl()
    }

    override func tearDown() {
        flowerService = nil
        super.tearDown()
    }

    func testFetchFlowers() async {
        let flowers = await flowerService.fetchFlowers()
        XCTAssertEqual(flowers.count, 2)
        XCTAssertEqual(flowers[0].name, "Rose")
        XCTAssertEqual(flowers[1].name, "Tulip")
    }

    func testFetchFlowerDetails() async {
        let flower = await flowerService.fetchFlowerDetails(id: 1)
        XCTAssertEqual(flower.id, 1)
        XCTAssertEqual(flower.name, "Random flower")
        XCTAssertEqual(flower.description, "A beautiful flower")
    }
}
