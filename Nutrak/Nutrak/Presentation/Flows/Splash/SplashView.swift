//
//  SplashView.swift
//  Nutrak
//
//  Created by M1 on 27/04/2025.
//

import SwiftUI

struct SplashView: View {
    @State private var logoScale: CGFloat = 1.0
    @State private var navigateToOnboarding = false

    var body: some View {
        NavigationStack {
            ZStack {
                AppImages.background
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()

                AppImages.logo
                    .resizable()
                    .scaledToFit()
                    .frame(width: 60, height: 16)
                    .scaleEffect(logoScale)
                    .onAppear {
                        withAnimation(.easeOut(duration: 2.0)) {
                            logoScale = 3.0
                        }

                        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                            navigateToOnboarding = true
                        }
                    }

                NavigationLink(
                    destination: OnboardingView(),
                    isActive: $navigateToOnboarding,
                    label: { EmptyView() }
                )
            }
        }
    }
}

struct SplashView_Preview: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
