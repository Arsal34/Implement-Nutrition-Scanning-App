//
//  AppColors.swift
//  Nutrak
//
//  Created by M1 on 27/04/2025.
//

import SwiftUI

struct AppColors {
    
    // MARK: - Primary Palette
    static let primary = Color(hex: "#FFA726")
    static let secondary = Color(hex: "#F1F1F1")
    static let accent = Color(hex: "#66BB6A")
    static let black = Color(hex: "#141414")
    static let white = Color(hex: "#FFFFFF")
    static let radial = Color(hex: "#F5E5D3")
    static let blue = Color(hex: "#F5F0FF")
    
    // MARK: - Primary Shades
    struct Primary {
        static let n900 = Color(hex: "#8C2127")
        static let n800 = Color(hex: "#AE242C")
        static let n700 = Color(hex: "#D0272F")
        static let n600 = Color(hex: "#EA2A35")
        static let n500 = Color(hex: "#EF656D")
        static let n400 = Color(hex: "#F7ADB1")
        static let n300 = Color(hex: "#FAD2D4")
        static let n200 = Color(hex: "#F7DFE0")
        static let n100 = Color(hex: "#FAEAEB")
        static let n50  = Color(hex: "#FFF7F8")
    }
    
    // MARK: - Primary Action
    struct PrimaryAction {
        static let active  = Color(hex: "#D0272F")
        static let `default` = Color(hex: "#EA2A35")
        static let hover   = Color(hex: "#EF656D")
        static let disable = Color(hex: "#F7ADB1")
    }
    
    // MARK: - Secondary Light
    struct SecondaryLight {
        static let n900 = Color(hex: "#1D2660")
        static let n800 = Color(hex: "#202B76")
        static let n700 = Color(hex: "#22308A")
        static let n600 = Color(hex: "#24339B")
        static let n500 = Color(hex: "#616CB7")
        static let n400 = Color(hex: "#A7ADD7")
        static let n300 = Color(hex: "#CBCFE7")
        static let n200 = Color(hex: "#DCDFEF")
        static let n100 = Color(hex: "#EEEFF7")
        static let n50  = Color(hex: "#F6F7FB")
    }
    
    // MARK: - Neutral
    struct Neutral {
        static let stroke = Color(hex: "#EDEDED") 
        static let n900 = Color(hex: "#0D1414")
        static let n800 = Color(hex: "#272E2E")
        static let n700 = Color(hex: "#686B6B")
        static let n600 = Color(hex: "#959898")
        static let n500 = Color(hex: "#959898")
        static let n400 = Color(hex: "#CACBCB")
        static let n300 = Color(hex: "#DDDEDE")
        static let n200 = Color(hex: "#ECECEC")
        static let n100 = Color(hex: "#F5F6F6")
        static let n50  = Color(hex: "#FAFAFA")
        static let n0   = Color(hex: "#FFFFFF")
    }
    
    // MARK: - Text Colors (Light Mode)
    struct TextLightMode {
        static let highEmp    = Color(hex: "#0D1414")
        static let mediumEmp  = Color(hex: "#686B6B")
        static let lowEmp     = Color(hex: "#959898")
        
        static let highEmpDark    = Color(hex: "#FFFFFF")
        static let mediumEmpDark  = Color(hex: "#ECECEC")
        static let lowEmpDark     = Color(hex: "#DDDEDE")
        
        static let disabled  = Color(hex: "#959898")
    }
    
    // MARK: - Error
    struct Error {
        static let `default` = Color(hex: "#0D1414")
        static let disable   = Color(hex: "#272E2E")
        static let stock     = Color(hex: "#686B6B")
        static let bgLight   = Color(hex: "#959898")
        static let bgLighter = Color(hex: "#959898")
    }
    
    // MARK: - Warning
    struct Warning {
        static let `default` = Color(hex: "#0D1414")
        static let disable   = Color(hex: "#272E2E")
        static let stock     = Color(hex: "#686B6B")
        static let bgLight   = Color(hex: "#959898")
        static let bgLighter = Color(hex: "#959898")
    }
    
    // MARK: - Success
    struct Success {
        static let `default` = Color(hex: "#0D1414")
        static let disable   = Color(hex: "#272E2E")
        static let stock     = Color(hex: "#686B6B")
        static let bgLight   = Color(hex: "#959898")
        static let bgLighter = Color(hex: "#959898")
    }
    
    // MARK: - Information
    struct Information {
        static let `default` = Color(hex: "#0D1414")
        static let disable   = Color(hex: "#272E2E")
        static let stock     = Color(hex: "#686B6B")
        static let bgLight   = Color(hex: "#959898")
        static let bgLighter = Color(hex: "#959898")
    }
}
