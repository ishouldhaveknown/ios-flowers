//
//  FlowerListUseCase.swift
//  Flowers
//
//  Created by Tomi on 11.07.24.
//

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
