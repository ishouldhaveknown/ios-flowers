//
//  FlowerDetailsView.swift
//  Flowers
//
//  Created by Tomi on 11.07.24.
//

import SwiftUI

struct FlowerDetailsView: View {

    @StateObject var viewModel: FlowerDetailsViewModel

    let id: Int

    var body: some View {
        VStack {
            if let flower = viewModel.flower {
                Text("\(flower.id)")
                Text(flower.name)
                Text(flower.description ?? "")
            }
        }
        .onAppear {
            Task {
                await viewModel.fetchFlowerDetails(id: id)
            }
        }
    }
}
