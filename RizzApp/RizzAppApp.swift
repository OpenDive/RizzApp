//
//  RizAppApp.swift
//  RizApp
//
//  Created by Marcus Arnett on 9/22/23.
//

import SwiftUI

@main
struct RizzAppApp: App {
    @State private var isOnSplashscreen = true
    
    @StateObject var authViewModel = AuthViewModel.instance
    
    var body: some Scene {
        WindowGroup {
            if self.isOnSplashscreen {
                SplashScreenView()
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                            withAnimation {
                                self.isOnSplashscreen = false
                            }
                        }
                    }
            } else {
                if self.authViewModel.hasConnectedWallet {
                    EmptyView()
                } else {
                    PreviewFeaturesView()
                        .environmentObject(self.authViewModel)
                }
            }
        }
    }
}
