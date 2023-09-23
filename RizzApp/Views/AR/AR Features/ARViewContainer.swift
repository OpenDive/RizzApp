////
////  ARViewContainer.swift
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
//import RealityKit
//import ARKit
//import SwiftUI
//
//struct ARViewContainer: UIViewRepresentable {
//    @EnvironmentObject var arViewModel: MainARViewModel
//
//    static var arView: ARView?
//
//    func makeUIView(context: Context) -> ARView {
//        let arView = FocusARView(frame: .zero)
//        arView.addCoaching()
//        ARViewContainer.arView = arView
//        return arView
//    }
//
//    func updateUIView(_ uiView: ARView, context: Context) {
//        #if !targetEnvironment(simulator)
//        if let modelEntity = self.arViewModel.modelConfirmedForPlacement {
//            let anchorEntity = AnchorEntity(plane: .any)
//            let clonedEntity = modelEntity.clone(recursive: true)
//            clonedEntity.generateCollisionShapes(recursive: true)
//            uiView.installGestures([.all], for: clonedEntity)
//            anchorEntity.addChild(clonedEntity)
//            uiView.scene.addAnchor(anchorEntity)
//
//            DispatchQueue.main.async {
//                self.arViewModel.modelConfirmedForPlacement = nil
//            }
//        }
//        #endif
//    }
//}
