//
//  CircularLoaderView.swift
//  Nutrak
//
//  Created by M1 on 28/04/25.
//

import SwiftUI

struct CircularBarLoaderView: View {
    var progress: Double
    private let totalBars = 35
    private let radius: CGFloat = 60
    private let lineLength: CGFloat = 24
    private let lineWidth: CGFloat = 2

    var body: some View {
        ZStack {
            ForEach(0..<totalBars, id: \.self) { index in
                Capsule()
                    .fill(color(for: index))
                    .frame(width: lineWidth, height: lineLength)
                    .offset(y: -radius)
                    .rotationEffect(.degrees(Double(index) / Double(totalBars) * 360))
            }
        }
        .frame(width: 144, height: 144)
        .background(AppColors.white)
    }

    private func color(for index: Int) -> Color {
        let maxFilled = Int(progress * Double(totalBars))
        let tailStart = maxFilled

        if index < tailStart {
            return AppColors.accent.opacity(0.8)
        } else if index < maxFilled {
            let relativeIndex = Double(index - tailStart)
            let fade = relativeIndex
            return AppColors.accent.opacity(0.5 + 0.5 * fade)
        } else {
            return AppColors.accent.opacity(0.05)
        }
    }
}
