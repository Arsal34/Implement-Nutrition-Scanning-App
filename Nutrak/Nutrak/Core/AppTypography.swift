//
//  AppTypography.swift
//  Nutrak
//
//  Created by M1 on 27/04/2025.
//

import SwiftUI

enum AppTypography {
    
    // MARK: - Display
    static let displayLarge = font(size: 32, weight: .bold, letterSpacing: -0.5, lineHeight: 35.2)
    static let displayMedium = font(size: 24, weight: .bold, letterSpacing: -0.5, lineHeight: 26.4)
    static let displaySmall = font(size: 22, weight: .bold, letterSpacing: 0, lineHeight: 24.2)

    // MARK: - Headline
    static let headlineLarge = font(size: 20, weight: .bold, letterSpacing: -0.5, lineHeight: 24)
    static let headlineMedium = font(size: 18, weight: .bold, letterSpacing: 0, lineHeight: 21.6)
    static let headlineSmall = font(size: 16, weight: .bold, letterSpacing: 0, lineHeight: 19.2)

    // MARK: - Title
    static let titleLarge = font(size: 14, weight: .bold, letterSpacing: -0.5, lineHeight: 16.8)
    static let titleMedium = font(size: 12, weight: .semibold, letterSpacing: 0, lineHeight: 14.4)
    static let titleSmall = font(size: 12, weight: .semibold, letterSpacing: 0, lineHeight: 15.0)

    // MARK: - Body
    static let bodyLarge = font(size: 14, weight: .regular, letterSpacing: 0, lineHeight: 18.2)
    static let bodyMedium = font(size: 12, weight: .regular, letterSpacing: 0, lineHeight: 15.6)
    static let bodySmall = font(size: 10, weight: .regular, letterSpacing: 0, lineHeight: 12.0)

    // MARK: - Label
    static let labelLarge = font(size: 14, weight: .medium, letterSpacing: 0, lineHeight: 16.8)
    static let labelMedium = font(size: 12, weight: .medium, letterSpacing: 0, lineHeight: 14.4)
    static let labelSmall = font(size: 10, weight: .medium, letterSpacing: 0, lineHeight: 12.0)
    
    // MARK: - Utility
    private static func font(size: CGFloat, weight: Font.Weight, letterSpacing: CGFloat, lineHeight: CGFloat) -> FontStyle {
        return FontStyle(size: size, weight: weight, letterSpacing: letterSpacing, lineHeight: lineHeight)
    }
}


struct FontStyle {
    let size: CGFloat
    let weight: Font.Weight
    let letterSpacing: CGFloat
    let lineHeight: CGFloat
}

struct TextStyleModifier: ViewModifier {
    let style: FontStyle

    func body(content: Content) -> some View {
        content
            .font(.system(size: style.size, weight: style.weight))
            .kerning(style.letterSpacing)
            .lineSpacing(style.lineHeight - style.size)
    }
}

extension View {
    func textStyle(_ style: FontStyle) -> some View {
        self.modifier(TextStyleModifier(style: style))
    }
}
    
