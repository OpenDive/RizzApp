//
//  TopListView.swift
//  RizzApp
//
//  Created by Marcus Arnett on 9/23/23.
//

import SwiftUI

struct TopListView: View {
    @EnvironmentObject var appearenceViewModel: AppearenceViewModel
    
    var body: some View {
        HStack {
            HStack {
                Image(systemName: "photo.fill")
                    .resizable()
                    .scaledToFit()
                    .foregroundStyle(RizzColors.rizzWhite)
                    .frame(width: 25, height: 25)
                
                Text("My NFTs")
                    .foregroundStyle(RizzColors.rizzWhite)
                    .bold()
                    .font(.system(size: 18))
            }
            .padding(.leading, 10)
            
            Spacer()
            
            HStack {
                Text("Playlist View")
                    .bold()
                    .font(.system(size: 18))
                    .foregroundStyle(RizzColors.rizzWhite)
                
                Image(systemName: "placeholdertext.fill")
                    .resizable()
                    .scaledToFit()
                    .foregroundStyle(RizzColors.rizzWhite)
                    .frame(width: 25, height: 25)
            }
            .padding(.trailing, 10)
        }
        .padding(.top, 24)
    }
}

struct ModelGridModeView: View {
    var body: some View {
        /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Hello, world!@*/Text("Hello, world!")/*@END_MENU_TOKEN@*/
    }
}

#Preview {
    TopListView()
        .environmentObject(AppearenceViewModel.instance)
}
