//
//  SwiftUIView.swift
//  VisageVerify
//
//  Created by Nikita Ochkin on 05.08.2024.
//

import SwiftUI

struct MainOpenedEyeBody: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        // Define scaling factors based on the rect size
        let widthScale  = rect.width  / 14.5
        let heightScale = rect.height / 28.0

        // O
        path.move(to: CGPoint(x: rect.midX, y: rect.midY))
        
        // A (+x)
        path.addLine(
            to: CGPoint(x: rect.midX + 7.19 * widthScale,
                        y: rect.midY + 0    * heightScale))
        
        // C (+x) (+y)
        path.addCurve(
            to: CGPoint(x: rect.midX + 3.54  * widthScale,
                        y: rect.midY + -3.74 * heightScale),
            
            control1: CGPoint(x: rect.midX + 7.19 * widthScale,
                              y: rect.midY + -1   * heightScale),
            
            control2: CGPoint(x: rect.midX + 5.56 * widthScale,
                              y: rect.midY + -2.7 * heightScale))
        
        // E (+y)
        path.addCurve(
            to: CGPoint(x: rect.midX + 0     * widthScale,
                        y: rect.midY + -4.59 * heightScale),
            
            control1: CGPoint(x: rect.midX + 3.54  * widthScale,
                              y: rect.midY + -3.74 * heightScale),
            
            control2: CGPoint(x: rect.midX + 1.76  * widthScale,
                              y: rect.midY + -4.62 * heightScale))
        
        // C (-x) (+y)
        path.addCurve(
            to: CGPoint(x: rect.midX - 3.54  * widthScale,
                        y: rect.midY + -3.74 * heightScale),
            
            control1: CGPoint(x: rect.midX - 1.76  * widthScale,
                              y: rect.midY + -4.62 * heightScale),
            
            control2: CGPoint(x: rect.midX - 3.54  * widthScale,
                              y: rect.midY + -3.74 * heightScale))
        
        // A (-x)
        path.addCurve(
            to: CGPoint(x: rect.midX - 7.19 * widthScale,
                        y: rect.midY + 0    * heightScale),
            
            control1: CGPoint(x: rect.midX - 5.56 * widthScale,
                              y: rect.midY + -2.7 * heightScale),
            
            control2: CGPoint(x: rect.midX - 7.19 * widthScale,
                              y: rect.midY + -1   * heightScale))
        
        // C (-x) (-y)
        path.addCurve(
            to: CGPoint(x: rect.midX - 3.54 * widthScale,
                        y: rect.midY + 3.74 * heightScale),
            
            control1: CGPoint(x: rect.midX - 7.19 * widthScale,
                              y: rect.midY + 1    * heightScale),
            
            control2: CGPoint(x: rect.midX - 5.56 * widthScale,
                              y: rect.midY + 2.7  * heightScale))
        
        // E (-y)
        path.addCurve(
            to: CGPoint(x: rect.midX + 0    * widthScale,
                        y: rect.midY + 4.59 * heightScale),
            
            control1: CGPoint(x: rect.midX - 3.54 * widthScale,
                              y: rect.midY + 3.74 * heightScale),
            
            control2: CGPoint(x: rect.midX - 1.76 * widthScale,
                              y: rect.midY + 4.62 * heightScale))
        
        // C (+x) (-y)
        path.addCurve(
            to: CGPoint(x: rect.midX + 3.54 * widthScale,
                        y: rect.midY + 3.74 * heightScale),
            
            control1: CGPoint(x: rect.midX + 1.76 * widthScale,
                              y: rect.midY + 4.62 * heightScale),
            
            control2: CGPoint(x: rect.midX + 3.54 * widthScale,
                              y: rect.midY + 3.74 * heightScale))
        
        // A (+x)
        path.addCurve(
            to: CGPoint(x: rect.midX + 7.19 * widthScale,
                        y: rect.midY + 0    * heightScale),
            
            control1: CGPoint(x: rect.midX + 5.56 * widthScale,
                              y: rect.midY + 2.7  * heightScale),
            
            control2: CGPoint(x: rect.midX + 7.19 * widthScale,
                              y: rect.midY + 1    * heightScale))
        
        path.closeSubpath()
        return path
    }
}

