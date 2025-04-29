//
//  PassviewViewModel.swift
//  Nutrak
//
//  Created by M1 on 27/04/2025.
//

import Foundation

class PasswordViewModel: ObservableObject {
    @Published var passwordError: String? = " "
    
    func validatePassword(_ password: String) {
           if password.isEmpty {
               passwordError = nil
           } else if password.count < 6 {
               passwordError = "Password must be at least 6 characters."
           } else {
               passwordError = nil
           }
       }
}
