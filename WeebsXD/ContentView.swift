//
//  ContentView.swift
//  WeebsXD
//
//  Created by Heical Chandra on 15/03/24.
//

import SwiftUI

struct ContentView: View {
    @State private var tabSelected: Tab = .house
    
    init() {
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        ZStack {
            VStack {
                TabView(selection: $tabSelected) {
                    ForEach(Tab.allCases, id: \.rawValue) { tab in
                        HStack {
                            Image(systemName: tab.rawValue)
                            Text("\(tab.rawValue.capitalized)")
                                .bold()
                                
                                .animation(nil, value: tabSelected)
                        }
                        .tag(tab)
                        
                    }
                }
            }
            VStack {
                Spacer()
                CustomTapBar(selectedTab: $tabSelected)
            }
        }
    }
}

#Preview {
    ContentView().previewInterfaceOrientation(.portrait)
}
