//
//  Screenshot.swift
//  SuiEaselAR
//
//  Created by Marcus Arnett on 9/8/23.
//

import Foundation

class Screenshot: Identifiable {
    let id = UUID().uuidString
    let imageURL: String

    init(imageURL: String) {
        self.imageURL = imageURL
    }
}
