//
//  OnboardingView.swift
//  Nutrak
//
//  Created by M1 on 27/04/2025.
//

import SwiftUI

import SwiftUI

struct OnboardingView: View {
    @StateObject private var viewModel = OnboardingViewModel()
    @State private var moveToLogin = false

    var body: some View {
        ZStack {
            TabView(selection: $viewModel.currentPage) {
                ForEach(Array(viewModel.pages.enumerated()), id: \.offset) { index, page in
                    ZStack {
                        page.imageName
                            .resizable()
                            .scaledToFill()
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                        
                        VStack(spacing: 16) {
                            Spacer()
                            Text(page.title)
                                .textStyle(AppTypography.headlineLarge)
                                .foregroundColor(AppColors.TextLightMode.highEmp)

                            Text(page.description)
                                .textStyle(AppTypography.bodyLarge)
                                .foregroundColor(AppColors.TextLightMode.mediumEmp)
                                .multilineTextAlignment(.center)
                                .padding(.horizontal, 16)

                        }
                        .padding(.horizontal, 24)
                        .padding(.bottom, 164)
                    }
                    .tag(index)
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            
            VStack {
                HStack {
                    Spacer()
                    Button(action: {
                            moveToLogin = true
                    }) {
                        Text(AppStrings.skip)
                            .foregroundColor(AppColors.white)
                            .textStyle(AppTypography.bodyMedium)
                            .padding(.top, 20)
                            .padding(.trailing, 24)
                    }
                }
                Spacer()
            }
            
            VStack {
                Spacer()
                
                HStack(spacing: 16) {
                    if viewModel.currentPage != 0 {
                        Button(action: {
                            withAnimation {
                                viewModel.currentPage -= 1
                            }
                        }) {
                            Text(AppStrings.back)
                                .padding(.horizontal, 24)
                                .frame(height: 44)
                                .background(AppColors.white.opacity(0.3))
                                .foregroundColor(AppColors.TextLightMode.highEmp)
                                .cornerRadius(10)
                        }
                    }
                    
                    Button(action: {
                        withAnimation {
                            if viewModel.isLastPage {
                                moveToLogin = true
                            } else {
                                viewModel.currentPage += 1
                            }
                        }
                    }) {
                        Text(viewModel.isLastPage ? AppStrings.getStarted : AppStrings.next)
                            .padding(.horizontal, viewModel.isLastPage ? 32 : 24)
                            .frame(height: 44)
                            .background(AppColors.primary)
                            .foregroundColor(AppColors.white)
                            .cornerRadius(10)
                    }
                }
                .padding(.horizontal, 16)
                .padding(.bottom, 12)
            }
        }
        .background(AppColors.white)
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
        .navigationDestination(isPresented: $moveToLogin) {
            LoginView()
        }
    }
}

struct OnboardingView_Preview: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
