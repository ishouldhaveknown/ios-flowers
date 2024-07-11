//
//  Flower.swift
//  Flowers
//
//  Created by Tomi on 11.07.24.
//

import Foundation

struct Flower: Identifiable {

    var id: Int
    let name: String
    let description: String?

    init(id: Int, name: String, description: String? = nil) {
        self.id = id
        self.name = name
        self.description = description
    }
}
