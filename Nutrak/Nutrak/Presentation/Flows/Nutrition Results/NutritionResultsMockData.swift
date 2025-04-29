//
//  NutritionResultsMockData.swift
//  Nutrak
//
//  Created by M1 on 29/04/25.
//

import Foundation

struct NutritionMockData {
    let headings = ["Nutritional Overview:", "Macronutrients", "Micronutrients"]
    let data = [
        [
            NutritionCellData(imageName: AppImages.calories, title: "Calories", description: "320 Kcal"),
        ],
        [
            NutritionCellData(imageName: AppImages.proteins, title: "Proteins", description: "13g"),
            NutritionCellData(imageName: AppImages.carbs, title: "Carbs", description: "35g"),
            NutritionCellData(imageName: AppImages.fats, title: "Fats", description: "12g")
        ],
        [
            NutritionCellData(imageName: AppImages.iron, title: "Iron", description: "10%"),
            NutritionCellData(imageName: AppImages.calcium, title: "Calcium", description: "20%")
        ]
    ]
    
    let calorieData: [BarChartData] = [
        .init(day: "S", value: 50),
        .init(day: "M", value: 70),
        .init(day: "T", value: 40),
        .init(day: "W", value: 100),
        .init(day: "T", value: 20),
        .init(day: "F", value: 120),
        .init(day: "S", value: 60),
    ]
}
