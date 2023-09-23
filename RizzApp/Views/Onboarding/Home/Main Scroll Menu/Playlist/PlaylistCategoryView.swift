//
//  PlaylistCategoryView.swift
//  RizzApp
//
//  Created by Marcus Arnett on 9/23/23.
//

import SwiftUI

struct PlaylistCategoryView: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 12.0)
                .frame(width: UIScreen.main.bounds.width - 20, height: 200)
                .foregroundStyle(RizzColors.rizzLightGray)
            
            VStack {
                PlaylistCategoryHeaderView()
                PlaylistScrollView()
            }
        }
        .padding(.vertical, 0.25)
    }
}

#Preview {
    PlaylistCategoryView()
}
