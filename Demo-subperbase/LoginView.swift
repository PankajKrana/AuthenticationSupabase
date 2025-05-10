//
//  LoginView.swift
//  Demo-subperbase
//
//  Created by Pankaj Kumar Rana on 5/9/25.
//

import SwiftUI

struct LoginView: View {
    @Environment(Authmanager.self) private var authManager
    
    @State private var email = " "
    @State private var password = " "
    
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                
                Image(.supabase)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150, height: 150)
                    .padding()
                
                VStack(spacing: 8) {
                    TextField("Enter your email", text: $email)
                        .autocapitalization(.none)
                        .font(.subheadline)
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(20)
                        .padding(.horizontal, 24)
                    
                    SecureField("Enter your password", text: $password)
                        .font(.subheadline)
                        .padding(12)
                        .background(Color(.systemGray6))
                        .cornerRadius(20)
                        .padding(.horizontal, 20)
                }
                Button { signIn() } label: {
                    Text("Login")
                        .font(.headline)
                        .foregroundStyle(.black)
                        .frame(width: 352, height: 44)
                        .background(Color(.systemGreen))
                        .cornerRadius(20)
                }
                .disabled(!formIsValid)
                .opacity(formIsValid ? 1.0: 0.5)
                .padding(.vertical)
                
                Spacer()
                
                Divider()
                
                NavigationLink {
                    RegistratonView()
                        .navigationBarBackButtonHidden()
                } label: {
                    HStack(spacing: 3) {
                        Text("Don't have an account")
                        
                        Text("Sign Up")
                            .fontWeight(.semibold)
                    }
                    .font(.subheadline)
                }
                .padding(.horizontal, 16)
            }
        }
    }
}

private extension LoginView {
    func signIn() {
        Task { await authManager.signIn(email: email, password: password)}
    }
    
    var formIsValid: Bool {
        return email.isValid() && !password.isEmpty
    }
}

extension String {
    func isValid() -> Bool {
        return range(of: "@", options: .literal, range: nil, locale: nil) != nil
    }
}

#Preview {
    LoginView()
        .environment(Authmanager())
}
