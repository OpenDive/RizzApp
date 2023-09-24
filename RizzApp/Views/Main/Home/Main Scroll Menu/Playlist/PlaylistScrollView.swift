//
//  PlaylistScrollView.swift
//  RizzApp
//
//  Created by Marcus Arnett on 9/23/23.
//

import SwiftUI

struct PlaylistScrollView: View {
    let nfts: [String]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(nfts, id:\.self) { nft in
                    Image(nft)
                        .resizable()
                        .scaledToFit()
                        .clipShape(RoundedRectangle(cornerRadius: 12.0))
                        .frame(width: 110, height: 110)
                }
            }
            .padding(.bottom)
            .padding(.horizontal, 22)
        }
        .mask {
            RoundedRectangle(cornerRadius: 12.0)
                .frame(width: UIScreen.main.bounds.width - 20, height: 200)
        }
    }
}

#Preview {
    PlaylistScrollView(nfts: RizzOnboarding.discover[0].NFTs)
}
