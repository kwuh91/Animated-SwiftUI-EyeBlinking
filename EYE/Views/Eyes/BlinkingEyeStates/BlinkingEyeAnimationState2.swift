//
//  BlinkingEyeAnimationState2.swift
//  VisageVerify
//
//  Created by Nikita Ochkin on 07.08.2024.
//

import SwiftUI

func iterToDegreesRatioLowerEyePartState2(iter: Int) -> CGFloat {
    -pow((CGFloat(iter) * 0.71 - 7.7), 2) + 90
}

func iterToDegreesRatioUpperEyePartState2(iter: Int) -> CGFloat {
    pow((CGFloat(iter) * 0.35 - 6.3), 2) + 90
}

struct MainEyeShapeMiddlePartHelperState2: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        // Define scaling factors based on the rect size
        let widthScale  = rect.width  / 14.5
        let heightScale = rect.height / 28.0

        // right corner
        path.move(to: CGPoint(x: rect.midX + 7.19 * widthScale,
                              y: rect.midY + 0    * heightScale))
        
        // up
        path.addLine(
            to: CGPoint(x: rect.midX,
                        y: rect.midY - 3.5 * heightScale))
        
        // left corner
        path.addLine(
            to: CGPoint(x: rect.midX - 7.19 * widthScale,
                        y: rect.midY + 0    * heightScale))
        
        // down
        path.addLine(
            to: CGPoint(x: rect.midX,
                        y: rect.midY + 4 * heightScale))
        
        path.closeSubpath()
        return path
    }
}

struct BlinkingEyeAnimationState2Body: View {
    let mainEyeColor: Color
    
    var body: some View {
        ZStack {
            ForEach(1..<7, id: \.self) { i in

                // fill lower part
                ClosedEye(mainEyeColor: mainEyeColor)
                    .rotation3DEffect(
                        .degrees(iterToDegreesRatioLowerEyePartState2(iter: i)),
                        axis: (x: 1, y: 0, z: 0))
                
                // fill higher part
                ClosedEye(mainEyeColor: mainEyeColor)
                    .rotation3DEffect(
                        .degrees(iterToDegreesRatioUpperEyePartState2(iter: i)),
                        axis: (x: 1, y: 0, z: 0))
            }
            
            // fill the middle
            MainEyeShapeMiddlePartHelperState2()
                .foregroundStyle(mainEyeColor)
        }
    }
}

struct BlinkingEyeAnimationState2: View {
    let mainEyeColor: Color
    let sectorColor:  Color
    let pupilColor:   Color
    
    var body: some View {
        ZStack {
            // upper part
            ClosedEye(mainEyeColor: mainEyeColor)
                .rotation3DEffect(.degrees(135), axis: (x: 1, y: 0, z: 0))
            
            // middle part
            BlinkingEyeAnimationState2Body(mainEyeColor: mainEyeColor)
            
            
            // lower part
            ClosedEye(mainEyeColor: mainEyeColor)
                .rotation3DEffect(.degrees(22), axis: (x: 1, y: 0, z: 0))
            
            // sector
            MyFullCircle(radius: 3)
                .foregroundStyle(sectorColor)

            // pupil
            MyFullCircle(radius: 0.9)
                .foregroundStyle(pupilColor)
        }.drawingGroup()
    }
}

#Preview {
    VStack(spacing: -300) {
        OpenEye(mainEyeColor: .black,
                sectorColor:  .white,
                pupilColor:   .black)
            .aspectRatio(0.5, contentMode: .fit)
            .frame(height: 500)
        
        BlinkingEyeAnimationState2(mainEyeColor: .black,
                                   sectorColor:  .white,
                                   pupilColor:   .black)
        .aspectRatio(0.5, contentMode: .fit)
        .frame(height: 500)
    }
    
//    ZStack() {
//        OpenEye(mainEyeColor: .black,
//                sectorColor:  .white,
//                pupilColor:   .black)
//
//        BlinkingEyeAnimationState2(mainEyeColor: .red,
//                                   sectorColor:  .white,
//                                   pupilColor:   .black)
//        .opacity(0.8)
//    }
}
