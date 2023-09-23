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
            ForEach(0..<33, id:\.self) { _ in
                BigCardView()
            }
        }
    }
}
#Preview {
    BigCardGridView()
}
