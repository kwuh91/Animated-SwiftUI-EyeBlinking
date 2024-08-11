//
//  ClosedEye.swift
//  VisageVerify
//
//  Created by Nikita Ochkin on 06.08.2024.
//

import SwiftUI

struct MainClosedEyeBody: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        // Define scaling factors based on the rect size
        let widthScale  = rect.width  / 14.5
        let heightScale = rect.height / 28.0

        // A (+x)
        path.move(to: CGPoint(x: rect.midX + 7.19 * widthScale,
                              y: rect.midY + 0    * heightScale))
        
        // C (+x) (-y)
        path.addCurve(
            to: CGPoint(x: rect.midX + 3.54  * widthScale,
                        y: rect.midY - -3.74 * heightScale),
            
            control1: CGPoint(x: rect.midX + 7.19 * widthScale,
                              y: rect.midY - -1   * heightScale),
            
            control2: CGPoint(x: rect.midX + 5.56 * widthScale,
                              y: rect.midY - -2.7 * heightScale))
        
        // E (-y)
        path.addCurve(
            to: CGPoint(x: rect.midX + 0     * widthScale,
                        y: rect.midY - -4.59 * heightScale),
            
            control1: CGPoint(x: rect.midX + 3.54  * widthScale,
                              y: rect.midY - -3.74 * heightScale),
            
            control2: CGPoint(x: rect.midX + 1.76  * widthScale,
                              y: rect.midY - -4.62 * heightScale))

        // C (-x) (-y)
        path.addCurve(
            to: CGPoint(x: rect.midX - 3.54  * widthScale,
                        y: rect.midY - -3.74 * heightScale),
            
            control1: CGPoint(x: rect.midX - 1.76  * widthScale,
                              y: rect.midY - -4.62 * heightScale),
            
            control2: CGPoint(x: rect.midX - 3.54  * widthScale,
                              y: rect.midY - -3.74 * heightScale))
        
        // A (-x)
        path.addCurve(
            to: CGPoint(x: rect.midX - 7.19 * widthScale,
                        y: rect.midY - 0    * heightScale),
            
            control1: CGPoint(x: rect.midX - 5.56 * widthScale,
                              y: rect.midY - -2.7 * heightScale),
            
            control2: CGPoint(x: rect.midX - 7.19 * widthScale,
                              y: rect.midY - -1   * heightScale))
        
        // Cy+ (-x) (-y)
        path.addCurve(
            to: CGPoint(x: rect.midX + 0.9  * widthScale,
                        y: rect.midY + 3.84 * heightScale),
            
            control1: CGPoint(x: rect.midX - 7.0  * widthScale,
                              y: rect.midY - 0.42 * heightScale),
            
            control2: CGPoint(x: rect.midX - 4.54 * widthScale,
                              y: rect.midY + 4.34 * heightScale))
        
        path.addCurve(
            to: CGPoint(x: rect.midX + 7.19 * widthScale,
                        y: rect.midY + 0    * heightScale),
            
            control1: CGPoint(x: rect.midX + 4.54 * widthScale,
                              y: rect.midY + 3.34 * heightScale),
            
            control2: CGPoint(x: rect.midX + 7.0  * widthScale,
                              y: rect.midY - 0.42 * heightScale))
        
        path.closeSubpath()
        return path
    }
}

struct ClosedEye: View {
    let mainEyeColor: Color
    
    var body: some View {
        ZStack {
            // main eye body
            MainClosedEyeBody()
                .foregroundStyle(mainEyeColor)
        }
        .contentShape(MainClosedEyeBody())
    }
}

#Preview {
    ClosedEye(mainEyeColor: .black)
}
