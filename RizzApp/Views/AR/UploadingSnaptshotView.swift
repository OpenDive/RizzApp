////
////  UploadingSnaptshotView.swift
////  SuiEaselAR
////
////  Created by Marcus Arnett on 9/7/23.
////
//
//import SwiftUI
//
//struct UploadingSnaptshotView: View {
//    var body: some View {
//        VStack {
//            ZStack {
//                Rectangle()
//                    .foregroundStyle(AppColor.Background)
//                    .frame(width: 150, height: 150)
//                    .clipShape(RoundedRectangle(cornerRadius: 12.0))
//
//                VStack {
//                    Spacer()
//
//                    ProgressView()
//                        .progressViewStyle(CircularProgressViewStyle(tint: AppColor.Highlight))
//                        .controlSize(.large)
//                        .padding(.bottom, 12)
//
//                    Text("Minting\nSnapshot...")
//                        .font(.custom("Futura", size: 18))
//                        .foregroundStyle(AppColor.Highlight)
//                        .multilineTextAlignment(.center)
//
//                    Spacer()
//                }
//            }
//        }
//    }
//}
//
//#Preview {
//    UploadingSnaptshotView()
//}
