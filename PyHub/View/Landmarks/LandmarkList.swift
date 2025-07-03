//
//  LandmarkList.swift
//  PyHub
//
//  Created by Дмитрий Поповский on 2025-01-28.
//

import SwiftUI

struct LandmarkList: View {
    @Environment(ModelData.self) var modelData
    @Environment(AuthenticationManager.self) var authManager
    @State private var showFavoritesOnly = false
    
    var filteredLandmarks: [Landmark] {
        modelData.landmarks.filter { landmark in (!showFavoritesOnly || landmark.isFavorite) }
    }
    
    var body: some View {
        NavigationSplitView {
            List {
                if let user = authManager.currentUser {
                    VStack(alignment: .leading) {
                        Text("Welcome, \(user.username)!")
                            .font(.headline)
                        Text("Explore amazing landmarks")
                            .font(.caption)
                            .foregroundStyle(.secondary)
                    }
                    .padding(.vertical, 5)
                }
                
                Toggle(isOn: $showFavoritesOnly) {
                    Text("Favorites only")
                }
                ForEach(filteredLandmarks) { landmark in
                    NavigationLink {
                        LandmarkDetail(landmark: landmark)
                    } label: {
                        LandmarkRow(landmark: landmark)
                    }
                }
            }
            .animation(.default, value: filteredLandmarks)
            .navigationTitle(Text("Landmarks"))
        } detail: {
            Text("Select a Landmark")
        }
    }
}

#Preview {
    LandmarkList().environment(ModelData())
}
