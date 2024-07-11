//
//  Assembler+FlowerList.swift
//  Flowers
//
//  Created by Tomi on 11.07.24.
//

import Foundation

extension Assembler {

    var flowerListView: FlowerListView {
        let useCase = FlowerListUseCaseImpl(flowerRepository: flowerRepository)
        let viewModel = FlowerListViewModel(flowerListUseCase: useCase)
        return FlowerListView(viewModel: viewModel)
    }
}
