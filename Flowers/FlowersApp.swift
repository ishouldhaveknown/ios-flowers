//
//  FlowersApp.swift
//  Flowers
//
//  Created by Tomi on 11.07.24.
//

import SwiftUI

@main
struct FlowersApp: App {
    var body: some Scene {
        WindowGroup {
            Assembler.default.flowerListView
        }
    }
}
