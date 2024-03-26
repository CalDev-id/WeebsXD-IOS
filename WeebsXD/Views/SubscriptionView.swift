//
//  SubscriptionView.swift
//  WeebsXD
//
//  Created by Heical Chandra on 17/03/24.
//

import SwiftUI
import GoogleSignIn
import GoogleSignInSwift

struct SubscriptionView: View {
    
    @State private var shouldNavigate: Bool = false

    var body: some View {
        NavigationView{
            ZStack{
                VStack{
                    Image("animesplash").resizable().aspectRatio(contentMode: .fit)
                    Spacer()
                }
                
                ZStack{
                    Image("splash").resizable()
                    VStack{
                        Spacer()
                        Text("Try 14 days free").fontWeight(.heavy).font(.system(size: 32)).padding(.vertical, 8)
                        Text("To refresh your mind, watch or read a wide variety of anime and genres using the same app.").multilineTextAlignment(.center).padding(.horizontal, 5)

                        NavigationLink(destination: LoginView()){
                            Text("Start Free Trial").fontWeight(.semibold).padding().frame(maxWidth: .infinity)
                                .background(
                                    LinearGradient(
                                        gradient: Gradient(colors: [.orange, .yellow]),
                                        startPoint: .topLeading,
                                        endPoint: .bottomTrailing
                                    )
                                ).cornerRadius(15).padding(.horizontal, 5).padding(.vertical, 10)

                        }
                        Text("$59.99/year ($4.99/mo) after trial")
                        Text("Start free plan with limit").fontWeight(.semibold).foregroundColor(.orange).padding().padding(.bottom, 30).padding(.top, 10)
                    }
                }.foregroundColor(.white)
            }.edgesIgnoringSafeArea(.all)
        }
    }
}

#Preview {
    SubscriptionView()
}
