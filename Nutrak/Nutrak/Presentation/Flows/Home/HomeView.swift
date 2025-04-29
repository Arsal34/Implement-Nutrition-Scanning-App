//
//  HomeView.swift
//  Nutrak
//
//  Created by M1 on 27/04/2025.
//

import SwiftUI

struct HomeView: View {
    
    @State private var selectedIndex = 0
    @State private var title = ""
    @State private var showFoodScanningView = false
    @AppStorage("selectedTabIndex") private var selectedTabIndex: Int = 0

    var body: some View {
        NavigationStack {
            ZStack {
                VStack() {
                    Spacer()
                    
                    Group {
                        if selectedTabIndex == 0 {
                            Text(AppStrings.pressScan)
                                .textStyle(AppTypography.headlineLarge)
                                .foregroundColor(AppColors.primary)
                        } else if selectedTabIndex == 1 {
                            NutritionResultsView()
                        } else if selectedTabIndex == 2 {
                            StreakView()
                        }
                    }
                    
                    Spacer()
                    
                    ZStack {
                        HStack {
                            Spacer()
                            Button(action: {
                            }) {
                                Image(systemName: "house")
                                    .resizable()
                                    .frame(width: 24, height: 24)
                            }
                            
                            Spacer()
                            Spacer()
                            
                            Button(action: {
                            }) {
                                Image(systemName: "person")
                                    .resizable()
                                    .frame(width: 24, height: 24)
                            }
                            
                            Spacer()
                        }
                        .frame(height: 60)
                        .background(Color.white.shadow(radius: 5))
                        
                        Button(action: {
                            showFoodScanningView = true
                        }) {
                            AppImages.scanImg
                                .resizable()
                                .frame(width: 56, height: 56)
                                .background(Color.white)
                                .clipShape(Circle())
                                .shadow(radius: 4)
                        }
                        .offset(y: -20)
                    }
                }
            }
            .ignoresSafeArea(edges: .bottom)
            .padding(.top, 70)
            .navigationBarBackButtonHidden(true)
            .navigationBarHidden(true)
            .background(AppColors.white)
            .fullScreenCover(isPresented: $showFoodScanningView) {
                FoodScanningView(showFoodScanningView: $showFoodScanningView)
            }
            .onAppear {
                selectedTabIndex = 0
            }
        }
    }
   }

struct HomeView_Preview: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
