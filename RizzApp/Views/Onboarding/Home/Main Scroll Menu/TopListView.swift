//
//  TopListView.swift
//  RizzApp
//
//  Created by Marcus Arnett on 9/23/23.
//

import SwiftUI

struct TopListView: View {
    var body: some View {
        HStack {
            HStack {
                Image(systemName: "photo.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 25, height: 25)
                
                Text("My NFTs")
                    .bold()
                    .font(.system(size: 18))
            }
            .padding(.leading, 10)
            
            Spacer()
            
            HStack {
                Text("Playlist View")
                    .bold()
                    .font(.system(size: 18))
                
                Image(systemName: "placeholdertext.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 25, height: 25)
            }
            .padding(.trailing, 10)
        }
        .padding(.top, 24)
    }
}


#Preview {
    TopListView()
}
