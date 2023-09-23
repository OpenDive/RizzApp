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
                HStack {
                    Image(systemName: "arkit")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50, height: 50)
                        .padding(.leading, 4)
                    
                    Image(systemName: "arkit")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50, height: 50)
                        .padding(.leading, 30)
                }
                .background {
                    Capsule()
                        .foregroundStyle(RizzColors.rizzBlue)
                        .frame(width: 190, height: 110)
                }
                .padding(.leading, 40)
                
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
