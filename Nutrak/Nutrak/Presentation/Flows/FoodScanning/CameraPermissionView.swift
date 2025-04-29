//
//  CameraPermissionView.swift
//  Nutrak
//
//  Created by M1 on 28/04/25.
//

import SwiftUI

struct CameraPermissionPopup: View {
    var onAllow: () -> Void
    var onDeny: () -> Void

    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "camera.viewfinder")
                .resizable()
                .scaledToFit()
                .frame(width: 80, height: 80)
                .padding(.top, 30)

            Text("Allow “Nutrition Scanning” to use your camera?")
                .font(.headline)
                .multilineTextAlignment(.center)
                .padding(.horizontal)

            Text("You can change this setting in the App section of your device Settings.")
                .font(.subheadline)
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
                .padding(.horizontal)

            VStack(spacing: 12) {
                Button(action: onAllow) {
                    Text("Allow Access")
                        .foregroundColor(AppColors.TextLightMode.highEmp)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(AppColors.primary)
                        .cornerRadius(10)
                }

                Button(action: onDeny) {
                    Text("Don't Allow")
                        .foregroundColor(AppColors.TextLightMode.highEmp)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .cornerRadius(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(AppColors.black, lineWidth: 1)
                        )
                }
            }
            .padding(.horizontal)
            .padding(.bottom, 20)
        }
        .background(Color.white)
        .cornerRadius(20)
        .shadow(radius: 10)
        .padding(.horizontal, 40)
    }
}
