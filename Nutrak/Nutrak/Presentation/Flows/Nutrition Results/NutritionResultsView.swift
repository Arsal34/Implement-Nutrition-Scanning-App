//
//  NutritionResultsView.swift
//  Nutrak
//
//  Created by M1 on 28/04/25.
//

import SwiftUI

struct NutritionResultsView: View {
    @State var showStreaks = false
    @AppStorage("selectedTabIndex") private var selectedTabIndex: Int = 0

    let nutritionMockData = NutritionMockData()
    
    var body: some View {
        ScrollView {
            VStack {
                ZStack(alignment: .bottomLeading) {
                    AppImages.pizza
                        .resizable()
                        .scaledToFit()
                    
                    LinearGradient(
                        gradient: Gradient(colors: [Color.white.opacity(0),     Color.white.opacity(1)]),
                        startPoint: .top,
                        endPoint: .bottom
                    )
                    .frame(height: 80)
                    .opacity(0.7)
                    
                    VStack(alignment: .leading) {
                        Text("Food")
                            .textStyle(AppTypography.labelSmall)
                            .foregroundColor(AppColors.black)
                            .padding(4)
                            .background(AppColors.SecondaryLight.n100)
                            .cornerRadius(10)
                            .padding(5)
                        
                        
                        Text("Pepperoni Pizza")
                            .textStyle(AppTypography.headlineMedium)
                            .foregroundColor(AppColors.black)
                            .padding(.leading, 4)
                    }
                    .padding(10)
                }
                .frame(maxWidth: .infinity)
                .ignoresSafeArea()
                
                NutritionDetailView(headings: nutritionMockData.headings, data: nutritionMockData.data)
                    .padding(.horizontal, 6)
                    .padding(.bottom, 24)
                    .background(AppColors.white)
                
                
                ChartView(data: nutritionMockData.calorieData)
                    .padding(.horizontal, 20)
                
                Button(action: {
                    withAnimation {
                        selectedTabIndex = 2
                    }
                }) {
                    Text("Save to Daily Log")
                        .textStyle(AppTypography.labelLarge)
                        .frame(height: 44)
                        .frame(maxWidth: .infinity)
                        .background(AppColors.primary)
                        .foregroundColor(AppColors.black)
                        .cornerRadius(10)
                }
                .padding(.horizontal, 20)
                .padding(.top, 20)
                .padding(.bottom, 12)
                .background(Color.clear)
                .shadow(color: AppColors.black.opacity(0.1), radius: 0.5)

                HStack(spacing: 4) {
                    Text("Want more insights?")
                        .foregroundColor(AppColors.TextLightMode.mediumEmp)
                        .textStyle(AppTypography.labelLarge)
                        .fixedSize(horizontal: true, vertical: false)
                    
                    Button(action: {
                        showStreaks = true
                    }) {
                        Text("Upgrade to Premium")
                            .foregroundColor(AppColors.black)
                            .textStyle(AppTypography.labelLarge)
                            .bold()
                    }
                    .fixedSize(horizontal: true, vertical: false)
                }
                .frame(maxWidth: .infinity)
                .multilineTextAlignment(.center)
                .padding(.bottom, 20)
            }
        }
        .background(AppColors.white)
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
        .navigationDestination(isPresented: $showStreaks) {
            NutritionResultsView()
        }
    }
}

#Preview {
    NutritionResultsView()
}
