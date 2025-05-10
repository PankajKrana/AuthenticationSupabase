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
                Text("LogOut View")
            } else {
                Text("Login View")
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
