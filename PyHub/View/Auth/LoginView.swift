//
//  LoginView.swift
//  PyHub
//
//  Created by Copilot on 2025-01-30.
//

import SwiftUI

struct LoginView: View {
    @Environment(AuthenticationManager.self) private var authManager
    @State private var email = ""
    @State private var password = ""
    @State private var showingAlert = false
    @State private var alertMessage = ""
    @State private var isRegistering = false
    
    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "person.circle.fill")
                .font(.system(size: 80))
                .foregroundStyle(.blue)
                .padding(.bottom, 20)
            
            Text(isRegistering ? "Create Account" : "Welcome Back")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            Text(isRegistering ? "Sign up to explore landmarks" : "Sign in to continue")
                .font(.body)
                .foregroundStyle(.secondary)
                .padding(.bottom, 20)
            
            VStack(spacing: 15) {
                TextField("Email", text: $email)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.emailAddress)
                    .autocapitalization(.none)
                
                SecureField("Password", text: $password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }
            .padding(.horizontal)
            
            Button(action: authenticateUser) {
                Text(isRegistering ? "Sign Up" : "Sign In")
                    .font(.headline)
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(10)
            }
            .padding(.horizontal)
            .disabled(email.isEmpty || password.isEmpty)
            
            Button(action: { isRegistering.toggle() }) {
                Text(isRegistering ? "Already have an account? Sign In" : "Don't have an account? Sign Up")
                    .font(.footnote)
                    .foregroundStyle(.blue)
            }
            .padding(.top, 10)
            
            Spacer()
        }
        .padding()
        .alert("Authentication Error", isPresented: $showingAlert) {
            Button("OK") { }
        } message: {
            Text(alertMessage)
        }
    }
    
    private func authenticateUser() {
        let success = isRegistering ? 
            authManager.register(email: email, password: password) :
            authManager.login(email: email, password: password)
        
        if !success {
            alertMessage = isRegistering ? 
                "Failed to create account. Email may already exist or password too short." :
                "Invalid email or password."
            showingAlert = true
        }
    }
}

#Preview {
    LoginView()
        .environment(AuthenticationManager())
}