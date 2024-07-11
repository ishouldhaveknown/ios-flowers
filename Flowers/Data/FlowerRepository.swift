//
//  FlowerRepository.swift
//  Flowers
//
//  Created by Tomi on 11.07.24.
//

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
