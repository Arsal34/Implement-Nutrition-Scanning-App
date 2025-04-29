//
//  NutritionModel.swift
//  Nutrak
//
//  Created by M1 on 27/04/2025.
//

import Foundation

struct NutritionModel {
    let calorie: Int
    let macronutrients: Macronutrients
    let micronutrients: Micronutrients
}

struct Macronutrients {
    let protein: Int
    let carbs: Int
    let fats: Int
}

struct Micronutrients {
    let iron: Int
    let calcium: Int
}

