//
//  PasswordView.swift
//  Nutrak
//
//  Created by M1 on 27/04/2025.
//

import SwiftUI

struct PasswordView: View {
    @StateObject private var viewModel = PasswordViewModel()
    @State private var password: String = ""
    @State private var isSecure: Bool = true
    @State private var showHome: Bool = false
    var email: String
    
    var body: some View {
        VStack {
            AppImages.arsal
                .resizable()
                .scaledToFill()
                .frame(width: 96, height: 96)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.white, lineWidth: 4))
                .padding(.bottom, 16)
            
            Text(AppStrings.welcomeBack)
                .foregroundColor(AppColors.TextLightMode.lowEmp)
                .textStyle(AppTypography.labelMedium)
                .padding(.bottom, 4)
            
            Text(AppStrings.arsal)
                .foregroundColor(AppColors.TextLightMode.highEmp)
                .textStyle(AppTypography.titleLarge)
                .padding(.bottom, 4)
            
            Text(email)
                .padding(.horizontal, 12)
                .padding(.vertical, 4)
                .background(AppColors.Neutral.n100)
                .foregroundColor(AppColors.TextLightMode.mediumEmp)
                .textStyle(AppTypography.bodyMedium)
                .cornerRadius(10)
                .padding(.bottom, 24)
            
            VStack {
                HStack {
                    Text(AppStrings.password)
                        .foregroundColor(AppColors.TextLightMode.mediumEmp)
                        .textStyle(AppTypography.labelMedium)
                        .padding(.bottom, 8)
                    Spacer()
                }
                
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.gray.opacity(0.1))
                        .frame(height: 44)
                    
                    HStack {
                        if isSecure {
                            SecureField(AppStrings.mask, text: $password)
                                .padding(.horizontal, 12)
                                .frame(height: 44)
                                .foregroundColor(AppColors.TextLightMode.highEmp)
                                .cornerRadius(12)
                                .autocapitalization(.none)
                                .onChange(of: password) { newValue in
                                    viewModel.validatePassword(newValue)
                                }
                            
                        } else {
                            TextField(AppStrings.enterPassword, text: $password)
                                .padding(.horizontal, 12)
                                .frame(height: 44)
                                .foregroundColor(AppColors.TextLightMode.highEmp)
                                .cornerRadius(12)
                                .autocapitalization(.none)
                                .onChange(of: password) { newValue in
                                    viewModel.validatePassword(newValue)
                                }
                            
                        }
                        Spacer()
                        Button(action: {
                            isSecure.toggle()
                        }) {
                            Image(systemName: isSecure ? "eye.slash" : "eye")
                                .foregroundColor(.gray)
                        }
                        .padding(.trailing, 12)
                    }
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(AppColors.Neutral.n400)
                    )
                }
                
              
            HStack {
                Text(viewModel.passwordError ?? " ")
                    .foregroundColor(.red)
                    .textStyle(AppTypography.labelSmall)
                Spacer()
            }
            }
            .padding(.horizontal, 20)
            
            Spacer()
            
            HStack {
                Button(action: {
                    showHome = true
                }) {
                    Text(AppStrings.signIn)
                        .padding(.horizontal, 20)
                        .frame(height: 44)
                        .frame(maxWidth: .infinity)
                        .background(viewModel.passwordError != nil ? Color.gray.opacity(0.5) : AppColors.primary)
                        .foregroundColor(AppColors.white)
                        .cornerRadius(10)
                }
                .disabled(viewModel.passwordError != nil)
            }
            .padding(.horizontal, 20)
            
            HStack(spacing: 4) {
                Text("Don't have an account?")
                    .foregroundColor(AppColors.black)
                    .textStyle(AppTypography.bodyMedium)
                    .fixedSize(horizontal: true, vertical: false)
                
                Button(action: {
                }) {
                    Text("Sign Up")
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
        .padding(.top, 70)
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
        .navigationDestination(isPresented: $showHome) {
            HomeView()
        }
        .background(AppColors.white)
    }
    
    
}

struct PasswordView_Preview: PreviewProvider {
    static var previews: some View {
        PasswordView(email: "test@gmail.com")
    }
}
