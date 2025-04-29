//
//  StreakView.swift
//  Nutrak
//
//  Created by M1 on 29/04/25.
//

import SwiftUI

struct StreakView: View {
    var streakCount = 5

    var body: some View {
        ScrollView {
            VStack {
                ZStack {
                    AppImages.streak
                        .resizable()
                        .scaledToFit()
                    
                    Text(String(streakCount))
                        .font(.system(size: 52))
                        .fontWeight(.bold)
                        .foregroundColor(AppColors.black)
                        .shadow(radius: 4)
                        .offset(y: 10)
                }
                .frame(width: 95, height: 120)
                .padding(.top, 20)
                
                VStack(spacing: 2) {
                    Text("You're on a")
                        .textStyle(AppTypography.bodyMedium)
                        .foregroundColor(AppColors.black)
                    
                    Text("\(streakCount) days Streak!")
                        .textStyle(AppTypography.titleLarge)
                        .foregroundColor(AppColors.black)
                    
                    
                    Text("Keep it up!")
                        .textStyle(AppTypography.bodyMedium)
                        .foregroundColor(AppColors.black)
                    
                }
                .padding(.top, 6)
                
                ZStack {
                    StreakWidget()
                        .padding()
                    
                    HStack(spacing: 8) {
                        AppImages.badge
                            .resizable()
                            .scaledToFit()
                            .frame(width: 15, height: 15)
                        
                        Text("10-day streak achiever")
                            .textStyle(AppTypography.bodySmall)
                            .foregroundStyle(AppColors.black)
                    }
                    .padding(.horizontal, 6)
                    .padding(.vertical, 6)
                    .background(AppColors.radial)
                    .cornerRadius(20)
                    .offset(y: 65)
                }
                
                HStack {
                    Text("Milestones")
                        .textStyle(AppTypography.displaySmall)
                    
                    Spacer()
                    
                    Button(action: {
                        
                    }) {
                        Text("View All")
                            .textStyle(AppTypography.labelMedium)
                            .foregroundColor(AppColors.TextLightMode.mediumEmp)
                    }
                    
                    Image(systemName: "chevron.right")
                        .textStyle(AppTypography.labelMedium)
                        .foregroundColor(AppColors.TextLightMode.mediumEmp)
                }
                .padding(.horizontal, 20)
                
                MilestoneCardView(
                    imageColor: LinearGradient(colors: [.orange, .pink], startPoint: .top, endPoint: .bottom),
                    text: "7-day streak achiever",
                    backgroundColor: AppColors.primary,
                    isSelected: true
                )
                .padding(.bottom, 12)
                .padding(.horizontal, 20)
                
                MilestoneCardView(
                    imageColor: LinearGradient(colors: [.orange, .yellow], startPoint: .top, endPoint: .bottom),
                    text: "10-day streak achiever",
                    backgroundColor: AppColors.blue,
                    isSelected: false
                )
                .padding(.bottom, 12)
                .padding(.horizontal, 20)
                
                
                MilestoneCardView(
                    imageColor: LinearGradient(colors: [.green, .purple], startPoint: .top, endPoint: .bottom),
                    text: "20-day streak achiever",
                    backgroundColor: AppColors.radial,
                    isSelected: true
                )
                .padding(.bottom, 12)
                .padding(.horizontal, 20)
                
                MilestoneCardView(
                    imageColor: LinearGradient(colors: [.red, .green], startPoint: .top, endPoint: .bottom),
                    text: "30-day streak achiever",
                    backgroundColor: AppColors.blue,
                    isSelected: false
                )
                .padding(.bottom, 12)
                .padding(.horizontal, 20)
            }
        }
        .background(AppColors.white)

    }
}

#Preview {
    StreakView(streakCount: 5)
}
