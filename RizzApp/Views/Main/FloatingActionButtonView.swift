//
//  FloatingActionButtonView.swift
//  RizzApp
//
//  Created by Marcus Arnett on 9/23/23.
//

import SwiftUI

struct FloatingActionButtonView: View {
    var body: some View {
        VStack {
            Spacer()
            
            HStack {
                Spacer()
                
                Circle()
                    .foregroundStyle(RizzColors.rizzBlue)
                    .frame(width: 110, height: 110)
                    .padding(.trailing, 20)
            }
        }
    }
}

#Preview {
    FloatingActionButtonView()
}
