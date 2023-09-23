//
//  CollectorClusterGridView.swift
//  RizzApp
//
//  Created by Marcus Arnett on 9/23/23.
//

import SwiftUI

struct CollectorClusterGridView: View {
    private let items = [
        GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())
    ]
    private let side = UIScreen.main.bounds.width / 4
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            LazyVGrid(columns: items, spacing: 2) {
                ForEach(0..<33, id:\.self) { _ in
                    Rectangle()
                        .frame(width: side, height: side)
                }
            }
            .padding(.bottom, 140)
        }
        .padding(.horizontal, 44)
    }
}

#Preview {
    CollectorClusterGridView()
}
