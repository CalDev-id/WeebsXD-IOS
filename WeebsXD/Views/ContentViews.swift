//
//  ContentViews.swift
//  WeebsXD
//
//  Created by Heical Chandra on 15/03/24.
//

import SwiftUI

struct ContentViews: View {
    @State private var tabSelected: Tab = .house
    
    init() {
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    TabView(selection: $tabSelected) {
                        ForEach(Tab.allCases, id: \.self) { tab in
                            getView(for: tab)
                                .tag(tab)
                        }
    //                    ForEach(Tab.allCases, id: \.rawValue) { tab in
    //                        HStack {
    //                            Image(systemName: tab.rawValue)
    //                            Text("\(tab.rawValue.capitalized)")
    //                                .bold()
    //
    //                                .animation(nil, value: tabSelected)
    //                        }
    //                        .tag(tab)
    //                    }
                    }
                }
                VStack {
                    Spacer()
                    CustomTabBar(selectedTab: $tabSelected)
                }
            }
        }.navigationBarBackButtonHidden(true)
    }
    
    func getView(for tab: Tab) -> some View {
        switch tab {
        case .house:
            return AnyView(HomeView())
        case .message:
            return AnyView(StatsView())
        case .book:
            return AnyView(LibraryView())
        case .bookmark:
            return AnyView(APIFetch())
        case .person:
            return AnyView(ProfileView())
        }
    }
}

#Preview {
    ContentViews().previewInterfaceOrientation(.portrait)
}
