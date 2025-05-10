//
//  Demo_subperbaseApp.swift
//  Demo-subperbase
//
//  Created by Pankaj Kumar Rana on 5/9/25.
//

import SwiftUI
//import Supabase

@main
struct Demo_subperbaseApp: App {
    @State private var authManager = Authmanager()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(authManager)
        }
    }
}
