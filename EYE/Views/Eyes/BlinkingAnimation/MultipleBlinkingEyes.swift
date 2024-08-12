//
//  Testing3.swift
//  VisageVerify
//
//  Created by Nikita Ochkin on 10.08.2024.
//

import SwiftUI

// Define the different eye states
enum EyeState {
    case state1
    case state2
    case state2p2
    case state3
    case state3p2
    case state4
    case state4p2
    case state5
    case state5p2
    case state6
    case state6p2
    case state7
}

// Main view with blinking animation
struct BlinkingEyeView: View {
    let mainEyeColor: Color
    let sectorColor : Color
    let pupilColor  : Color
    
    var delayBetweenChangingStates: CGFloat = 0.025
    var intervalForRandomTimeBetweenBlinking: ClosedRange<CGFloat> = 1...20
    
    @State private var eyeState: EyeState = .state1
    @State private var timer: Timer?
    
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
        .onAppear() {
            scheduleNextBlink()
        }
        .onDisappear() {
            stopBlinkingAnimation()
        }
    }
    
    func startBlinkingAnimation() {
        let blinkingSequence: [EyeState] = [
            .state2,   .state3,   .state4,   .state5,   .state6,   .state7,
            .state6p2, .state5p2, .state4p2, .state3p2, .state2p2, .state1
        ]
        var delay = 0.0
        for state in blinkingSequence {
            DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
                eyeState = state
            }
            delay += delayBetweenChangingStates
        }
        scheduleNextBlink()
    }
    
    func scheduleNextBlink() {
        let randomInterval = CGFloat.random(in: intervalForRandomTimeBetweenBlinking)
        timer = Timer.scheduledTimer(withTimeInterval: randomInterval,
                                     repeats: false) { _ in
            startBlinkingAnimation()
        }
    }
    
    func stopBlinkingAnimation() {
        timer?.invalidate()
        timer = nil
    }
}

struct Eye: Identifiable {
    let id      = UUID()
    let position: CGPoint
    let size:     CGFloat
    let anchor:   UnitPoint
    var scale:    CGFloat = 0
}

struct MultipleBlinkingEyes: View {
    let quantity: Int
    
    let mainEyeColor: Color
    let sectorColor : Color
    let pupilColor  : Color
    
    var delayBetweenChangingStates: CGFloat = 0.025
    var intervalForRandomTimeBetweenBlinking: ClosedRange<CGFloat> = 1...20
    var intervalForRandomSize: ClosedRange<CGFloat> = 50...300
    var intervalForRandomDelay: ClosedRange<CGFloat> = 0...0.5
    var randomizeAnchor: Bool = true
    var animation: Animation? = .spring
    
    private let screenWidth  = UIScreen.main.bounds.width
    private let screenHeight = UIScreen.main.bounds.height
    
    @State private var eyes: [Eye] = []
    @State private var action: Bool = false
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Color.white
                    .ignoresSafeArea()
                
                generateEyes()
            }
            .onAppear {
                eyes = (0..<quantity).map { _ in
                    Eye(
                        position: CGPoint(
                            x: CGFloat.random(in: 0...geometry.size.width),
                            y: CGFloat.random(in: 0...geometry.size.height + geometry.safeAreaInsets.top)
                        ),
                        
                        size: CGFloat.random(in: intervalForRandomSize),
                        
                        anchor: UnitPoint(
                            x: CGFloat.random(in: 0...1),
                            y: CGFloat.random(in: 0...1))
                    )
                }
            }
            .onTapGesture {
                action.toggle()
                for index in eyes.indices {
                    let delay = CGFloat.random(in: intervalForRandomDelay)
                    DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
                        withAnimation(
                            animation
                        ) {
                            eyes[index].scale = action ? 1 : 0
                        }
                    }
                }
            }
        }
    }
    
    @ViewBuilder func generateEyes() -> some View {
        GeometryReader { geometry in
            ForEach(eyes.indices, id: \.self) { index in
                let eye = eyes[index]
                BlinkingEyeView(
                    mainEyeColor: mainEyeColor,
                    sectorColor:  sectorColor,
                    pupilColor:   pupilColor,
                    delayBetweenChangingStates: delayBetweenChangingStates,
                    intervalForRandomTimeBetweenBlinking: intervalForRandomTimeBetweenBlinking
                )
                .aspectRatio(0.5, contentMode: .fit)
                .frame(height: eye.size)
                .position(eye.position)
                .scaleEffect(
                    eye.scale,
                    anchor: randomizeAnchor ? eye.anchor :
                        UnitPoint(
                    x: 1 / geometry.size.width * eye.position.x,
                    y: 1 / (geometry.size.height + geometry.safeAreaInsets.top) * eye.position.y)
                        )
            }
        }
    }
}

#Preview {
    MultipleBlinkingEyes(quantity:     100,
                         mainEyeColor: Color.black,
                         sectorColor:  Color.white,
                         pupilColor:   Color.black,
                         delayBetweenChangingStates: 0.025,
                         intervalForRandomTimeBetweenBlinking: 1...20,
                         intervalForRandomSize: 50...300,
                         intervalForRandomDelay: 0...0.25,
                         randomizeAnchor: true,
                         animation: .spring(duration: 0.5, bounce: 0.5))
}
