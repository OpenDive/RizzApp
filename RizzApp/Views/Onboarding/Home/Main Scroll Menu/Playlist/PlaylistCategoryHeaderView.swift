//
//  PlaylistCategoryHeaderView.swift
//  RizzApp
//
//  Created by Marcus Arnett on 9/23/23.
//

import SwiftUI

struct PlaylistCategoryHeaderView: View {
    var body: some View {
        VStack {
            HStack {
                ZStack {
                    Circle()
                        .frame(width: 50, height: 50)
                    
                    Circle()
                        .foregroundStyle(.white)
                        .frame(width: 16, height: 16)
                        .padding(.top, 30)
                        .padding(.leading, 30)
                }
                
                Text("Lorum Ipsum")
                    .font(.title2)
                    .bold()
                    .foregroundStyle(RizzColors.rizzWhite)
                    .padding(.leading, 15)
                
                Text(" (99)")
                    .font(.subheadline)
                    .foregroundStyle(.gray)
                
                Spacer()
            }
            .padding(.leading, 25)
            
            Spacer()
        }
        .padding(.top, 20)
        .padding(.bottom, 2)
    }
}


#Preview {
    PlaylistCategoryHeaderView()
}
