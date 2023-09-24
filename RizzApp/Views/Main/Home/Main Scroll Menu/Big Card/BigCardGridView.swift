//
//  BigCardGridView.swift
//  RizzApp
//
//  Created by Marcus Arnett on 9/23/23.
//

import SwiftUI

struct BigCardGridView: View {
    var body: some View {
        ScrollView(showsIndicators: false) {
            ForEach(RizzOnboarding.nftCollection, id:\.self) { nft in
                BigCardView(image: nft)
            }
            .padding(.bottom, 140)
        }
    }
}
#Preview {
    BigCardGridView()
}
