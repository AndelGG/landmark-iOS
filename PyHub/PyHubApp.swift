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
    @State private var authManager = AuthenticationManager()
    
    var body: some Scene {
        WindowGroup {
            Group {
                if authManager.isAuthenticated {
                    AuthenticatedView()
                        .environment(modelData)
                } else {
                    LoginView()
                }
            }
            .environment(authManager)
        }
    }
}
