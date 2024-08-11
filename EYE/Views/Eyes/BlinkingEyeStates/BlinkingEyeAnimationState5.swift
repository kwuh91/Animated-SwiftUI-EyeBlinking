//
//  BlinkingEyeAnimationState5.swift
//  VisageVerify
//
//  Created by Nikita Ochkin on 09.08.2024.
//

import SwiftUI

struct BlinkingEyeAnimationState5: View {
    let mainEyeColor: Color
    let sectorColor:  Color
    let pupilColor:   Color
    
    var body: some View {
        ZStack {
            
            // upper part
            ZStack {
                ClosedEye(mainEyeColor: mainEyeColor)
                    .rotation3DEffect(.degrees(72.5), axis: (x: 1, y: 0, z: 0))
            }
            
            // lower part
            ZStack {
                ClosedEye(mainEyeColor: mainEyeColor)
                    .rotation3DEffect(.degrees(29), axis: (x: 1, y: 0, z: 0))
                
                ClosedEye(mainEyeColor: mainEyeColor)
                    .rotation3DEffect(.degrees(40), axis: (x: 1, y: 0, z: 0))
                
                ClosedEye(mainEyeColor: mainEyeColor)
                    .rotation3DEffect(.degrees(51), axis: (x: 1, y: 0, z: 0))
                
                ClosedEye(mainEyeColor: mainEyeColor)
                    .rotation3DEffect(.degrees(59), axis: (x: 1, y: 0, z: 0))
                
                ClosedEye(mainEyeColor: mainEyeColor)
                    .rotation3DEffect(.degrees(65), axis: (x: 1, y: 0, z: 0))
                
                ClosedEye(mainEyeColor: mainEyeColor)
                    .rotation3DEffect(.degrees(69), axis: (x: 1, y: 0, z: 0))
            }
            
            // sector
            MyCustomCircle(radius:     3,
                           startAngle: 20,
                           endAngle:   160,
                           clockwise:  false)
                .foregroundStyle(sectorColor)

            // upper sector part
            ZStack {
                ClosedEye(mainEyeColor: mainEyeColor)
                    .rotation3DEffect(.degrees(78), axis: (x: 1, y: 0, z: 0))
                
                ClosedEye(mainEyeColor: mainEyeColor)
                    .rotation3DEffect(.degrees(75.6), axis: (x: 1, y: 0, z: 0))
            }
        }.drawingGroup()
    }
}

#Preview {
    VStack(spacing: -300) {
        BlinkingEyeAnimationState4(mainEyeColor: .black,
                                   sectorColor:  .white,
                                   pupilColor:   .black)
        .aspectRatio(0.5, contentMode: .fit)
        .frame(height: 500)
        
        BlinkingEyeAnimationState5(mainEyeColor: .black,
                                   sectorColor:  .white,
                                   pupilColor:   .black)
        .aspectRatio(0.5, contentMode: .fit)
        .frame(height: 500)
    }
    
//    ZStack {
//        BlinkingEyeAnimationState4(mainEyeColor: .black,
//                                   sectorColor:  .white,
//                                   pupilColor:   .black)
//
//        BlinkingEyeAnimationState5(mainEyeColor: .red,
//                                   sectorColor:  .white,
//                                   pupilColor:   .black)
//        .opacity(0.8)
//    }
}
