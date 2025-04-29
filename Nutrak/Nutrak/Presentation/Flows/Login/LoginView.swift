//
//  Login.swift
//  Nutrak
//
//  Created by M1 on 27/04/2025.
//

import SwiftUI

struct LoginView: View {
    @StateObject private var viewModel = LoginViewModel()
    @State private var showPasswordScreen = false
    @State private var showAlert = false
    @State private var email: String = ""
    
    var body: some View {
        ScrollView {
            ZStack {
                VStack {
                    AppImages.login
                        .resizable()
                        .scaledToFill()
                        .frame(width: UIScreen.main.bounds.width)
                        .clipped()
                        .ignoresSafeArea()
                    
                    Spacer()
                    Text(AppStrings.signIn)
                        .textStyle(AppTypography.headlineLarge)
                        .foregroundColor(AppColors.TextLightMode.highEmp)
                        .padding(.bottom, 4)
                    
                    Text(AppStrings.loginDesc)
                        .textStyle(AppTypography.bodyLarge)
                        .foregroundColor(AppColors.TextLightMode.mediumEmp)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 16)
                        .padding(.bottom, 24)
                    
                    HStack(spacing: 16) {
                        Button(action: {
                            showAlert = true
                        }) {
                            Text(AppStrings.google)
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(AppColors.white)
                                .foregroundColor(AppColors.TextLightMode.highEmp)
                                .cornerRadius(10)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(AppColors.black, lineWidth: 1)
                                )
                        }
                        
                        Button(action: {
                            showAlert = true
                        }) {
                            Text(AppStrings.Apple)
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(AppColors.white)
                                .foregroundColor(AppColors.TextLightMode.highEmp)
                                .cornerRadius(10)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(AppColors.black, lineWidth: 1)
                                )
                        }
                    }
                    .padding(.horizontal, 16)
                    
                    HStack {
                        Rectangle()
                            .frame(height: 1)
                            .foregroundColor(AppColors.Neutral.n100)
                        
                        Text(AppStrings.or)
                            .foregroundColor(AppColors.TextLightMode.lowEmp)
                            .padding(.horizontal, 8)
                        
                        Rectangle()
                            .frame(height: 1)
                            .foregroundColor(AppColors.Neutral.n100)
                    }
                    .padding(.horizontal, 32)
                    .padding(.vertical, 16)
                    
                    VStack() {
                        HStack {
                            Text(AppStrings.Email)
                                .foregroundColor(AppColors.TextLightMode.disabled)
                                .textStyle(AppTypography.labelLarge)
                            Spacer()
                        }
                        .padding(.bottom, 8)
                        
                        TextField(AppStrings.enterYourEmail, text: $email)
                            .keyboardType(.emailAddress)
                            .autocapitalization(.none)
                            .padding(.horizontal, 12)
                            .frame(height: 44)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(AppColors.black, lineWidth: 0.7)
                            )
                            .foregroundColor(AppColors.TextLightMode.disabled)
                            .cornerRadius(8)
                            .onChange(of: email) { newValue in
                                viewModel.validateEmail(newValue)
                            }
                        
                        HStack {
                            Text(viewModel.emailError ?? " ")
                                .foregroundColor(.red)
                                .textStyle(AppTypography.labelSmall)
                            Spacer()
                        }
                        
                        HStack {
                            Button(action: {
                                withAnimation {
                                    if !email.isEmpty {
                                        showPasswordScreen = true
                                    }
                                }
                            }) {
                                Text(AppStrings.next)
                                    .padding(.horizontal, 20)
                                    .frame(height: 44)
                                    .frame(maxWidth: .infinity)
                                    .background(AppColors.primary)
                                    .foregroundColor(AppColors.white)
                                    .cornerRadius(10)
                            }
                        }
                        
                        
                        HStack(spacing: 4) {
                            Text(AppStrings.noAccount)
                                .foregroundColor(AppColors.black)
                                .textStyle(AppTypography.bodyMedium)
                                .fixedSize(horizontal: true, vertical: false)
                            
                            Button(action: {
                            }) {
                                Text(AppStrings.signUp)
                                    .foregroundColor(AppColors.primary)
                                    .textStyle(AppTypography.bodyMedium)
                                    .bold()
                            }
                            .fixedSize(horizontal: true, vertical: false)
                        }
                        .frame(maxWidth: .infinity)
                        .multilineTextAlignment(.center)
                        .padding(.bottom, 20)
                        
                    }
                    .padding(.horizontal, 16)
                    .padding(.bottom, 40)
                }
            }
            .navigationBarBackButtonHidden(true)
            .navigationBarHidden(true)
            .navigationDestination(isPresented: $showPasswordScreen) {
                PasswordView(email: email)
            }
        }
        .background(AppColors.white)
    }
}

struct LoginView_Preview: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
