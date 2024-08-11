//
//  Testing3.swift
//  VisageVerify
//
//  Created by Nikita Ochkin on 06.08.2024.
//

import SwiftUI

struct BlinkingEyeStatesDisplay: View {
    var body: some View {
        VStack(spacing: -230) {
            OpenEye(mainEyeColor: .black,
                    sectorColor:  .white,
                    pupilColor:   .black)
            .aspectRatio(0.5, contentMode: .fit)
            .frame(height: 350)
            
            BlinkingEyeAnimationState2(mainEyeColor: .black,
                                       sectorColor:  .white,
                                       pupilColor:   .black)
            .aspectRatio(0.5, contentMode: .fit)
            .frame(height: 350)
            
            BlinkingEyeAnimationState3(mainEyeColor: .black,
                                       sectorColor:  .white,
                                       pupilColor:   .black)
            .aspectRatio(0.5, contentMode: .fit)
            .frame(height: 350)
            
            BlinkingEyeAnimationState4(mainEyeColor: .black,
                                       sectorColor:  .white,
                                       pupilColor:   .black)
            .aspectRatio(0.5, contentMode: .fit)
            .frame(height: 350)
            
            BlinkingEyeAnimationState5(mainEyeColor: .black,
                                       sectorColor:  .white,
                                       pupilColor:   .black)
            .aspectRatio(0.5, contentMode: .fit)
            .frame(height: 350)
            
            BlinkingEyeAnimationState6(mainEyeColor: .black,
                                       sectorColor:  .white,
                                       pupilColor:   .black)
            .aspectRatio(0.5, contentMode: .fit)
            .frame(height: 350)
            
            ClosedEye(mainEyeColor: .black)
            .aspectRatio(0.5, contentMode: .fit)
            .frame(height: 350)
        }
    }
}

#Preview {
    BlinkingEyeStatesDisplay()
}
