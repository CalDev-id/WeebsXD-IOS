//
//  GenreView.swift
//  WeebsXD
//
//  Created by Heical Chandra on 18/03/24.
//

import SwiftUI
import FirebaseAuth

struct Genre {
    let title: String
    let isSelected: Bool
    let icon: String
}

struct GenreView: View {
    @AppStorage("uid") var userID: String = ""

    var body: some View {
        if userID == "" {
            GenreContent()
        } else{
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
}

#Preview {
    GenreView()
}

struct ItemGenre: View {
    @State var title:String
    @State var icon:String
    @State var isSelected:Bool = false
    
    var body: some View {
        HStack{
            Text(title).font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            Spacer()
            Text(icon).font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            Image(systemName: isSelected ? "checkmark.square" : "square").foregroundColor(isSelected ? .orange : .secondary)
        }.frame(maxWidth: .infinity).padding().background(.white).cornerRadius(20).overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color.secondary, lineWidth: 0.3)
        ).padding(.horizontal).padding(.vertical, 5)
        .onTapGesture {
            withAnimation(.linear){
                isSelected = !isSelected
            }
        }
    }
}

struct GenreContent: View {
    @State var textFieldText: String = ""

    let genre = [
        Genre(title: "Action", isSelected: false, icon: "⚔"),
        Genre(title: "Fantasy", isSelected: false, icon: "🧙"),
        Genre(title: "Comedy", isSelected: false, icon: "😂"),
        Genre(title: "Drama", isSelected: false, icon: "🎭"),
        Genre(title: "Adventure", isSelected: false, icon: "🗡️"),
        Genre(title: "Rommance", isSelected: false, icon: "💞")

    ]
    
    var body: some View {
        NavigationView {
            VStack{
                Spacer()
                Text("WHAT'S YOUR").multilineTextAlignment(.center).font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/).bold()
                Text("FAVOURITE GENRE").multilineTextAlignment(.center).font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/).bold()
                TextField("Search Genre here...", text: $textFieldText)
                    .padding(.horizontal)
                    .frame(height: 50)
                    .foregroundColor(.white)
                    .background(Color.white)
                    .cornerRadius(15).shadow(radius: 0.7).padding(.horizontal, 13)
                
                ForEach(genre, id: \.title) { gen in
                    ItemGenre(title: gen.title, icon: gen.icon, isSelected: gen.isSelected)
                    
                }
                
                NavigationLink(destination: ContentViews()){
                    Text("Start Free Trial").fontWeight(.semibold).padding().frame(maxWidth: .infinity).foregroundColor(.white)
                        .background(.orange).cornerRadius(15).padding(.horizontal, 5).padding(.vertical, 10)
                    
                }
                Spacer()
            }.background(.thinMaterial)
        }.navigationBarBackButtonHidden(true)
    }
}
