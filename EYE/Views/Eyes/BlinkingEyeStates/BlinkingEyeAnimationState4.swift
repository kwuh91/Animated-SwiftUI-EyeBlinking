//
//  BlinkingEyeAnimationState4.swift
//  VisageVerify
//
//  Created by Nikita Ochkin on 09.08.2024.
//

import SwiftUI

func iterToDegreesRatioLowerEyePartState4(iter: Int) -> CGFloat {
    -pow((CGFloat(iter) * 0.645 - 7.86), 2) + 90
}

func iterToDegreesRatioUpperEyePartState4(iter: Int) -> CGFloat {
    pow((CGFloat(iter) * 0.14 - 2.3), 2) + 90
}

func iterToDegreesRatioUpperSectorEyePartState4(iter: Int) -> CGFloat {
    pow((CGFloat(iter) * 0.153 - 2.5), 2) + 90
}

struct MainEyeShapeMiddlePartHelperState4: Shape {
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
                        y: rect.midY - 0.44 * heightScale))
        
        // left corner
        path.addLine(
            to: CGPoint(x: rect.midX - 7.19 * widthScale,
                        y: rect.midY + 0    * heightScale))
        
        // down
        path.addLine(
            to: CGPoint(x: rect.midX,
                        y: rect.midY + 3.7 * heightScale))
        
        path.closeSubpath()
        return path
    }
}

struct BlinkingEyeAnimationState4Body: View {
    let mainEyeColor: Color
    
    var body: some View {
        ZStack {
            ForEach(1..<7, id: \.self) { i in

                // fill lower part
                ClosedEye(mainEyeColor: mainEyeColor)
                    .rotation3DEffect(
                        .degrees(iterToDegreesRatioLowerEyePartState4(iter: i)),
                        axis: (x: 1, y: 0, z: 0))
                
                // fill upper part
                ClosedEye(mainEyeColor: mainEyeColor)
                    .rotation3DEffect(
                        .degrees(iterToDegreesRatioUpperEyePartState4(iter: i)),
                        axis: (x: 1, y: 0, z: 0))
            }
            
            // fill the middle
             MainEyeShapeMiddlePartHelperState4()
                .foregroundStyle(mainEyeColor)
        }
    }
}

struct BlinkingEyeAnimationState4: View {
    let mainEyeColor: Color
    let sectorColor:  Color
    let pupilColor:   Color
    
    var body: some View {
        ZStack {
            // upper part
            ClosedEye(mainEyeColor: mainEyeColor)
                .rotation3DEffect(.degrees(95), axis: (x: 1, y: 0, z: 0))
            
            // middle part
            BlinkingEyeAnimationState4Body(mainEyeColor: mainEyeColor)
            
            // lower part
            ClosedEye(mainEyeColor: mainEyeColor)
                .rotation3DEffect(.degrees(27), axis: (x: 1, y: 0, z: 0))
            
            // sector
            MyCustomCircle(radius:     3,
                           startAngle: -7.7,
                           endAngle:   187.7,
                           clockwise:  false)
                .foregroundStyle(sectorColor)

            // pupil
            MyCustomCircle(radius:     0.9,
                           startAngle: -24,
                           endAngle:   204,
                           clockwise:  false)
                .foregroundStyle(pupilColor)
            
            // upper sector part
            ZStack {
                ForEach(1..<10, id: \.self) { i in
                    // fill upper part
                    ClosedEye(mainEyeColor: .black)
                        .rotation3DEffect(
                            .degrees(iterToDegreesRatioUpperSectorEyePartState4(iter: i)),
                            axis: (x: 1, y: 0, z: 0))
                }
            }// .opacity(0.8)
        }.drawingGroup()
    }
}

#Preview {
    VStack(spacing: -300) {
        BlinkingEyeAnimationState3(mainEyeColor: .black,
                                   sectorColor:  .white,
                                   pupilColor:   .black)
        .aspectRatio(0.5, contentMode: .fit)
        .frame(height: 500)
        
        BlinkingEyeAnimationState4(mainEyeColor: .black,
                                   sectorColor:  .white,
                                   pupilColor:   .black)
        .aspectRatio(0.5, contentMode: .fit)
        .frame(height: 500)
    }
    
//    ZStack {
//        BlinkingEyeAnimationState3(mainEyeColor: .black,
//                                   sectorColor:  .white,
//                                   pupilColor:   .black)
//
//        BlinkingEyeAnimationState4(mainEyeColor: .red,
//                                   sectorColor:  .white,
//                                   pupilColor:   .black)
//        .opacity(0.8)
//    }
}
