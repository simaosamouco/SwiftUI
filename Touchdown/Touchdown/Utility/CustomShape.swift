//
//  CustomShape.swift
//  Touchdown
//
//  Created by Simão Neves Samouco on 09/10/2023.
//

import SwiftUI

struct CustomShape: Shape {
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: [.topLeft, .topRight], cornerRadii: CGSize(width: 35, height: 35))
        return Path(path.cgPath)
    }
}

#Preview {
    CustomShape()
        .previewLayout(.fixed(width: 428, height: 120))
        .padding()
}
