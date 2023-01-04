//
//  setting view.swift
//  Awise
//
//  Created by liu zhenke on 10/24/22.
//

import SwiftUI

struct Setting_Previews: PreviewProvider {
     static var previews: some View {
         NavigationView{
             SettingView()
         }
    }
}


struct SettingView: View{
    @AppStorage("isDark") var isDark = false //added by Jerry
    @AppStorage("hasBG") private var hasBG = false
    @EnvironmentObject var ans_tab: Ans
    @EnvironmentObject var ans_profile: Ans2
    var body: some View {
        ZStack{
            ZStack{
                Image(systemName: "arrow.left")
            }
            Form{
                Section(header: Text("Setting"),footer:Text("")){
                    Toggle(isOn: $isDark, label: {
                        Text("Dark Mode")
                    })
                    Toggle(isOn: $hasBG, label: {
                        Text("Colorful Background")
                    })
                }
            }.navigationBarHidden(true)
            HStack{
                GeometryReader { geometry in
                    VStack {
                        Spacer()
                        HStack {
                            NavigationLink(destination: ProfileView()
                                .environmentObject(ans_tab)
                                .environmentObject(ans_profile)){
                                VStack {
                                    Image(systemName: "person.crop.circle")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: geometry.size.width/5, height: geometry.size.height/28)
                                        .padding(.top, 10)
                                    Text("Profile")
                                        .font(.footnote)
                                    Spacer()
                                }
                            }.accentColor(Color(.systemBlue))
                            Spacer()
                            NavigationLink(destination: QuizScrollselection()
                                .environmentObject(ans_tab)
                                .environmentObject(ans_profile)){
                                VStack {
                                    Image(systemName: "doc.richtext")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: geometry.size.width/5, height: geometry.size.height/28)
                                        .padding(.top, 10)
                                    Text("Quiz")
                                        .font(.footnote)
                                    Spacer()
                                }
                            }.accentColor(Color(.systemBlue))
                            Spacer()
                            NavigationLink(destination: HomeView()){
                                VStack {
                                    Image(systemName: "homekit")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: geometry.size.width/5, height: geometry.size.height/28)
                                        .padding(.top, 10)
                                    
                                    Text("Home")
                                        .font(.footnote)
                                    Spacer()
                                }
                            }.accentColor(Color(.systemBlue))
                            Spacer()
                            NavigationLink(destination: signInPage()
                                .onAppear{uid = -1}){
                                VStack {
                                    Image(systemName: "figure.walk.circle")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: geometry.size.width/5, height: geometry.size.height/28)
                                        .padding(.top, 10)
                                    
                                    Text("Log Out")
                                        .font(.footnote)
                                    Spacer()
                                }
                            }.accentColor(Color(.systemBlue))
                        }
                        .frame(width: geometry.size.width, height: geometry.size.height/8)
                    }
                }.edgesIgnoringSafeArea(.bottom)
            }
            .padding(.horizontal)
        }
    }
}
