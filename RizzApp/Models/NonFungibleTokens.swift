//
//  NonFungibleTokens.swift
//  RizzApp
//
//  Created by Marcus Arnett on 9/24/23.
//

import Foundation
import UIKit

struct NonFungibleTokens: Identifiable {
    let name: String
    let collectionName: String
    let description: String
    let properties: [String: String]
    let image: String
    let asset: Data?
    let tokenId: Int
    let id = UUID().uuidString
}
