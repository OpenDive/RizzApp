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
                ForEach(0..<34, id:\.self) { _ in
                    MasonryCardView()
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
