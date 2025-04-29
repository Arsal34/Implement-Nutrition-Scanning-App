//
//  LoginViewModel.swift
//  Nutrak
//
//  Created by M1 on 27/04/2025.
//

import Foundation

class LoginViewModel: ObservableObject {
    @Published var emailError: String?

    func validateEmail(_ email: String) {
        let emailRegEx = "(?:[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64})"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        
        if email.isEmpty {
            emailError = nil
        } else if !emailPred.evaluate(with: email) {
            emailError = "Please enter a valid email address."
        } else {
            emailError = nil
        }
    }
}
