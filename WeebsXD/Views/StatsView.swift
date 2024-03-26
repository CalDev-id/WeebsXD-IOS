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
    
    var body: some View {
        ScrollView{
            LazyVStack{
                topBarViewStats()
                Chartbar1()
            
                Chartbar2()
            }
            Image("Chart-3").padding(.bottom, 8)
            
            Chartbar3()
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

struct Chartbar1: View {
    @State private var selectedOption: String? = nil
    let options = ["12 Jan - 12 Mar", "13 Mar - 13 May", "14 May - 14 July"]
    
    var body: some View {
        VStack {
            HStack {
                Group{
                    HStack {
                        Menu(options[0]) {
                            ForEach(options, id: \.self) { option in
                                Button(action: {
                                    self.selectedOption = option
                                }) {
                                    Text(option)
                                }
                            }
                        }.foregroundColor(.black).opacity(0.8)
                        Image("show")
                    }.padding(10)
                }.overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(.secondary.opacity(0.2), lineWidth: 2)
                )
                Spacer()
                Image("threebtn")
                
            }.padding(.top, 15).padding(.horizontal, 15).padding(.bottom, 5)
            
            //image
            Image("Chart11").padding()
        }.background(.white).cornerRadius(10).padding(.horizontal,18).padding(.bottom, 5)
    }
}

struct Chartbar2: View {
    @State private var macros: [MacroData] = [
        .init(name: "Tv/Movie", value: 42, color: .blue.opacity(0.8)),
        .init(name: "Manga", value: 58, color: .orange.opacity(0.9)),
    ]
    
    @State private var selectedOption: String? = nil
    let options = ["12 Jan - 12 Mar", "13 Mar - 13 May", "14 May - 14 July"]
    
    var body: some View {
        VStack {
            HStack {
                Group{
                    HStack {
                        Menu(options[0]) {
                            ForEach(options, id: \.self) { option in
                                Button(action: {
                                    self.selectedOption = option
                                }) {
                                    Text(option)
                                }
                            }
                        }.foregroundColor(.black).opacity(0.8)
                        Image("show")
                    }.padding(10)
                }.overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(.secondary.opacity(0.2), lineWidth: 2)
                )
                Spacer()
                Image("threebtn")
                
            }.padding(.top, 15).padding(.horizontal, 15).padding(.bottom, 5)
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
//                    .frame(height: 170)
                    .frame(width: 170, height: 170, alignment: .leading)
                    .chartXAxis(.visible)
                    VStack{
                        Text("+14%").foregroundColor(.orange).font(.system(size: 26)).bold()
                        Text("vs last month").foregroundColor(.black.opacity(0.8)).font(.system(size: 15))
                    }
                }
                Spacer()
                VStack(alignment: .leading){
                    HStack {
                        Text("|").bold().foregroundColor(.orange)
                        Text("Manga").foregroundColor(.secondary)
                    }
                    HStack{
                        Text("341").font(.system(size: 23))
                        Text("Hours").foregroundColor(.secondary)
                    }.padding(.bottom, 10)
                    HStack {
                        Text("|").bold().foregroundColor(.blue)
                        Text("Tv/Movie").foregroundColor(.secondary)
                    }
                    HStack{
                        Text("278").font(.system(size: 23))
                        Text("Hours").foregroundColor(.secondary)
                    }
                }.padding(.horizontal,20)
            }.padding(.bottom, 15).padding()
        }.background(.white).cornerRadius(10).padding(.horizontal,18).padding(.bottom, 5)
    }
}

struct Chartbar3: View {
    @State private var selectedOption: String? = nil
    let options = ["12 Jan - 12 Mar", "13 Mar - 13 May", "14 May - 14 July"]
    let gridItems = Array(repeating: GridItem(), count: 2) // 2 kolom

    var body: some View {
        VStack {
            HStack {
                Group{
                    HStack {
                        Menu(options[0]) {
                            ForEach(options, id: \.self) { option in
                                Button(action: {
                                    self.selectedOption = option
                                }) {
                                    Text(option)
                                }
                            }
                        }.foregroundColor(.black).opacity(0.8)
                        Image("show")
                    }.padding(10)
                }.overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(.secondary.opacity(0.2), lineWidth: 2)
                )
                Spacer()
                Image("threebtn")
                
            }.padding(.top, 15).padding(.horizontal, 15)
            
            //grid
            LazyVGrid(columns: gridItems, spacing: 20) {
                Image("chap")
                Image("Eps")
            }.padding()
        }.background(.white).cornerRadius(10).padding(.horizontal,18).padding(.bottom, 5)
    }
}
