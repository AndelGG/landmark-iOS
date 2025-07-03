//
//  PyHubApp.swift
//  PyHub
//
//  Created by Дмитрий Поповский on 2024-12-06.
//

import SwiftUI

@main
struct PyHubApp: App {
    @State private var modelData = ModelData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(modelData)
        }
    }
}
