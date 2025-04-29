//
//  ChartView.swift
//  Nutrak
//
//  Created by M1 on 29/04/25.
//

import SwiftUI

struct BarChartData: Identifiable {
    let id = UUID()
    let day: String
    let value: CGFloat
}

struct ChartView: View {
    let data: [BarChartData]
    let maxHeight: CGFloat = 120
    @State private var animated: Bool = false
    
    var body: some View {
        VStack(alignment: .leading) {
            
            Text("Weekly Meal Nutrition")
                .textStyle(AppTypography.headlineLarge)
                .foregroundStyle(AppColors.TextLightMode.highEmp)
                .bold()
                .padding(.bottom, 8)
                .padding(.top, 12)
                .padding(.horizontal, 16)
            
            
            HStack(alignment: .bottom, spacing: 0) {
                Spacer().frame(width: 16)
                
                ForEach(data.indices, id: \.self) { index in
                    let item = data[index]
                    
                    VStack {
                        
                        ZStack {
                            RoundedRectangle(cornerRadius: 6)
                                .fill(
                                    LinearGradient(
                                        gradient: Gradient(colors: [Color.green.opacity(0.7), AppColors.primary]),
                                        startPoint: .top,
                                        endPoint: .bottom
                                    )
                                )
                                .frame(width: 8)
                                .scaleEffect(y: animated ? (item.value / maxValue()) : 0, anchor: .bottom)
                                .animation(.easeOut(duration: 0.5).delay(Double(index) * 0.05), value: animated)
                                .shadow(color: AppColors.primary.opacity(0.2), radius: 4, x: 0, y: 2)
                                .frame(height: maxHeight, alignment: .bottom)
                        }                        .frame(height: maxHeight)
                        .frame(width: 20)
                        
                        Text(item.day)
                            .textStyle(AppTypography.bodyMedium)
                            .foregroundColor(AppColors.TextLightMode.lowEmp)
                            .padding(.top, 8)
                            .padding(.bottom, 12)
                    }
                    
                    if index < data.count - 1 {
                        Spacer()
                    }
                }
                
                Spacer().frame(width: 16)
            }
        }
        .frame(maxWidth: .infinity)
        .background(AppColors.Neutral.n100)
        .cornerRadius(12)
        .onAppear {
            animated = true
        }
    }
    
    private func maxValue() -> CGFloat {
        data.map { $0.value }.max() ?? 1
    }
}
