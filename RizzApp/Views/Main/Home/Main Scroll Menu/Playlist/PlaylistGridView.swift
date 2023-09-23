//
//  PlaylistGridView.swift
//  RizzApp
//
//  Created by Marcus Arnett on 9/23/23.
//

import SwiftUI

struct PlaylistGridView: View {
    var body: some View {
        VStack {
            ScrollView(.vertical) {
                ForEach(0..<10, id:\.self) { _ in
                    PlaylistCategoryView()
                }
            }
        }
    }
}

#Preview {
    PlaylistGridView()
}
