//
//  Constants.swift
//  RizApp
//
//  Created by Marcus Arnett on 9/22/23.
//

import Foundation
import SwiftUI

struct RizzColors {
    static let rizzPink = Color("RizzPink")
    static let rizzBlue = Color("RizzBlue")
    static let rizzBlack = Color("RizzBlack")
    static let rizzWhite = Color("RizzWhite")
    static let rizzGray = Color("RizzGray")
    static let rizzLightGray = Color("RizzLightGray")
}

struct RizzOnboarding {
    static let features: [FeatureItem] = [
        FeatureItem(
            icon: "Wallet",
            title: "Not another boring wallet",
            description: "Non-Fungible Network for Non-Fungible people. A social wallet with UX for creating, sharing, and showcasing static dynamic NFTs."
        ),
        FeatureItem(
            icon: "Tech",
            title: "Web3 at its core",
            description: "Interconnected, integrated, end to end experience. Created for artists, collectors and patrons.\n"
        ),
        FeatureItem(
            icon: "Connected",
            title: "Powered by DApps",
            description: "Immersive and engaging NFT experiences, Integrated blockchain technology, increase in utility across the platform."
        ),
        FeatureItem(
            icon: "Logo",
            title: "Track any Wallet",
            description: "Sign in below using WalletConnect."
        )
    ]
}

struct FeatureItem: Hashable, Identifiable {
    let icon: String
    let title: String
    let description: String
    
    var id: String {
        return "\(self.icon)-\(self.title)-\(self.description)"
    }
}
