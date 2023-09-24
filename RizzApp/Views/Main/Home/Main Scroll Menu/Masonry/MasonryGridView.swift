//
//  MasonryGridView.swift
//  RizzApp
//
//  Created by Marcus Arnett on 9/23/23.
//

import SwiftUI
import SwiftUIMasonry

struct MasonryGridView: View {
    var body: some View {
        ScrollView(.vertical) {
            VMasonry(columns: 2) {
                ForEach(RizzOnboarding.nftCollection, id:\.self) { nft in
                    MasonryCardView(image: nft)
                }
            }
            .padding(.bottom, 140)
        }
        .padding(.horizontal, 8)
    }
}

#Preview {
    MasonryGridView()
}
