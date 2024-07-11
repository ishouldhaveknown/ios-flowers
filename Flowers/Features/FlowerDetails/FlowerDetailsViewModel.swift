//
//  FlowerDetailsViewModel.swift
//  Flowers
//
//  Created by Tomi on 11.07.24.
//

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
