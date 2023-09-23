//
//  SplashScreenView.swift
//  RizApp
//
//  Created by Marcus Arnett on 9/22/23.
//

import SwiftUI

struct SplashScreenView: View {
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundStyle(RizzColors.rizzBlack)
                .ignoresSafeArea()
            
            VStack {
                VStack {
                    RoundedRectangle(cornerRadius: 12.0)
                        .foregroundStyle(RizzColors.rizzPink)
                        .frame(width: 128, height: 128)
                    Text("RIZZ")
                        .font(.title)
                        .foregroundStyle(RizzColors.rizzWhite)
                        .padding(.top, 14)
                        
                }
                    .padding(.bottom, 320)
                
                Text("OpenDive Technologies Copyright 2023")
                    .foregroundStyle(RizzColors.rizzWhite)
            }
        }
    }
}

#Preview {
    SplashScreenView()
}
