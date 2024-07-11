//
//  FlowerService.swift
//  Flowers
//
//  Created by Tomi on 11.07.24.
//

import Foundation

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
