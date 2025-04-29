//
//  OnboardingViewModel.swift
//  Nutrak
//
//  Created by M1 on 27/04/2025.
//

import SwiftUI

final class OnboardingViewModel: ObservableObject {
    @Published var currentPage: Int = 0
    
    let pages: [OnboardingModel] = [
        OnboardingModel(imageName: AppImages.onboardingImg1, title: AppStrings.OnboardingS1Title, description: AppStrings.OnboardingS1Desc.description),
        OnboardingModel(imageName: AppImages.onboardingImg2, title: AppStrings.OnboardingS2Title.description, description: AppStrings.OnboardingS2Desc.description),
        OnboardingModel(imageName: AppImages.onboardingImg3, title: AppStrings.OnboardingS3Title.description, description: AppStrings.OnboardingS3Desc.description)
    ]
    
    var isLastPage: Bool {
        currentPage == pages.count - 1
    }
    
    func next() {
        if currentPage < pages.count - 1 {
            currentPage += 1
        } 
    }
    
    func previous() {
        if currentPage > 0 {
            currentPage -= 1
        }
    }
}
