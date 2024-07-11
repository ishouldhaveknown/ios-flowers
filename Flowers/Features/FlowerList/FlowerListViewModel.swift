//
//  FlowerListViewModel.swift
//  Flowers
//
//  Created by Tomi on 11.07.24.
//

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
