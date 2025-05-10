//
//  Authmanager.swift
//  Demo-subperbase
//
//  Created by Pankaj Kumar Rana on 5/9/25.
//

import Foundation
import Observation

@Observable
@MainActor
class Authmanager{
    private let authService: SupabaseAuthService
    
    var currentUser: User?
    
    init(authService: SupabaseAuthService = SupabaseAuthService()) {
        self.authService = authService
    }
    
    func signUp(email: String, password: String) async {
        do {
            self.currentUser = try await authService.signUp(email: email, password: password)
        } catch {
           print("DEBUG: Error Sign up: \(error)")
        }
    }
    
    func signIn(email: String, password: String) async {
        do {
            self.currentUser = try await authService.signIn(email: email, password: password)
        } catch {
           print("DEBUG: Error Sign in: \(error)")
        }
    }
    
    func signOut() async {
        do {
            try await authService.signOut()
            currentUser = nil
        } catch {
           print("DEBUG: Error Signout: \(error)")
        }
    }

    func refreshUser() async {
        do {
            self.currentUser = try await authService.getCurrentUser()
        } catch {
            print("Refress user error \(error)")
            currentUser = nil
        }
    }
    
}
