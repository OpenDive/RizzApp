//
//  PlaylistCategoryView.swift
//  RizzApp
//
//  Created by Marcus Arnett on 9/23/23.
//

import SwiftUI

struct PlaylistCategoryView: View {
    let category: Collection
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 12.0)
                .frame(width: UIScreen.main.bounds.width - 20, height: 200)
                .foregroundStyle(RizzColors.rizzLightGray)
            
            VStack {
                PlaylistCategoryHeaderView(name: category.title, amount: category.NFTs.count, icon: category.logo)
                PlaylistScrollView(nfts: category.NFTs)
            }
        }
        .padding(.vertical, 0.25)
    }
}

#Preview {
    PlaylistCategoryView(category: RizzOnboarding.discover[0])
}
