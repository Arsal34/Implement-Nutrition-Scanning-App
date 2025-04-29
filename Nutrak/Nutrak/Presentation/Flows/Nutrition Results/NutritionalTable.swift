//
//  NutritionalView.swift
//  Nutrak
//
//  Created by M1 on 28/04/25.
//

import SwiftUI

struct NutritionCellData: Identifiable {
    let id = UUID()
    let imageName: Image
    let title: String
    let description: String
}


struct NutritionCellView: View {
    let item: NutritionCellData

    var body: some View {
        HStack(alignment: .center, spacing: 8) {
                    item.imageName
                        .resizable()
                        .scaledToFit()
                        .frame(width: 32, height: 32)

                    VStack(alignment: .leading, spacing: 2) {
                        Text(item.title)
                            .textStyle(AppTypography.labelLarge)
                            .foregroundColor(AppColors.TextLightMode.mediumEmp)

                        Text(item.description)
                            .textStyle(AppTypography.labelLarge)
                            .bold()
                            .foregroundColor(AppColors.black)
                    }

                    Spacer()
        }
        .padding()
        .frame(width: 154, height: 54)
        .background(AppColors.Neutral.n100)
        .cornerRadius(12)
    }
}


struct NutritionDetailView: View {
    let headings: [String]
    let data: [[NutritionCellData]]

    let columns = [
        GridItem(.adaptive(minimum: 154), spacing: 2)
    ]

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 24) {
                ForEach(0..<headings.count, id: \.self) { index in
                    VStack(alignment: .leading, spacing: 12) {
                        Text(headings[index])
                            .textStyle(AppTypography.titleSmall)
                            .foregroundColor(AppColors.TextLightMode.highEmp)
                            .padding(.horizontal)

                        LazyVGrid(columns: columns, alignment: .leading, spacing: 12) {
                            ForEach(data[index]) { item in
                                NutritionCellView(item: item)
                            }
                        }
                        .padding(.horizontal)
                    }
                }
            }
            .padding(.top)
        }
        .background(AppColors.white)
    }
}
