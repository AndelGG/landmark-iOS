//
//  AuthenticationManager.swift
//  PyHub
//
//  Created by Copilot on 2025-01-30.
//

import Foundation

@Observable
class AuthenticationManager {
    private(set) var currentUser: User?
    private(set) var isAuthenticated = false
    
    // Simple in-memory storage for demo purposes
    private var registeredUsers: [String: String] = [
        "demo@example.com": "password123"
    ]
    
    func login(email: String, password: String) -> Bool {
        if let storedPassword = registeredUsers[email], storedPassword == password {
            currentUser = User(username: email.components(separatedBy: "@")[0], email: email)
            isAuthenticated = true
            return true
        }
        return false
    }
    
    func register(email: String, password: String) -> Bool {
        guard !email.isEmpty, !password.isEmpty, password.count >= 6 else {
            return false
        }
        
        // Check if user already exists
        if registeredUsers[email] != nil {
            return false
        }
        
        registeredUsers[email] = password
        currentUser = User(username: email.components(separatedBy: "@")[0], email: email)
        isAuthenticated = true
        return true
    }
    
    func logout() {
        currentUser = nil
        isAuthenticated = false
    }
}