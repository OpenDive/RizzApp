//
//  PlaylistScrollView.swift
//  RizzApp
//
//  Created by Marcus Arnett on 9/23/23.
//

import SwiftUI

struct PlaylistScrollView: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(0..<5, id:\.self) { _ in
                    RoundedRectangle(cornerRadius: 6.0)
                        .frame(width: 110, height: 110)
                }
            }
            .padding(.bottom)
        }
        .mask {
            RoundedRectangle(cornerRadius: 12.0)
                .frame(width: UIScreen.main.bounds.width - 20, height: 200)
        }
    }
}

#Preview {
    PlaylistScrollView()
}
