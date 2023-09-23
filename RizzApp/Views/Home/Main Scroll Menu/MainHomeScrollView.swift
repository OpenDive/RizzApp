//
//  MainHomeScrollView.swift
//  RizzApp
//
//  Created by Marcus Arnett on 9/23/23.
//

import SwiftUI

struct MainHomeScrollView: View {
    @State private var gridMode: HomeGridViewMode = .collectorCluster
    
    var body: some View {
        switch gridMode {
        case .collectorCluster:
            CollectorClusterGridView()
        case .bigCards:
            BigCardGridView()
        case .playlist:
            PlaylistGridView()
        case .masonry:
            MasonryGridView()
        }
    }
}

#Preview {
    MainHomeScrollView()
}
