//
//  FeatureItemCarouselView.swift
//  RizApp
//
//  Created by Marcus Arnett on 9/22/23.
//

import SwiftUI

struct FeatureItemCarouselView: View {
    @State private var index = 0
    
    var body: some View {
        ZStack {
            VStack {
                Spacer()
                
                ZStack {
                    RoundedRectangle(cornerRadius: 12.0)
                        .ignoresSafeArea()
                        .padding(.top, 10)
                        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 3)
                        .foregroundStyle(RizzColors.rizzGray)
                }
            }
            
            TabView(selection: $index) {
                ForEach(0..<4, id:\.self) { index in
                    if index < 3 {
                        FeatureItemView(feature: RizzOnboarding.features[index])
                    } else {
                        ConnectWalletFeatureView(feature: RizzOnboarding.features[index])
                    }
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
        }
    }
}

struct ConnectWalletFeatureView: View {
    let feature: FeatureItem
    
    var body: some View {
        ZStack {
            VStack {
                VStack {
                    RoundedRectangle(cornerRadius: 12.0)
                        .frame(width: 75, height: 75)
                        .padding(.top, 400)
                    
                    Text(feature.title)
                        .foregroundStyle(RizzColors.rizzWhite)
                        .font(.title)
                        .bold()
                    
                    Text(feature.description)
                        .multilineTextAlignment(.center)
                        .font(.headline)
                        .padding(.horizontal, 30)
                }
            }
            
            Button {
                print("Hello World!")
            } label: {
                ZStack {
                    VStack {
                        Spacer()
                        
                        Capsule()
                            .foregroundStyle(RizzColors.rizzWhite)
                            .frame(width: UIScreen.main.bounds.width - 60, height: 50)
                            .overlay {
                                Capsule()
                                    .stroke(RizzColors.rizzBlue, lineWidth: 5)
                            }
                    }
                    VStack {
                        Spacer()
                        
                        Text("Connect Wallet")
                            .foregroundStyle(RizzColors.rizzBlue)
                            .font(.title)
                            .padding(.bottom, 6)
                    }
                }
                .padding(.bottom, 50)
            }
        }
    }
}

#Preview {
    FeatureItemCarouselView()
}