struct MyFullCircle: Shape {
    let radius: CGFloat

    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        let radiusScale = rect.width / 14.0
        
        path.addArc(center:     CGPoint(x: rect.midX,
                                        y: rect.midY),
                    radius:     radius * radiusScale ,
                    startAngle: .degrees(0),
                    endAngle:   .degrees(360),
                    clockwise:  true)
        
        path.closeSubpath()
        return path
    }
}

struct SimpleEyeShape: Shape {
    let startingPoint: CGPoint
    let mult:          CGFloat
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        // let width = rect.size.width
        // let height = rect.size.height
        
        path.move(to: startingPoint)
        
        path.addLine(to: CGPoint(x: startingPoint.x + 7.19 * mult,
                                 y: startingPoint.y + -0   * mult))
        
        path.addCurve(to:       CGPoint(x: startingPoint.x + 0     * mult,
                                        y: startingPoint.y + -4.59 * mult),
                      control1: CGPoint(x: startingPoint.x + 5.54  * mult,
                                        y: startingPoint.y + -3.74 * mult),
                      control2: CGPoint(x: startingPoint.x + 1.76  * mult,
                                        y: startingPoint.y + -4.62 * mult))
        
        path.addCurve(to:       CGPoint(x: startingPoint.x - 7.19 * mult,
                                        y: startingPoint.y + -0   * mult),
                      control1: CGPoint(x: startingPoint.x - 1.76  * mult,
                                        y: startingPoint.y + -4.62 * mult),
                      control2: CGPoint(x: startingPoint.x - 5.54  * mult,
                                        y: startingPoint.y + -3.74 * mult))
        
        path.addCurve(to:       CGPoint(x: startingPoint.x + 0     * mult,
                                        y: startingPoint.y + 4.59 * mult),
                      control1: CGPoint(x: startingPoint.x - 5.54  * mult,
                                        y: startingPoint.y + 3.74 * mult),
                      control2: CGPoint(x: startingPoint.x - 1.76  * mult,
                                        y: startingPoint.y + 4.62 * mult))
        
        path.addCurve(to:       CGPoint(x: startingPoint.x + 7.19 * mult,
                                        y: startingPoint.y + -0   * mult),
                      control1: CGPoint(x: startingPoint.x + 1.76  * mult,
                                        y: startingPoint.y + 4.62 * mult),
                      control2: CGPoint(x: startingPoint.x + 5.54  * mult,
                                        y: startingPoint.y + 3.74 * mult))
        
        path.closeSubpath()
        return path
    }
}

struct OpenEye: View {
    let mainEyeColor: Color
    let sectorColor:  Color
    let pupilColor:   Color
    
    var body: some View {
        ZStack {
            // main eye body
            MainOpenedEyeBody()
                .foregroundStyle(mainEyeColor)
            
            // sector
            MyFullCircle(radius: 3)
                .foregroundStyle(sectorColor)

            // pupil
            MyFullCircle(radius: 0.9)
                .foregroundStyle(pupilColor)
        }
        .contentShape(MainOpenedEyeBody())
        .drawingGroup()
    }
}

#Preview {
    VStack(spacing: -150) {

        Image(systemName: "eye.fill")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(height: 157.5)
            .font(Font.title.weight(.thin))
    
        OpenEye(mainEyeColor: .black,
                sectorColor:  .white,
                pupilColor:   .black)
            .aspectRatio(0.5, contentMode: .fit)
            .frame(height: 500)
            .onTapGesture{
                print("eye tapped!")
            }
        
    }
}
