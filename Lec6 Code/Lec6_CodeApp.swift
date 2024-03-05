//
//  Lec6_CodeApp.swift
//  Lec6 Code
//
//  Created by Jordan H on 2/22/24.
//

import SwiftUI

@main
struct Lec6_CodeApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        #if os(visionOS)
        .windowStyle(.plain)
        #endif
    }
}
