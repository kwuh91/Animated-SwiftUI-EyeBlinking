//
//  BlinkingEyeAnimationState7.swift
//  VisageVerify
//
//  Created by Nikita Ochkin on 10.08.2024.
//

import SwiftUI

struct BlinkingEyeAnimationState7: View {
    let mainEyeColor: Color
    let sectorColor:  Color
    let pupilColor:   Color
    
    var body: some View {
        ClosedEye(mainEyeColor: mainEyeColor)
            .rotation3DEffect(.degrees(30), axis: (x: 1, y: 0, z: 0))
    }
}

#Preview {
    VStack(spacing: -300) {
        BlinkingEyeAnimationState6(mainEyeColor: .black,
                                   sectorColor:  .white,
                                   pupilColor:   .black)
        .aspectRatio(0.5, contentMode: .fit)
        .frame(height: 500)
        
        BlinkingEyeAnimationState7(mainEyeColor: .black,
                                   sectorColor:  .white,
                                   pupilColor:   .black)
        .aspectRatio(0.5, contentMode: .fit)
        .frame(height: 500)
        // .opacity(0.6)
    }
    
//    ZStack {
//        BlinkingEyeAnimationState6(mainEyeColor: .black,
//                                   sectorColor:  .white,
//                                   pupilColor:   .black)
//
//        BlinkingEyeAnimationState7(mainEyeColor: .red,
//                                   sectorColor:  .white,
//                                   pupilColor:   .black)
//        .opacity(0.8)
//    }
}
