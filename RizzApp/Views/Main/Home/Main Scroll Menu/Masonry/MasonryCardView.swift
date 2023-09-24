//
//  MasonryCardView.swift
//  RizzApp
//
//  Created by Marcus Arnett on 9/23/23.
//

import SwiftUI

struct MasonryCardView: View {
    let image: String
    
    var body: some View {
        Image(image)
            .resizable()
            .scaledToFit()
            .frame(maxWidth: 185, maxHeight: 350)
    }
}

#Preview {
    MasonryCardView(image: "CoolCat1")
}
