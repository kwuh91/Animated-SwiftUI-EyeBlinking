//
//  BlinkingEyeAnimationState3.swift
//  VisageVerify
//
//  Created by Nikita Ochkin on 09.08.2024.
//

import SwiftUI

func iterToDegreesRatioLowerEyePartState3(iter: Int) -> CGFloat {
    -pow((CGFloat(iter) * 0.54 - 7.43), 2) + 90
}

func iterToDegreesRatioUpperEyePartState3(iter: Int) -> CGFloat {
    pow((CGFloat(iter) * 0.31 - 4.84), 2) + 90
}

struct MainEyeShapeMiddlePartHelperState3: Shape {
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
                        y: rect.midY - 2 * heightScale))
        
        // left corner
        path.addLine(
            to: CGPoint(x: rect.midX - 7.19 * widthScale,
                        y: rect.midY + 0    * heightScale))
        
        // down
        path.addLine(
            to: CGPoint(x: rect.midX,
                        y: rect.midY + 3 * heightScale))
        
        path.closeSubpath()
        return path
    }
}

struct MainEyeShapeSectorHelperState3: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        // Define scaling factors based on the rect size
        let radiusScale = rect.width  / 14.0
        
        // right upper sector corner
        path.move(to: CGPoint(
            x: rect.midX + 3 * radiusScale * sin(Angle(degrees: 46.5).radians),
            y: rect.midY - 3 * radiusScale * sin(Angle(degrees: 43.5).radians)
        ))
        
        // below right upper sector corner
        path.addLine(
            to: CGPoint(
                x: rect.midX + 3 * radiusScale * sin(Angle(degrees: 46.5).radians),
                y: rect.midY - 2 * radiusScale * sin(Angle(degrees: 43.5).radians)
            ))
        
        // below left upper sector corner
        path.addLine(
            to: CGPoint(
                x: rect.midX - 3 * radiusScale * sin(Angle(degrees: 46.5).radians),
                y: rect.midY - 2 * radiusScale * sin(Angle(degrees: 43.5).radians)
            ))
        
        // left upper sector corner
        path.addLine(to: CGPoint(
            x: rect.midX - 3 * radiusScale * sin(Angle(degrees: 46.5).radians),
            y: rect.midY - 3 * radiusScale * sin(Angle(degrees: 43.5).radians)
        ))
        
        // upper curve
        path.addCurve(
            to: CGPoint(
                x: rect.midX + 3 * radiusScale * sin(Angle(degrees: 46.5).radians),
                y: rect.midY - 3 * radiusScale * sin(Angle(degrees: 43.5).radians)
            ),
            
            control1: CGPoint(
                x: rect.midX - 2 * radiusScale * sin(Angle(degrees: 46.5).radians),
                y: rect.midY - 3.31 * radiusScale * sin(Angle(degrees: 43.5).radians)
            ),
            
            control2: CGPoint(
                x: rect.midX + 2 * radiusScale * sin(Angle(degrees: 46.5).radians),
                y: rect.midY - 3.31 * radiusScale * sin(Angle(degrees: 43.5).radians)
            ))
        
        path.closeSubpath()
        return path
    }
}

struct BlinkingEyeAnimationState3Body: View {
    let mainEyeColor: Color
    
    var body: some View {
        ZStack {
            ForEach(1..<7, id: \.self) { i in

                // fill lower part
                ClosedEye(mainEyeColor: mainEyeColor)
                    .rotation3DEffect(
                        .degrees(iterToDegreesRatioLowerEyePartState3(iter: i)),
                        axis: (x: 1, y: 0, z: 0))
                
                // fill upper part
                ClosedEye(mainEyeColor: mainEyeColor)
                    .rotation3DEffect(
                        .degrees(iterToDegreesRatioUpperEyePartState3(iter: i)),
                        axis: (x: 1, y: 0, z: 0))
            }
            
            // fill the middle
            MainEyeShapeMiddlePartHelperState3()
                .foregroundStyle(mainEyeColor)
        }
    }
}
    
struct BlinkingEyeAnimationState3: View {
    let mainEyeColor: Color
    let sectorColor:  Color
    let pupilColor:   Color
    
    var body: some View {
        ZStack {
            // upper part
            ClosedEye(mainEyeColor: mainEyeColor)
                .rotation3DEffect(.degrees(115), axis: (x: 1, y: 0, z: 0))
            
            // middle part
            BlinkingEyeAnimationState3Body(mainEyeColor: mainEyeColor)
            
            // lower part
            ClosedEye(mainEyeColor: mainEyeColor)
                .rotation3DEffect(.degrees(25), axis: (x: 1, y: 0, z: 0))
            
            // sector
            MyCustomCircle(radius:     3,
                           startAngle: -43.5,
                           endAngle:   223.5,
                           clockwise:  false)
                .foregroundStyle(sectorColor)
            
            // upper sector part
            ZStack {
                ClosedEye(mainEyeColor: mainEyeColor)
                    .rotation3DEffect(.degrees(115), axis: (x: 1, y: 0, z: 0))
                
                ClosedEye(mainEyeColor: mainEyeColor)
                    .rotation3DEffect(.degrees(111), axis: (x: 1, y: 0, z: 0))
            }
            
            // pupil
            MyFullCircle(radius: 0.9)
                .foregroundStyle(pupilColor)
        }.drawingGroup()
    }
}



#Preview {
    VStack(spacing: -300) {
        BlinkingEyeAnimationState2(mainEyeColor: .black,
                                   sectorColor:  .white,
                                   pupilColor:   .black)
        .aspectRatio(0.5, contentMode: .fit)
        .frame(height: 500)
        
        BlinkingEyeAnimationState3(mainEyeColor: .black,
                                   sectorColor:  .white,
                                   pupilColor:   .black)
        .aspectRatio(0.5, contentMode: .fit)
        .frame(height: 500)
    }
    
//    ZStack() {
//        BlinkingEyeAnimationState2(mainEyeColor: .black,
//                                   sectorColor:  .white,
//                                   pupilColor:   .black)
//
//        BlinkingEyeAnimationState3(mainEyeColor: .red,
//                                   sectorColor:  .white,
//                                   pupilColor:   .black)
//        .opacity(0.8)
//    }
}
