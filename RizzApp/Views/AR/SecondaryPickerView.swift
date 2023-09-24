//
//  SecondaryPickerView.swift
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

struct SecondaryPickerView: View {
    @Environment(\.presentationMode) var mode
    
    let action: () -> Void
        
    init(action: @escaping () -> Void) {
        self.action = action
    }

    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Button { mode.wrappedValue.dismiss() } label: {
                      Image(systemName: "arrowshape.turn.up.backward.circle")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 65, height: 65)
                        .foregroundColor(RizzColors.rizzWhite)
                        .padding(.leading, 10)
                    }

                    Spacer()

                    Button { action() } label: {
                        Circle()
                            .frame(width: 65, height: 65)
                            .opacity(0.0)
                            .overlay {
                                Circle()
                                    .stroke(RizzColors.rizzWhite, lineWidth: 3.0)
                                    .frame(width: 65, height: 65)
                            }
                            .overlay {
                                Circle()
                                    .foregroundStyle(RizzColors.rizzRed)
                                    .frame(width: 50, height: 50)
                            }
                    }

                    Spacer()

                    Circle()
                        .frame(width: 65, height: 65)
                        .padding(.trailing, 10)
                        .opacity(0.0)
                }
                .padding(.horizontal)
            }
        }
    }
}

#Preview {
    SecondaryPickerView() {
        print("Hello world")
    }
}
