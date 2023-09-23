////
////  ArtPiece.swift
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
//import UIKit
//import RealityKit
//import SceneKit
//
//class ArtPiece: Identifiable, ObservableObject {
//    let id = UUID().uuidString
//    let imageURL: String
//    let name: String?
//
//    @Published var imageResource: URL?
//
//    init(imageURL: String, name: String?) {
//        self.imageURL = imageURL
//        self.name = name
//        Self.fetchImageWithEscaping(imageURL: imageURL, id: self.id) { url in
//            self.imageResource = url
//        }
//    }
//
//    var modelEntity: ModelEntity? {
//        let dimensions: SIMD3<Float> = [0.3075, 0.046, 0.3075]
//
//        // Create Frame Housing
//        let housingMesh = MeshResource.generateBox(size: dimensions)
//        let housingMat = SimpleMaterial(color: .black, roughness: 0.4, isMetallic: false)
//        let housingEntity = ModelEntity(mesh: housingMesh, materials: [housingMat])
//
//        // Create Contents of Frame
//        let screenMesh = MeshResource.generatePlane(width: dimensions.x, depth: dimensions.z)
//        let screenMaterial = SimpleMaterial(color: .white, roughness: 0.2, isMetallic: false)
//        let screenEntity = ModelEntity(mesh: screenMesh, materials: [screenMaterial])
//        screenEntity.name = self.id
//
//        // Add Contents of Frame to Frame Housing
//        housingEntity.addChild(screenEntity)
//        screenEntity.setPosition([0, dimensions.y / 2 + 0.001, 0], relativeTo: housingEntity)
//
//        do {
//            // Implement Texture Material onto Contents
//            let filePath = Bundle.main.path(forResource: "BAYC1", ofType: "png")!
//            let imageResource = URL(fileURLWithPath: filePath)
//            let texture = try TextureResource.load(contentsOf: imageResource)
//            var material = SimpleMaterial()
//            material.color.texture = SimpleMaterial.Texture(texture)
//            screenEntity.model?.materials = [material]
//
//            return housingEntity
//        } catch {
//            print(error)
//            return nil
//        }
//    }
//}
