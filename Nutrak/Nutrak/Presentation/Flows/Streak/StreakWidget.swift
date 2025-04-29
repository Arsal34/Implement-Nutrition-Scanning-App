//
//  StreakWidget.swift
//  Nutrak
//
//  Created by M1 on 29/04/25.
//

import Foundation
import SwiftUI

struct StreakModel: Identifiable {
    let id = UUID()
    let date: Date
    let isStreak: Bool
}

struct StreakWidget: View {
    let streakData = last7DaysStreaks()

    var body: some View {
        VStack(spacing: 8) {

            HStack(spacing: 12) {
                ForEach(streakData) { day in
                    Text(day.date.formatted("E"))
                        .font(.caption)
                        .frame(maxWidth: .infinity)
                        .foregroundColor(day.isStreak ? AppColors.SecondaryLight.n600 : AppColors.black)
                }
            }

            HStack(spacing: 12) {
                ForEach(streakData) { day in
                    if day.isStreak {
                        AppImages.date
                            .frame(maxWidth: .infinity)
                    } else {
                        Text(day.date.formatted("d"))
                            .font(.body)
                            .foregroundColor(.gray)
                            .frame(maxWidth: .infinity)
                    }
                }
            }

            HStack(spacing: 12) {
                ForEach(streakData) { day in
                    Text(day.date.formatted("d"))
                        .font(.caption2)
                        .foregroundColor(AppColors.black)
                        .frame(maxWidth: .infinity)
                }
            }
            .padding(.bottom, 26)
        }
        .padding()
        .background(AppColors.Neutral.n100)
        .cornerRadius(12)
    }
}
