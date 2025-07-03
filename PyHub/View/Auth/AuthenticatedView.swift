//
//  AuthenticatedView.swift
//  PyHub
//
//  Created by Copilot on 2025-01-30.
//

import SwiftUI

struct AuthenticatedView: View {
    @Environment(AuthenticationManager.self) private var authManager
    @State private var selectedTab = 0
    
    var body: some View {
        TabView(selection: $selectedTab) {
            LandmarkList()
                .tabItem {
                    Image(systemName: "map")
                    Text("Landmarks")
                }
                .tag(0)
            
            ProfileView()
                .tabItem {
                    Image(systemName: "person.circle")
                    Text("Profile")
                }
                .tag(1)
        }
    }
}

struct ProfileView: View {
    @Environment(AuthenticationManager.self) private var authManager
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Image(systemName: "person.circle.fill")
                    .font(.system(size: 100))
                    .foregroundStyle(.blue)
                
                if let user = authManager.currentUser {
                    VStack(spacing: 10) {
                        Text(user.username)
                            .font(.title)
                            .fontWeight(.semibold)
                        
                        Text(user.email)
                            .font(.body)
                            .foregroundStyle(.secondary)
                    }
                }
                
                Button(action: authManager.logout) {
                    Text("Sign Out")
                        .font(.headline)
                        .foregroundStyle(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.red)
                        .cornerRadius(10)
                }
                .padding(.horizontal, 40)
                .padding(.top, 30)
                
                Spacer()
            }
            .padding()
            .navigationTitle("Profile")
        }
    }
}

#Preview {
    AuthenticatedView()
        .environment(AuthenticationManager())
        .environment(ModelData())
}