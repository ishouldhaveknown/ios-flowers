//
//  FlowerDetailsUseCase.swift
//  Flowers
//
//  Created by Tomi on 11.07.24.
//

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
