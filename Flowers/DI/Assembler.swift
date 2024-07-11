//
//  Assembler.swift
//  Flowers
//
//  Created by Tomi on 11.07.24.
//

import Foundation

struct Assembler {

    static let `default` = Assembler()

    var flowerRepository: FlowerRepository {
        FlowerRepositoryImpl(flowerService: flowerService)
    }

    var flowerService: FlowerService {
        FlowerServiceImpl()
    }
}
