//
//  WeebsXDApp.swift
//  WeebsXD
//
//  Created by Heical Chandra on 15/03/24.
//

import SwiftUI
import FirebaseCore
import FirebaseFirestore
import FirebaseAuth

@main
struct WeebsXDApp: App {    
    @StateObject var authViewModel = AuthViewModel()

    init(){
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
//            ContentViews().background(.thinMaterial)
            NavigationView{
                if authViewModel.isLoggedIn {
                    ContentViews()
                } else {
                    SubscriptionView()
                }
            }            
            .environmentObject(authViewModel)
        }
    }
}
