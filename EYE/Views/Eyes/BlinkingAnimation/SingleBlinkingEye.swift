//
//  TestingBlinking2.swift
//  VisageVerify
//
//  Created by Nikita Ochkin on 09.08.2024.
//

import SwiftUI

// Main view with blinking animation
struct SingleBlinkingEyeView: View {
    let mainEyeColor: Color
    let sectorColor : Color
    let pupilColor  : Color
    
    var delayBetweenChangingStates: CGFloat = 0.025
    
    @State private var eyeState: EyeState = .state1
    @State private var isBlinking: Bool = false
    
    var body: some View {
        Group {
            switch eyeState {
            case .state1:
                OpenEye(mainEyeColor: mainEyeColor,
                        sectorColor:  sectorColor ,
                        pupilColor:   pupilColor  )
            case .state2:
                BlinkingEyeAnimationState2(mainEyeColor: mainEyeColor,
                                           sectorColor:  sectorColor ,
                                           pupilColor:   pupilColor  )
            case .state2p2:
                BlinkingEyeAnimationState2(mainEyeColor: mainEyeColor,
                                           sectorColor:  sectorColor ,
                                           pupilColor:   pupilColor  )
            case .state3:
                BlinkingEyeAnimationState3(mainEyeColor: mainEyeColor,
                                           sectorColor:  sectorColor ,
                                           pupilColor:   pupilColor  )
            case .state3p2:
                BlinkingEyeAnimationState3(mainEyeColor: mainEyeColor,
                                           sectorColor:  sectorColor ,
                                           pupilColor:   pupilColor  )
            case .state4:
                BlinkingEyeAnimationState4(mainEyeColor: mainEyeColor,
                                           sectorColor:  sectorColor ,
                                           pupilColor:   pupilColor  )
            case .state4p2:
                BlinkingEyeAnimationState4(mainEyeColor: mainEyeColor,
                                           sectorColor:  sectorColor ,
                                           pupilColor:   pupilColor  )
            case .state5:
                BlinkingEyeAnimationState5(mainEyeColor: mainEyeColor,
                                           sectorColor:  sectorColor ,
                                           pupilColor:   pupilColor  )
            case .state5p2:
                BlinkingEyeAnimationState5(mainEyeColor: mainEyeColor,
                                           sectorColor:  sectorColor ,
                                           pupilColor:   pupilColor  )
            case .state6:
                BlinkingEyeAnimationState6(mainEyeColor: mainEyeColor,
                                           sectorColor:  sectorColor ,
                                           pupilColor:   pupilColor  )
            case .state6p2:
                BlinkingEyeAnimationState6(mainEyeColor: mainEyeColor,
                                           sectorColor:  sectorColor ,
                                           pupilColor:   pupilColor  )
            case .state7:
                ClosedEye(mainEyeColor: .black)
            }
        }
        .onTapGesture {
            if !isBlinking {
                startBlinkingAnimation()
            }
        }
    }
    
    func startBlinkingAnimation() {
        isBlinking = true
        let blinkingSequence: [EyeState] = [
            .state2,   .state3,   .state4,   .state5,   .state6,   .state7,
            .state6p2, .state5p2, .state4p2, .state3p2, .state2p2, .state1
        ]
        var delay = 0.0
        for state in blinkingSequence {
            DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
                eyeState = state
                if state == .state1 {
                    isBlinking = false
                }
            }
            delay += delayBetweenChangingStates
        }
    }
}

#Preview {
    SingleBlinkingEyeView(mainEyeColor: .black,
                          sectorColor:  .white,
                          pupilColor:   .black)
        .aspectRatio(0.5, contentMode: .fit)
        .frame(height: 500)
}
