//
//  ArtPiecePickerView.swift
//  SuiKit
//
//  Copyright (c) 2023 OpenDive
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

import SwiftUI

struct ArtPiecePickerView: View {
    @EnvironmentObject var arViewModel: MainARViewModel

    var body: some View {
        ZStack {
            VStack {
                Spacer()

                Capsule()
                    .frame(width: UIScreen.main.bounds.width - 40, height: 100)
                    .opacity(0.5)
            }

            VStack {
                Spacer()

                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(RizzOnboarding.nftCollection, id: \.self) { nft in
                            Button {
                                self.arViewModel.selectedPiece = ModelHelper.modelEntity(image: nft)
                                self.arViewModel.isShowingAdder = true
                            } label: {
                                ArtPiecePickerItemView(nft: nft)
                            }
                        }
                    }
                    .padding(.horizontal, 30)
                }
                .frame(width: UIScreen.main.bounds.width - 40, height: 100)
                .clipShape(Capsule())
            }
        }
    }
}

#Preview {
    ArtPiecePickerView()
}

struct ArtPiecePickerItemView: View {
    let nft: String
    
    var body: some View {
        Image(nft)
            .resizable()
            .scaledToFit()
            .clipShape(RoundedRectangle(cornerRadius: 12.0))
            .frame(width: 60, height: 60)
            .padding(.horizontal, 10)
    }
}
