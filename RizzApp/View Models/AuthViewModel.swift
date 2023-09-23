//
//  AuthViewModel.swift
//  RizzApp
//
//  Created by Marcus Arnett on 9/23/23.
//

import Foundation
import SwiftUI

class AuthViewModel: ObservableObject {
    static let instance: AuthViewModel = AuthViewModel()
    
    private init() { }
    
    @Published var hasConnectedWallet: Bool = false
    
    func connectWallet() async {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) { [weak self] in
            guard let self = self else { return }
            self.hasConnectedWallet = true
        }
    }
}
