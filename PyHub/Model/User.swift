//
//  User.swift
//  PyHub
//
//  Created by Copilot on 2025-01-30.
//

import Foundation

struct User: Codable, Identifiable {
    let id: UUID
    let username: String
    let email: String
    
    init(username: String, email: String) {
        self.id = UUID()
        self.username = username
        self.email = email
    }
}