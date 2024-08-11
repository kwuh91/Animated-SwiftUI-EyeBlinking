//
//  EyeExtras.swift
//  VisageVerify
//
//  Created by Nikita Ochkin on 12.08.2024.
//

import SwiftUI

struct MyCustomCircle: Shape {
    let radius:     CGFloat
    let startAngle: CGFloat
    let endAngle:   CGFloat
    let clockwise:  Bool
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        let radiusScale = rect.width / 14.0
        
        path.addArc(center:     CGPoint(x: rect.midX,
                                        y: rect.midY),
                    radius:     radius * radiusScale ,
                    startAngle: .degrees(startAngle),
                    endAngle:   .degrees(endAngle),
                    clockwise:  clockwise)
        
        path.closeSubpath()
        return path
    }
}

#Preview {
    MyCustomCircle(radius:     3,
                   startAngle: 0,
                   endAngle:   180,
                   clockwise:  false)
}
