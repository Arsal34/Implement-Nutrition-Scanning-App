//
//  NutrakApp.swift
//  Nutrak
//
//  Created by M1 on 27/04/2025.
//

import SwiftUI

@main
struct NutrakApp: App {
    @State var temp = false
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                SplashView()
            }
        }
    }
}
