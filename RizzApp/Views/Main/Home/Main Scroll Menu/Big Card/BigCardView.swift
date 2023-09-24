//
//  BigCardView.swift
//  RizzApp
//
//  Created by Marcus Arnett on 9/23/23.
//

import SwiftUI

struct BigCardView: View {
    let image: String
    
    var body: some View {
        Image(image)
            .resizable()
            .scaledToFit()
            .frame(width: UIScreen.main.bounds.width - 50, height: UIScreen.main.bounds.width - 50)
    }
}

#Preview {
    BigCardView(image: "CoolCat1")
}
