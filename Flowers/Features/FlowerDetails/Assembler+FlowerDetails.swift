//
//  Assembler+FlowerDetails.swift
//  Flowers
//
//  Created by Tomi on 11.07.24.
//

import Foundation

extension Assembler {

    func flowerDetailsView(id: Int) -> FlowerDetailsView {
        let useCase = FlowerDetailsUseCaseImpl(flowerRepository: flowerRepository)
        let viewModel = FlowerDetailsViewModel(flowerDetailsUseCase: useCase)
        return FlowerDetailsView(viewModel: viewModel, id: id)
    }
}
