//
//  profile.swift
//  Awise
//
//  Created by liu zhenke on 10/31/22.
//


import SwiftUI
import Foundation

struct Profile_Previews: PreviewProvider {
     static var previews: some View {
         ProfileView()
    }
}

struct ProfileView: View{
    @State private var enable = true
    @State private var results = BasicInfo()
    @EnvironmentObject var ans_tab: Ans
    @EnvironmentObject var ans_profile: Ans2
    var body: some View {
        ZStack{
            
            Form {
                Section(header: Text("Basic Information")) {
                    HStack {
                        Text("Name")
                        Spacer(minLength: 100)
                        Text(ans_profile.user_name)
                    }
                }
                Section(header: Text("Additional")) {
                    HStack {
                        Text("Gender")
                        Spacer(minLength: 100)
                        Text(ans_profile.gender)
                    }
                    
                    HStack {
                        Text("Email")
                        Spacer(minLength: 100)
                        Text(ans_profile.email)
                    }
                    
                    HStack {
                        Text("School year")
                        Spacer(minLength: 100)
                        Text(String(ans_profile.school_year))
                    }
                    HStack {
                        Text("Rent")
                        Spacer(minLength: 100)
                        Text(String(ans_profile.rent))
                }
                
                }
            
            }.navigationBarHidden(true)
            HStack{
                GeometryReader { geometry in
                    VStack {
                        Spacer()
                        HStack {
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
                                }.accentColor(Color(.systemBlue))
                            }
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
                                }.accentColor(Color(.systemBlue))
                            }
                            Spacer()
                            
                            NavigationLink(destination: SettingView()
                                .environmentObject(ans_tab)
                                .environmentObject(ans_profile)
                                ){
                                VStack {
                                    Image(systemName: "highlighter")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: geometry.size.width/5, height: geometry.size.height/28)
                                        .padding(.top, 10)
                                    
                                    Text("Setting")
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
                                }.accentColor(Color(.systemBlue))
                            }
                        }
                        .frame(width: geometry.size.width, height: geometry.size.height/8)
                    }
                }.edgesIgnoringSafeArea(.bottom)
            }
            .padding(.horizontal)
        }
    }
    func fetchBasic(uid: Int){
        let urlString = "https://awise.herokuapp.com/api/survey/retrieve-basic-info/\(uid)"
        guard let url = URL(string: urlString) else {
              return
          }
        var request = URLRequest(url: url)

        // Make the request
        URLSession.shared.dataTask(with: request) { data, response, error in
                    if let data = data {
                        if let response = try? JSONDecoder().decode(BasicInfo.self, from: data) {
                            // DispatchQueue.main.async {
                                self.results = response
                            // }
                            // print(response)
                                return
                        }
                    }
        }.resume()
          
    }



}


