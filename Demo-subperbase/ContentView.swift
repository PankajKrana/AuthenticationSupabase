//
//  ContentView.swift
//  Demo-subperbase
//
//  Created by Pankaj Kumar Rana on 5/9/25.
//

import SwiftUI

struct ContentView: View {
    @Environment(Authmanager.self) private var authManager
    var body: some View {
        Group {
            if let currentUser = authManager.currentUser {
                VStack {
                    Text(currentUser.email)
                        .padding()
                    
                    Button{ Task { await authManager.signOut()} } label: {
                        Text("Sign Out")
                            .font(.headline)
                            .foregroundStyle(.white)
                            .background(Color(.systemBlue))
                            .cornerRadius(8)
                    }
                }

            } else {
                LoginView()
            }
        }
        .task {
            await authManager.refreshUser()
        }
    }
}

#Preview {
    ContentView()
        .environment(Authmanager())
}
