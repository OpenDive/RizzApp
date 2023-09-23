//
//  BigCardView.swift
//  RizzApp
//
//  Created by Marcus Arnett on 9/23/23.
//

import SwiftUI

struct BigCardView: View {
    var body: some View {
        Rectangle()
            .frame(width: UIScreen.main.bounds.width - 50, height: UIScreen.main.bounds.width - 50)
    }
}

#Preview {
    BigCardView()
}
