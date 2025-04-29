//
//  LoaderView.swift
//  Nutrak
//
//  Created by M1 on 28/04/25.
//

import SwiftUI
import ProgressIndicatorView

struct LoaderView: View {
    @State private var progress: Double = 0.0
    @State private var isLoadingComplete = false
    @State private var showNutritionResults = false
    @Binding var showFoodScanningView: Bool  
    @AppStorage("selectedTabIndex") private var selectedTabIndex: Int = 0
    @Environment(\.dismiss) var dismiss

    var body: some View {
        ZStack {
                if showNutritionResults {
                    
                } else {
                    VStack(spacing: 30) {
                        
                        CircularBarLoaderView(progress: progress)
                        
                        Text(AppStrings.scanning)
                            .textStyle(AppTypography.labelLarge)
                            .foregroundColor(AppColors.TextLightMode.mediumEmp)
                        
                        ProgressView(value: progress)
                            .progressViewStyle(LinearProgressViewStyle(tint: AppColors.accent))
                            .frame(width: 200)
                        
                        
                        Text("\(Int(progress * 100))%")
                            .font(.headline)
                            .foregroundColor(.gray)
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(AppColors.white)
                    .onAppear {
                        startLoading()
                    }
                    
                }
            }
        .animation(.easeInOut, value: showNutritionResults)
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
    }

    private func startLoading() {
        Timer.scheduledTimer(withTimeInterval: 0.05, repeats: true) { timer in
            progress += 0.01
            if progress >= 1.0 {
                timer.invalidate()
                selectedTabIndex = 1
                showFoodScanningView = false
                dismiss()
            }
        }
    }
}

struct LoaderView_Preview: PreviewProvider {
    static var previews: some View {
        LoaderPreviewWrapper()
    }
    
    struct LoaderPreviewWrapper: View {
        @State private var showFoodScanningView = false
        
        var body: some View {
            LoaderView(showFoodScanningView: $showFoodScanningView)
        }
    }
}
