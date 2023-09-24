//
//  MasonryCardView.swift
//  RizzApp
//
//  Created by Marcus Arnett on 9/23/23.
//

import SwiftUI

struct MasonryCardView: View {
    let nft: NonFungibleTokens
    
    var body: some View {
        if let url = URL(string: nft.image) {
            AsyncImage(url: url) { image in
                image.image?.resizable().scaledToFit()
            }
                .clipShape(RoundedRectangle(cornerRadius: 12.0))
                .frame(maxWidth: 185, maxHeight: 350)
        } else {
            RoundedRectangle(cornerRadius: 12.0)
                .foregroundStyle(RizzColors.rizzGray)
                .frame(maxWidth: 185, maxHeight: 350)
        }
    }
}

//
//#Preview {
//    MasonryCardView(image: "CoolCat1")
//}
