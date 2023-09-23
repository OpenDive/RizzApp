//
//  FeatureItemCarouselView.swift
//  RizApp
//
//  Created by Marcus Arnett on 9/22/23.
//

import SwiftUI

struct FeatureItemCarouselView: View {
    var body: some View {
        ZStack {
            VStack {
                RoundedRectangle(cornerRadius: 12.0)
                    .foregroundStyle(RizzColors.rizzPink)
                    .frame(width: 128, height: 128)
                    .padding(.top, 200)
                
                Spacer()
            }
            
            VStack {
                Spacer()
                
                ZStack {
                    RoundedRectangle(cornerRadius: 12.0)
                        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 3)
                        .foregroundStyle(RizzColors.rizzGray)
                    
                    VStack {
                        Text("Lorum Ipsum")
                            .foregroundStyle(RizzColors.rizzWhite)
                            .font(.title)
                            .bold()
                        
                        Text("Lorum Ipsum")
                            .padding(.top, 4)
                    }
                    .padding(.bottom, 100)
                }
            }
        }
    }
}

struct FeatureItemView: View {
    var body: some View {
        ZStack {
            
        }
    }
}

#Preview {
    ItemCarouselView()
}
