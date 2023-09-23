//
//  PlaylistGridView.swift
//  RizzApp
//
//  Created by Marcus Arnett on 9/23/23.
//

import SwiftUI

struct PlaylistGridView: View {
    let discover = RizzOnboarding.discover
    
    var body: some View {
        VStack {
            ScrollView(.vertical) {
                ForEach(discover) { category in
                    PlaylistCategoryView(category: category)
                }
                .padding(.bottom, 140)
            }
        }
    }
}

#Preview {
    PlaylistGridView()
}
