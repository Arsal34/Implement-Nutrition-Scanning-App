//
//  FoodScanningView.swift
//  Nutrak
//
//  Created by M1 on 27/04/2025.
//

import SwiftUI
import AVFoundation

struct FoodScanningView: View {
    @State private var showGallery = false
    @State private var selectedGalleryImage: UIImage?
    @State private var showPermissionPopup = false
    @State private var imageSelected = false
    @StateObject private var viewModel = FoodScanningViewModel()
    @Binding var showFoodScanningView: Bool
    @Environment(\.dismiss) private var dismiss
    
    
    var body: some View {
        GeometryReader { geometry in
            NavigationStack {
                ZStack {
                    CameraPreview(session: viewModel.session)
                        .ignoresSafeArea()
                    
                    
                    Color.black
                        .opacity(0.5)
                        .mask(
                            Rectangle()
                                .overlay(
                                    RoundedRectangle(cornerRadius: 20)
                                        .frame(width: 250, height: 250)
                                        .blendMode(.destinationOut)
                                )
                                .compositingGroup()
                        )
                        .edgesIgnoringSafeArea(.all)
                    
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color.white, lineWidth: 2)
                        .frame(width: 250, height: 250)
                    
                    if showPermissionPopup {
                        Color.black.opacity(0.4)
                            .ignoresSafeArea()
                        
                        CameraPermissionPopup(
                            onAllow: {
                                AVCaptureDevice.requestAccess(for: .video) { granted in
                                    DispatchQueue.main.async {
                                        showPermissionPopup = false
                                        if granted {
                                            viewModel.startSession()
                                        }
                                    }
                                }
                            },
                            onDeny: {
                                showPermissionPopup = false
                            }
                        )
                        .transition(.scale)
                    }
                    
                    
                    
                    
                    VStack {
                        
                        HStack {
                            Button(action: {
                                dismiss()
                            }) {
                                Image(systemName: "chevron.left")
                                    .foregroundColor(.white)
                                    .padding()
                                    .background(Color.black.opacity(0.5))
                                    .clipShape(Circle())
                            }
                            
                            Spacer()
                            
                            Button(action: {
                                viewModel.toggleFlash()
                            }) {
                                Image(systemName: viewModel.flashOn ? "bolt.fill" : "bolt.slash.fill")
                                    .foregroundColor(viewModel.flashOn ? .yellow : .white)
                                    .padding()
                                    .background(Color.black.opacity(0.5))
                                    .clipShape(Circle())
                            }
                        }
                        .padding(.horizontal, 16)
                        .padding(.top, 50)
                        
                        Spacer()
                        
                        VStack(alignment: .leading) {
                            HStack(spacing: 12) {
                                AppImages.cameraScan
                                    .resizable()
                                    .frame(width: 32, height: 32)
                                    .foregroundColor(.yellow)
                                
                                VStack(alignment: .leading, spacing: 4) {
                                    Text("Scan Your Food")
                                        .textStyle(AppTypography.bodyLarge)
                                        .foregroundColor(AppColors.white)
                                        .bold()
                                    
                                    Text("Ensure your food is well-lit and in focus for the most accurate scan.")
                                        .textStyle(AppTypography.bodyMedium)
                                        .foregroundColor(AppColors.white)
                                }
                                
                                Spacer()
                            }
                            .padding(.horizontal, 20)
                            .padding(.vertical, 8)
                            .background(.ultraThinMaterial)
                            .cornerRadius(12)
                            .padding(.horizontal, 20)
                            Spacer()
                        }
                        
                        HStack {
                            Button(action: {
                                showGallery = true
                            }) {
                                AppImages.gallery
                                    .resizable()
                                    .frame(width: 28, height: 28)
                                    .foregroundColor(.white)
                                    .padding()
                            }
                            
                            Spacer()
                            
                            Button(action: {
                                viewModel.capturePhoto()
                                imageSelected = true
                            }) {
                                Circle()
                                    .strokeBorder(AppColors.accent, lineWidth: 8)
                                    .background(Circle().foregroundColor(AppColors.white))
                                    .frame(width: 64, height: 64)
                            }
                            
                            Spacer()
                            
                            Button(action: {
                                viewModel.toggleZoom()
                            }) {
                                Text(viewModel.zoomLevel.rawValue)
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                    .frame(width: 44, height: 44)
                                    .background(Color.black.opacity(0.5))
                                    .clipShape(Circle())
                            }
                        }
                        .padding(.horizontal, 32)
                        .padding(.bottom, 40)
                    }
                }
                .background(AppColors.white)
                .ignoresSafeArea()
                .navigationBarBackButtonHidden(true)
                .navigationBarHidden(true)
                .onAppear {
                    let status = AVCaptureDevice.authorizationStatus(for: .video)
                    if status == .notDetermined {
                        showPermissionPopup = true
                    } else if status == .authorized {
                        viewModel.startSession()
                    }
                }
                
                .onChange(of: selectedGalleryImage) { image in
                    if let image = image {
                        viewModel.capturedPhoto = CapturedPhoto(image: image)
                        imageSelected = true
                    }
                }
                .sheet(isPresented: $showGallery) {
                    ImagePicker(selectedImage: $selectedGalleryImage)
                }
                
                
                
            }
            .navigationBarBackButtonHidden(true)
            .navigationBarHidden(true)
            .fullScreenCover(isPresented: $imageSelected) {
                LoaderView(showFoodScanningView: $showFoodScanningView)
            }
        }
    }
}


struct FoodScanningView_Preview: PreviewProvider {
    static var previews: some View {
        FoodScanningreviewWrapper()
    }
    
    struct FoodScanningreviewWrapper: View {
        @State private var showFoodScanningView = false
        
        var body: some View {
            FoodScanningView(showFoodScanningView: $showFoodScanningView)
        }
    }
}
