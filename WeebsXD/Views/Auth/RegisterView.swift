//
//  RegisterView.swift
//  WeebsXD
//
//  Created by Heical Chandra on 21/03/24.
//

import SwiftUI
import FirebaseAuth

struct RegisterView: View {
    @State var textFieldEmail: String = ""
    @State var textFieldPass: String = ""
    @AppStorage("uid") var userID: String = ""

    var body: some View {
        NavigationView {
            ZStack {
                Image("bglogin").resizable().aspectRatio(contentMode: .fit).frame(width: .infinity)
                VStack {
                    VStack {
                        Image("Logo")
                        Text("Register your Account").fontWeight(.semibold).font(.system(size: 26))
                        Text("Sign up to continue").foregroundColor(.secondary).padding(.bottom, 5)
                        Group{
                            HStack{
                                Group{
                                    Image("apple")
                                    Text("Sign up with Apple")
                                }
                            }.frame(maxWidth: .infinity).padding(.vertical, 15).overlay(
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(Color.secondary, lineWidth: 0.3)
                            )
                        }.padding(.horizontal, 12).onTapGesture {
                            Auth.auth().createUser(withEmail: textFieldEmail, password: textFieldPass) { authResult, error in
                              
                                if let error = error {
                                    print(error)
                                    return
                                }
                                
                                if let authResult = authResult{
                                    print(authResult)
                                    userID = authResult.user.uid
                                }
                            }
                        }
                        Text("Or Sign up With").foregroundColor(.secondary)
                        TextField("email adress here", text: $textFieldEmail)
                                            .padding(.horizontal)
                                            .frame(height: 50)
                                            .foregroundColor(.black)
                                            .background(Color.white)
                                            .cornerRadius(15).shadow(radius: 1).padding(.horizontal, 13)
                        TextField("password here", text: $textFieldPass)
                                            .padding(.horizontal)
                                            .frame(height: 50)
                                            .foregroundColor(.black)
                                            .background(Color.white)
                                            .cornerRadius(15).shadow(radius: 1).padding(.horizontal, 13)
                        NavigationLink(destination: GenreView()){
                            Text("Sign Up").fontWeight(.semibold).padding().frame(maxWidth: .infinity).foregroundColor(.white)
                                .background(.orange).cornerRadius(15).padding(.horizontal, 5).padding(.vertical, 10)
                        }
                    }.padding()
                }.background(.white).cornerRadius(20).padding(.horizontal, 10)
            }.edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
        }.navigationBarBackButtonHidden(true)
    }
}

#Preview {
    RegisterView()
}
