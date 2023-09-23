//
//  FloatingActionButtonView.swift
//  RizzApp
//
//  Created by Marcus Arnett on 9/23/23.
//

import SwiftUI

struct FloatingActionButtonView: View {
    @Binding var index: Int
    
    var body: some View {
        VStack {
            Spacer()
            
            HStack {
                HStack {
                    Button {
                        index = 0
                    } label: {
                        VStack {
                            Image(systemName: "square.grid.3x3.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 30, height: 30)
                            
                            Text("Collections")
                        }
                    }
                    .foregroundStyle(self.index == 0 ? RizzColors.rizzNeonBlue : RizzColors.rizzLightGray)
                    
                    Button {
                        index = 1
                    } label: {
                        VStack {
                            Image(systemName: "ticket.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 30, height: 30)
                            
                            Text("Events")
                        }
                        .padding(.leading, 30)
                    }
                    .foregroundStyle(self.index == 1 ? RizzColors.rizzNeonBlue : RizzColors.rizzLightGray)
                }
                .padding(26)
                .background {
                    Capsule()
                        .foregroundStyle(RizzColors.rizzGray)
                }
                .padding(.leading, 14)
                
                Spacer()
                
                Image("AddButton")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 110, height: 110)
                    .padding(.trailing, 20)
            }
        }
    }
}

struct FloatingActionPreview: View {
    @State private var index: Int = 0
    
    var body: some View {
        FloatingActionButtonView(index: $index)
    }
}

#Preview {
    FloatingActionPreview()
}
