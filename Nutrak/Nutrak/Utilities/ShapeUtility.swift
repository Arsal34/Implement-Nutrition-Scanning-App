//
//  ShapeUtility.swift
//  Nutrak
//
//  Created by M1 on 29/04/25.
//

import SwiftUI

struct HoleShapeMask: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()

        path.addRect(rect)

        let holeSize = CGSize(width: 250, height: 250)
        let holeOrigin = CGPoint(
            x: rect.midX - holeSize.width / 2,
            y: rect.midY - holeSize.height / 2
        )
        let holeRect = CGRect(origin: holeOrigin, size: holeSize)

        path.addRect(holeRect)

        return path
    }
}


struct PolygonShape: Shape {
    var sides: Int

    func path(in rect: CGRect) -> Path {
        guard sides >= 3 else { return Path() }

        let center = CGPoint(x: rect.midX, y: rect.midY)
        let angle = 2 * .pi / CGFloat(sides)
        let radius = min(rect.width, rect.height) / 2

        var path = Path()
        for i in 0..<sides {
            let x = center.x + radius * cos(CGFloat(i) * angle - .pi / 2)
            let y = center.y + radius * sin(CGFloat(i) * angle - .pi / 2)
            if i == 0 {
                path.move(to: CGPoint(x: x, y: y))
            } else {
                path.addLine(to: CGPoint(x: x, y: y))
            }
        }
        path.closeSubpath()
        return path
    }
}
