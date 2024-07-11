//
//  FlowerListView.swift
//  Flowers
//
//  Created by Tomi on 11.07.24.
//

import SwiftUI

struct FlowerListView: View {

    @StateObject var viewModel: FlowerListViewModel

    var body: some View {
        NavigationStack {
            List(viewModel.flowers) { flower in
                NavigationLink {
                    Assembler.default.flowerDetailsView(id: flower.id)
                } label: {
                    Text(flower.name)
                }
            }
            .onAppear {
                Task {
                    await viewModel.fetchFlowers()
                }
            }
        }
    }
}
