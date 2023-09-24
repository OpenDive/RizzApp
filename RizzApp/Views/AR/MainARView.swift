////
////  MainARView.swift
////  SuiKit
////
////  Copyright (c) 2023 OpenDive
////
////  Permission is hereby granted, free of charge, to any person obtaining a copy
////  of this software and associated documentation files (the "Software"), to deal
////  in the Software without restriction, including without limitation the rights
////  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
////  copies of the Software, and to permit persons to whom the Software is
////  furnished to do so, subject to the following conditions:
////
////  The above copyright notice and this permission notice shall be included in
////  all copies or substantial portions of the Software.
////
////  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
////  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
////  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
////  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
////  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
////  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
////  THE SOFTWARE.
////
//
//import SwiftUI
//import RealityKit
//import ARKit
//
//struct MainARView: View {
//    @StateObject private var arViewModel: MainARViewModel = MainARViewModel()
//
//    @State private var isPlacementEnabled = false
//    @State private var errorMessage: String = ""
//    @State private var isShowingPopup: Bool = false
//
//    var body: some View {
//        ZStack {
//            ARViewContainer()
//                .environmentObject(self.arViewModel)
//                .ignoresSafeArea()
//
//            if self.arViewModel.isShowingAdder {
//                VStack {
//                    Spacer()
//
//                    ConfirmPlacementView()
//                        .environmentObject(self.arViewModel)
//                        .padding(.bottom, 40)
//                }
//            } else {
//                VStack {
//                    ArtPiecePickerView()
//                        .environmentObject(self.arViewModel)
//                }
//            }
//        }
//        .alert("\(self.errorMessage)", isPresented: $isShowingPopup) {
//            Button("OK", role: .cancel) {
//                self.arViewModel.isShowingUploadSnapshotOverlay = false
//                self.isShowingPopup = false
//                self.errorMessage = ""
//            }
//        }
//    }
//}
//
//#Preview {
//    MainARView()
//}
