//
//  ProfileView.swift
//  WeebsXD
//
//  Created by Heical Chandra on 26/03/24.
//

import SwiftUI
import FirebaseAuth

struct ProfileView: View {
    @AppStorage("uid") var userID: String = ""

    
    var body: some View {
        Text("logged in \nyour user id is \(userID)")
        Button(action: {
            let firebaseAuth = Auth.auth()
            do {
              try firebaseAuth.signOut()
                withAnimation{
                    userID = ""
                }
            } catch let signOutError as NSError {
              print("Error signing out: %@", signOutError)
            }
        }){
            Text("Signout")
        }
    }
}

#Preview {
    ProfileView()
}
