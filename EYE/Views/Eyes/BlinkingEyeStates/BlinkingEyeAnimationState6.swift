//
//  BlinkingEyeAnimationState6.swift
//  VisageVerify
//
//  Created by Nikita Ochkin on 09.08.2024.
//

import SwiftUI

struct BlinkingEyeAnimationState6: View {
    let mainEyeColor: Color
    let sectorColor:  Color
    let pupilColor:   Color
    
    var body: some View {
        ZStack {
            
            // lower part
            ZStack {
                ClosedEye(mainEyeColor: mainEyeColor)
                    .rotation3DEffect(.degrees(31), axis: (x: 1, y: 0, z: 0))
                
                ClosedEye(mainEyeColor: mainEyeColor)
                    .rotation3DEffect(.degrees(31), axis: (x: 1, y: 0, z: 0))
                
                ClosedEye(mainEyeColor: mainEyeColor)
                    .rotation3DEffect(.degrees(36), axis: (x: 1, y: 0, z: 0))
                
                ClosedEye(mainEyeColor: mainEyeColor)
                    .rotation3DEffect(.degrees(48.5), axis: (x: 1, y: 0, z: 0))
            }

            // upper sector part
            ZStack {
                ClosedEye(mainEyeColor: mainEyeColor)
                    .rotation3DEffect(.degrees(57), axis: (x: 1, y: 0, z: 0))
            }
        }.drawingGroup()
    }
}

#Preview {
    VStack(spacing: -300) {
        BlinkingEyeAnimationState5(mainEyeColor: .black,
                                   sectorColor:  .white,
                                   pupilColor:   .black)
        .aspectRatio(0.5, contentMode: .fit)
        .frame(height: 500)
        
        BlinkingEyeAnimationState6(mainEyeColor: .black,
                                   sectorColor:  .white,
                                   pupilColor:   .black)
        .aspectRatio(0.5, contentMode: .fit)
        .frame(height: 500)
        // .opacity(0.6)
    }
    
//    ZStack {
//        BlinkingEyeAnimationState5(mainEyeColor: .black,
//                                   sectorColor:  .white,
//                                   pupilColor:   .black)
//
//        BlinkingEyeAnimationState6(mainEyeColor: .red,
//                                   sectorColor:  .white,
//                                   pupilColor:   .black)
//        .opacity(0.8)
//    }
}
