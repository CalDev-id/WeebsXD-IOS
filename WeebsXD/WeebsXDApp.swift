//
//  WeebsXDApp.swift
//  WeebsXD
//
//  Created by Heical Chandra on 15/03/24.
//

import SwiftUI
import FirebaseCore
//import FirebaseAuth

@main
struct WeebsXDApp: App {    
    init(){
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
//            ContentViews().background(.thinMaterial)
            NavigationView{
                SubscriptionView()
//                APIFetch()
            }
        }
    }
}
