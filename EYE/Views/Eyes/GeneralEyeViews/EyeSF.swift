//
//  Icon.swift
//  VisageVerify
//
//  Created by Nikita Ochkin on 13.07.2024.
//

import SwiftUI

struct EyeSF: View {
    let iconName:   String
    let iconColor:  Color
    let iconSize:   CGFloat
    let fontWeight: Font.Weight
    
    var body: some View {
        Image(systemName: iconName)
            // .renderingMode(.template)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(height: iconSize)
            .font(Font.title.weight(fontWeight))
            .foregroundStyle(iconColor)
    }
}

#Preview {
//    Icon(iconName: "eye",
//         iconColor: .black,
//         iconSize: 100,
//         fontWeight: .thin)
    
    EyeSF(iconName:   "eye.fill",
          iconColor:  Color.black,
         iconSize:   70,
         fontWeight: .thin)
}
