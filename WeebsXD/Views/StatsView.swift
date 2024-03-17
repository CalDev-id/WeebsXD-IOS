//
//  StatsView.swift
//  WeebsXD
//
//  Created by Heical Chandra on 17/03/24.
//

import SwiftUI
import Charts

struct MacroData {
    let name: String
    let value: Int
    let color: Color
}

struct StatsView: View {
    @State private var macros: [MacroData] = [
        .init(name: "Tv/Movie", value: 42, color: .blue.opacity(0.8)),
        .init(name: "Manga", value: 58, color: .orange.opacity(0.9)),
    ]
    
    var body: some View {
        ScrollView{
            LazyVStack{
                topBarViewStats()
                Image("Chart-1")
                VStack {
                    HStack {
                        Group{
                            HStack {
                                Text("12 Jan - 12 Mar").foregroundColor(.black).opacity(0.7)
                                Image("show")
                            }.padding(10)
                        }.overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(.secondary.opacity(0.2), lineWidth: 2)
                    )
                        Spacer()
                        Image("threebtn")
                    }.padding(.top, 15).padding(.horizontal, 15)
                    HStack{
                        ZStack {
                            Chart(macros, id: \.name){ macro in
                                SectorMark(
                                    angle: .value("Macros", macro.value),
                                    innerRadius: .ratio(0.790),
                                    angularInset: 1.5
                                )
                                .cornerRadius(4)
                                .foregroundStyle(Color(macro.color))
                            }
                            .frame(height: 170)
                            .chartXAxis(.visible)
                            VStack{
                                Text("+14%").foregroundColor(.orange).font(.system(size: 26)).bold()
                                Text("vs last month").foregroundColor(.black.opacity(0.8)).font(.system(size: 15))
                            }
                        }
                        VStack(alignment: .leading){
                            Text("Manga").foregroundColor(.secondary)
                            HStack{
                                Text("341")
                                Text("Hours").foregroundColor(.secondary)
                            }
                            Text("Tv/Movie").foregroundColor(.secondary)
                            HStack{
                                Text("278")
                                Text("Hours").foregroundColor(.secondary)
                            }
                        }
                    }.padding(.bottom, 15)
                }.background(.white).cornerRadius(10).padding(.horizontal,18).padding(.bottom, 5)
            }
            Image("Chart-3")
        }.background(.thinMaterial)
    }

}
#Preview {
    StatsView()
}
struct topBarViewStats: View {
    @State var MangaSelected:Bool = true
    
    var body: some View {
        HStack{
            VStack{
                Text("My Analytics").font(.system(size: 25)).multilineTextAlignment(.leading).frame(maxWidth: .infinity, alignment: .leading)
                Text("What have I been watch/read").foregroundColor(.secondary).multilineTextAlignment(.leading).frame(maxWidth: .infinity, alignment: .leading)
            }
            Group{
                Image("share").padding(10)
            }.background(Color.white).cornerRadius(20)
            Group{
                Image("menu").padding(10)
            }.background(Color.white).cornerRadius(20)
        }.padding(.horizontal, 18).padding(.top,5)
    }
}
