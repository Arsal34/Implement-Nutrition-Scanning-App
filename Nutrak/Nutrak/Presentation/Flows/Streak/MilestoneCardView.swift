//
//  MilestoneCardView.swift
//  Nutrak
//
//  Created by M1 on 29/04/25.
//

import SwiftUI

struct MilestoneCardView: View {
    let imageColor: LinearGradient
    let text: String
    let backgroundColor: Color
    let isSelected: Bool

    var body: some View {
        HStack(spacing: 12) {
            ZStack {
                PolygonShape(sides: 6)
                    .fill(imageColor)
                    .overlay(
                        PolygonShape(sides: 6)
                            .stroke(Color.white, lineWidth: 2)
                    )
                    .frame(width: 24, height: 24)

                Image(systemName: "trophy.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 8, height: 8)
                    .foregroundColor(.white)
            }

            Text(text)
                .textStyle(AppTypography.labelLarge)
                .foregroundColor(AppColors.TextLightMode.highEmp)

            Spacer()
            
            if isSelected {
                ZStack {
                    Circle()
                        .fill(Color.green)
                        .frame(width: 24, height: 24)
                    
                    Image(systemName: "checkmark")
                        .foregroundColor(.white)
                        .font(.system(size: 12, weight: .bold))
                }
            }
        }
        .padding()
        .background(backgroundColor)
        .cornerRadius(12)
        .shadow(color: .black.opacity(0.2), radius: 4, x: 0, y: 2)
    }
}
