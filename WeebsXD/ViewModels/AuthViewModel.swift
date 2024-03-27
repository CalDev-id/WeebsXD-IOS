//
//  AuthViewModel.swift
//  WeebsXD
//
//  Created by Heical Chandra on 26/03/24.
//

import Foundation
import FirebaseCore
import FirebaseFirestore
import FirebaseAuth

class AuthViewModel: ObservableObject {
    @Published var isLoggedIn = false
    
    init() {
        checkUserLoggedIn()
    }
    
    func checkUserLoggedIn() {
        Auth.auth().addStateDidChangeListener { auth, user in
            self.isLoggedIn = user != nil
        }
    }
}
