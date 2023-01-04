//
//  quizscroll.swift
//  Awise
//
//  Created by liu zhenke on 11/2/22.
//

import SwiftUI
import Foundation

struct CardModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .cornerRadius(20)
            .shadow(color: Color.black.opacity(0.2), radius: 20, x: 0, y: 0)
    }
}

struct QuizScrollselection: View {
    let skyBlue = Color(red: 0.4627, green: 0.8392, blue: 1.0)
    @EnvironmentObject var ans_tab: Ans
    @EnvironmentObject var ans_profile: Ans2

    var body: some View {
        ZStack{
            VStack{
                ScrollView{
                    
                    ZStack(alignment: .center) {
                        Button(action: {}, label: {
                            NavigationLink(destination: QuizScroll()
                                .environmentObject(ans_tab)
                                .environmentObject(ans_profile)
                            ){
                                Image(systemName: "clock.circle")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 100)
                                    .padding(.all, 20)
                                    .foregroundColor(.white)
                                VStack(alignment: .leading) {
                                    Text("Schedule")
                                        .font(.system(size: 26, weight: .bold, design: .default))
                                        .foregroundColor(.white)
                                }.padding(.trailing, 20)
                                Spacer()
                            }
                        })
                        .frame(width: 400, height: abs(UIScreen.main.bounds.height*0.2))
                        .background(Color.mint)
                        //.modifier(CardModifier())
                    }
                    VStack(alignment: .center) {
                        Button(action: {}, label: {
                            NavigationLink(destination: QuizScroll2()
                                .environmentObject(ans_tab)
                                .environmentObject(ans_profile)){
                                    Image(systemName: "person.text.rectangle.fill")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 100)
                                        .padding(.all, 20)
                                        .foregroundColor(.white)
                                    
                                    VStack(alignment: .leading) {
                                        Text("Personal")
                                            .font(.system(size: 26, weight: .bold, design: .default))
                                            .foregroundColor(.white)
                                    }
                                    Spacer()
                                }
                        })
                        .frame(width: 400, height: abs(UIScreen.main.bounds.height*0.2))
                        .background(Color.teal)
                        //.modifier(CardModifier())
                    }
                    
                    VStack(alignment: .center) {
                        Button(action: {}, label: {
                            NavigationLink(destination: QuizScroll4()
                                .environmentObject(ans_tab)
                                .environmentObject(ans_profile)){
                                    Image(systemName: "music.note.house.fill")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 100)
                                        .padding(.all, 20)
                                        .foregroundColor(.white)
                                    VStack(alignment: .leading) {
                                        Text("Routines")
                                            .font(.system(size: 26, weight: .bold, design: .default))
                                            .foregroundColor(.white)
                                    }.padding(.trailing, 20)
                                    Spacer()
                                }
                        })
                        .frame(width: 400, height: abs(UIScreen.main.bounds.height*0.2))
                        .background(.blue)
                        //.modifier(CardModifier())
                    }
                    VStack(alignment: .center) {
                        Button(action: {}, label: {
                            NavigationLink(destination: QuizScroll5()
                                .environmentObject(ans_tab)
                                .environmentObject(ans_profile)){
                                    Image(systemName: "books.vertical.circle.fill")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 100)
                                        .padding(.all, 20)
                                        .foregroundColor(.white)
                                    VStack(alignment: .leading) {
                                        Text("Habit")
                                            .font(.system(size: 26, weight: .bold, design: .default))
                                            .foregroundColor(.white)
                                    }.padding(.trailing, 20)
                                    Spacer()
                                }
                        })
                        .frame(width: 400, height: abs(UIScreen.main.bounds.height*0.2))
                        .background(Color.indigo)
                        //.modifier(CardModifier())
                    }
                    VStack(alignment: .center) {
                        Button(action: {}, label: {
                            NavigationLink(destination: QuizScroll3()
                                .environmentObject(ans_tab)
                                .environmentObject(ans_profile)){
                                    Image(systemName: "hand.thumbsup.circle.fill")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 100)
                                        .padding(.all, 20)
                                        .foregroundColor(.white)
                                    VStack(alignment: .leading) {
                                        Text("Preference")
                                            .font(.system(size: 26, weight: .bold, design: .default))
                                            .foregroundColor(.white)
                                    }.padding(.trailing, 20)
                                    Spacer()
                                }
                        })
                        .frame(width: 400, height: abs(UIScreen.main.bounds.height*0.2))
                        .background(Color.purple)
                        //.modifier(CardModifier())
                    }
                }
        }.padding(.bottom, abs(UIScreen.main.bounds.height*0.15))
            HStack{
                GeometryReader { geometry in
                    VStack {
                        Spacer()
                        HStack {
                            NavigationLink(destination: ProfileView()
                                .onAppear(){
                                fetchBasic(uid: uid)
                                print(uid)
                            }
                               
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
                            NavigationLink(destination: SettingView()
                                .environmentObject(ans_tab)
                                .environmentObject(ans_profile)){
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
                                }
                            }.accentColor(Color(.systemBlue))
                        }
                        .frame(width: geometry.size.width, height: geometry.size.height/8)
                    }
                }
            }
            .padding(.horizontal)
        }
        .navigationBarHidden(true)
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
                        
                        /*
                        do {try JSONDecoder().decode(BasicInfo.self, from: data)}
                        catch {print(error)
                            print(uid)
                        }
                        */
                       
                            
                            if let response = try? JSONDecoder().decode(BasicInfo.self, from: data) {
                                
                                // DispatchQueue.main.async {
                                ans_profile.user_name = response.user_name
                                ans_profile.email = response.email
                                ans_profile.gender = response.gender
                                ans_profile.school_year = response.school_year
                                ans_profile.rent = response.rent
                                // }
                                
                                return
                            } else {
                                print("Decoding error occurs...")
                            }
                        
                    }
            
        }.resume()
          
    }
}

struct QuizScroll: View {
    @EnvironmentObject var ans_tab: Ans
    @EnvironmentObject var ans_profile: Ans2
    
    var body: some View {
        ZStack{
            VStack{
                ZStack(alignment: .center) {
                    Button(action: {}, label: {
                        NavigationLink(destination: Quiz4_home()
                            .environmentObject(ans_tab)
                            .environmentObject(ans_profile)){
                            VStack(alignment: .leading) {
                                Text("Move in Date")
                                    .font(.title)
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                            }
                                .frame(width:700 ,height: 150, alignment: .center)
                            Spacer()
                        }
                    })
                    .frame(width: 350, height: abs(UIScreen.main.bounds.height*0.15), alignment: .center)
                    .background(Color.mint)
                    .modifier(CardModifier())
                }
                ZStack(alignment: .center) {
                    Button(action: {}, label: {
                        NavigationLink(destination: Quiz6_home()
                            .environmentObject(ans_tab)
                            .environmentObject(ans_profile)){
                            VStack(alignment: .leading) {
                                Text("Ideal Location")
                                    .font(.title)
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                            }
                                .frame(width:700 ,height: 150, alignment: .center)
                            Spacer()
                        }
                    })
                    .frame(width: 350, height: abs(UIScreen.main.bounds.height*0.15), alignment: .center)
                    .background(Color.mint)
                    .modifier(CardModifier())
                }
                ZStack(alignment: .center) {
                    Button(action: {}, label: {
                        NavigationLink(destination: Quiz7_home()
                            .environmentObject(ans_tab)
                            .environmentObject(ans_profile)){
                            VStack(alignment: .leading) {
                                Text("Sleep Time")
                                    .font(.title)
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                            }
                                .frame(width:700 ,height: abs(UIScreen.main.bounds.height*0.15), alignment: .center)
                            Spacer()
                        }
                    })
                    .frame(width: 350, height: abs(UIScreen.main.bounds.height*0.15), alignment: .center)
                    .background(Color.mint)
                    .modifier(CardModifier())
                }
                ZStack(alignment: .center) {
                    Button(action: {}, label: {
                        NavigationLink(destination: Quiz8_home()
                            .environmentObject(ans_tab)
                            .environmentObject(ans_profile)){
                            VStack(alignment: .leading) {
                                Text("Wake Up Time")
                                    .font(.title)
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                            }
                                .frame(width:700 ,height: 150, alignment: .center)
                        }
                    })
                    .frame(width: 350, height: abs(UIScreen.main.bounds.height*0.15), alignment: .center)
                    .background(Color.mint)
                    .modifier(CardModifier())
                }
            }
            .padding(.bottom,abs(UIScreen.main.bounds.height*0.1))
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
                                NavigationLink(destination: SettingView()
                                    .environmentObject(ans_tab)
                                    .environmentObject(ans_profile)){
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
                                    }
                                }.accentColor(Color(.systemBlue))
                            }
                            .frame(width: geometry.size.width, height: geometry.size.height/8)
                        }
                    }         .edgesIgnoringSafeArea(.bottom)
                }
                .padding(.horizontal)
            }
        .navigationBarBackButtonHidden(true)
    }
}

struct QuizScroll2: View {
    @EnvironmentObject var ans_tab: Ans
    @EnvironmentObject var ans_profile: Ans2
    var body: some View {
        ZStack{
            VStack{

                ZStack(alignment: .center) {
                    Button(action: {}, label: {
                        NavigationLink(destination: Quiz1_home()
                            .environmentObject(ans_tab)
                            .environmentObject(ans_profile)){
                            VStack(alignment: .leading) {
                                Text("Name")
                                    .font(.title)
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                            }.padding(.trailing, 20)
                                .frame(width:400 ,height: 160, alignment: .center)
                            Spacer()
                        }
                    })
                    .frame(width: 350, height: abs(UIScreen.main.bounds.height*0.15), alignment: .center)
                    .background(Color.teal)
                    .modifier(CardModifier())
                }
                ZStack(alignment: .center) {
                    Button(action: {}, label: {
                        NavigationLink(destination: Quiz2_home()
                            .environmentObject(ans_tab)
                            .environmentObject(ans_profile)){
                            VStack(alignment: .leading) {
                                Text("School Year")
                                    .font(.title)
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                            }.padding(.trailing, 20)
                                .frame(width:400 ,height: 160, alignment: .center)
                            Spacer()
                        }
                    })
                    .frame(width: 350, height: abs(UIScreen.main.bounds.height*0.15), alignment: .center)
                    .background(Color.teal)
                    .modifier(CardModifier())
                }
                ZStack(alignment: .center) {
                    Button(action: {}, label: {
                        NavigationLink(destination: Quiz3_home()
                            .environmentObject(ans_tab)
                            .environmentObject(ans_profile)){
                            VStack(alignment: .leading) {
                                Text("Rent")
                                    .font(.title)
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                            }.padding(.trailing, 20)
                                .frame(width:400 ,height: 160, alignment: .center)
                        }
                    })
                    .frame(width: 350, height: abs(UIScreen.main.bounds.height*0.15), alignment: .center)
                    .background(Color.teal)
                    .modifier(CardModifier())
                }
                ZStack(alignment: .center) {
                    Button(action: {}, label: {
                        NavigationLink(destination: Quiz5_home()
                            .environmentObject(ans_tab)
                            .environmentObject(ans_profile)){
                            VStack(alignment: .leading) {
                                Text("Number of roommates")
                                    .font(.title)
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                            }.padding(.trailing, 20)
                                .frame(width:400 ,height: 160, alignment: .center)
                        }
                    })
                    .frame(width: 350, height: abs(UIScreen.main.bounds.height*0.15), alignment: .center)
                    .background(Color.teal)
                    .modifier(CardModifier())
                }
            }.padding(.bottom,abs(UIScreen.main.bounds.height*0.1))
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
                            NavigationLink(destination: SettingView()
                                .environmentObject(ans_tab)
                                .environmentObject(ans_profile)){
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
                                }
                            }.accentColor(Color(.systemBlue))
                        }
                        .frame(width: geometry.size.width, height: geometry.size.height/8)
                    }
                }         .edgesIgnoringSafeArea(.bottom)
            }
            .padding(.horizontal)
        }
    .navigationBarBackButtonHidden(true)
}
}


struct QuizScroll4: View {
    @EnvironmentObject var ans_tab: Ans
    @EnvironmentObject var ans_profile: Ans2
    var body: some View {
        ZStack{
            ScrollView{
                VStack{
                    ZStack(alignment: .center) {
                        Button(action: {}, label: {
                            NavigationLink(destination: Quiz9_home()
                                .environmentObject(ans_tab)
                                .environmentObject(ans_profile)){
                                    VStack(alignment: .center) {
                                        Text("Bring people back")
                                            .font(.title)
                                            .fontWeight(.bold)
                                            .foregroundColor(.white)
                                    }.padding(.trailing, 1)
                                        .frame(width: 350, height: abs(UIScreen.main.bounds.height*0.15), alignment: .center)
                                    Spacer()
                                }
                        })
                        .frame(width: 350, height: abs(UIScreen.main.bounds.height*0.15), alignment: .center)
                        .background(Color(.systemBlue))
                        .modifier(CardModifier())
                    }
                    ZStack(alignment: .center) {
                        Button(action: {}, label: {
                            NavigationLink(destination: Quiz10_home()
                                .environmentObject(ans_tab)
                                .environmentObject(ans_profile)){
                                    VStack(alignment: .center) {
                                        Text("Animals")
                                            .font(.title)
                                            .fontWeight(.bold)
                                            .foregroundColor(.white)
                                    }.padding(.trailing, 5)
                                        .frame(width: 350, height: abs(UIScreen.main.bounds.height*0.15), alignment: .center)
                                    Spacer()
                                }
                        })
                        .frame(width: 350, height: abs(UIScreen.main.bounds.height*0.15), alignment: .center)
                        .background(Color(.systemBlue))
                        .modifier(CardModifier())
                    }
                    ZStack(alignment: .center) {
                        Button(action: {}, label: {
                            NavigationLink(destination: Quiz11_home()
                                .environmentObject(ans_tab)
                                .environmentObject(ans_profile)){
                                    VStack(alignment: .center) {
                                        Text("Music or Instruments")
                                            .font(.title)
                                            .fontWeight(.bold)
                                            .foregroundColor(.white)
                                    }.padding(.trailing, 10)
                                        .frame(width: 350, height: abs(UIScreen.main.bounds.height*0.15), alignment: .center)
                                }
                        })
                        .frame(width: 350, height: abs(UIScreen.main.bounds.height*0.15), alignment: .center)
                        .background(Color(.systemBlue))
                        .modifier(CardModifier())
                    }
                    ZStack(alignment: .center) {
                        Button(action: {}, label: {
                            NavigationLink(destination: Quiz12_home()
                                .environmentObject(ans_tab)
                                .environmentObject(ans_profile)){
                                    VStack(alignment: .leading) {
                                        Text("Clean")
                                            .font(.title)
                                            .fontWeight(.bold)
                                            .foregroundColor(.white)
                                    }.padding(.trailing, 20)
                                        .frame(width: 350, height: abs(UIScreen.main.bounds.height*0.15), alignment: .center)
                                }
                        })
                        .frame(width: 350, height: abs(UIScreen.main.bounds.height*0.15), alignment: .center)
                        .background(Color(.systemBlue))
                        .modifier(CardModifier())
                    }
                    ZStack(alignment: .center) {
                        Button(action: {}, label: {
                            NavigationLink(destination: Quiz13_home()
                                .environmentObject(ans_tab)
                                .environmentObject(ans_profile)){
                                    VStack(alignment: .leading) {
                                        Text("Cook")
                                            .font(.title)
                                            .fontWeight(.bold)
                                            .foregroundColor(.white)
                                    }.padding(.trailing, 20)
                                        .frame(width: 350, height: abs(UIScreen.main.bounds.height*0.15), alignment: .center)
                                }
                        })
                        .frame(width: 350, height: abs(UIScreen.main.bounds.height*0.15), alignment: .center)
                        .background(Color(.systemBlue))
                        .modifier(CardModifier())
                    }
                }
            }
            .padding(.bottom,abs(UIScreen.main.bounds.height*0.1))
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
                            NavigationLink(destination: SettingView()
                                .environmentObject(ans_tab)
                                .environmentObject(ans_profile)){
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
                                }
                            }.accentColor(Color(.systemBlue))
                        }
                        .frame(width: geometry.size.width, height: geometry.size.height/8)
                    }
                }         .edgesIgnoringSafeArea(.bottom)
            }
            .padding(.horizontal)
        }
    .navigationBarBackButtonHidden(true)
}
}


struct QuizScroll5: View {
    @EnvironmentObject var ans_tab: Ans
    @EnvironmentObject var ans_profile: Ans2
    var body: some View {
        ZStack{
            VStack{
                ScrollView{
                    ZStack(alignment: .center) {
                        Button(action: {}, label: {
                            NavigationLink(destination: Quiz14_home()
                                .environmentObject(ans_tab)
                                .environmentObject(ans_profile)){
                                    VStack(alignment: .center) {
                                        Text("Sharing Items")
                                            .font(.title)
                                            .fontWeight(.bold)
                                            .foregroundColor(.white)
                                    }.padding(.trailing, 1)
                                        .frame(width: 350, height: abs(UIScreen.main.bounds.height*0.15), alignment: .center)
                                    Spacer()
                                }
                        })
                        .frame(width: 350, height: abs(UIScreen.main.bounds.height*0.15), alignment: .center)
                        .background(Color.indigo)
                        .modifier(CardModifier())
                    }
                    ZStack(alignment: .center) {
                        Button(action: {}, label: {
                            NavigationLink(destination: Quiz15_home()
                                .environmentObject(ans_tab)
                                .environmentObject(ans_profile)){
                                    VStack(alignment: .leading) {
                                        Text("Smoke")
                                            .font(.title)
                                            .fontWeight(.bold)
                                            .foregroundColor(.white)
                                    }.padding(.trailing, 1)
                                        .frame(width: 350, height: abs(UIScreen.main.bounds.height*0.15), alignment: .center)
                                    Spacer()
                                }
                        })
                        .frame(width: 350, height: abs(UIScreen.main.bounds.height*0.15), alignment: .center)
                        .background(Color.indigo)
                        .modifier(CardModifier())
                    }
                    ZStack(alignment: .center) {
                        Button(action: {}, label: {
                            NavigationLink(destination: Quiz16_home()
                                .environmentObject(ans_tab)
                                .environmentObject(ans_profile)){
                                    VStack(alignment: .leading) {
                                        Text("Drinks")
                                            .font(.title)
                                            .fontWeight(.bold)
                                            .foregroundColor(.white)
                                    }.padding(.trailing, 1)
                                        .frame(width: 350, height: abs(UIScreen.main.bounds.height*0.15), alignment: .center)
                                    Spacer()
                                }
                        })
                        .frame(width: 350, height: abs(UIScreen.main.bounds.height*0.15), alignment: .center)
                        .background(Color.indigo)
                        .modifier(CardModifier())
                    }
                    ZStack(alignment: .center) {
                        Button(action: {}, label: {
                            NavigationLink(destination: Quiz17_home()
                                .environmentObject(ans_tab)
                                .environmentObject(ans_profile)){
                                    VStack(alignment: .leading) {
                                        Text("Roommate Personality")
                                            .font(.title)
                                            .fontWeight(.bold)
                                            .foregroundColor(.white)
                                    }.padding(.trailing, 1)
                                        .frame(width: 350, height: abs(UIScreen.main.bounds.height*0.15), alignment: .center)
                                    Spacer()
                                }
                        })
                        .frame(width: 350, height: abs(UIScreen.main.bounds.height*0.15), alignment: .center)
                        .background(Color.indigo)
                        .modifier(CardModifier())
                    }
                    ZStack(alignment: .center) {
                        Button(action: {}, label: {
                            NavigationLink(destination: Quiz18_home()
                                .environmentObject(ans_tab)
                                .environmentObject(ans_profile)){
                                    VStack(alignment: .leading) {
                                        Text("Academics")
                                            .font(.title)
                                            .fontWeight(.bold)
                                            .foregroundColor(.white)
                                    }.padding(.trailing, 1)
                                        .frame(width: 350, height: abs(UIScreen.main.bounds.height*0.15), alignment: .center)
                                    Spacer()
                                }
                        })
                        .frame(width: 350, height: abs(UIScreen.main.bounds.height*0.15), alignment: .center)
                        .background(Color.indigo)
                        .modifier(CardModifier())
                    }
                }
            }
            .padding(.bottom, 135)
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
                                NavigationLink(destination: SettingView()
                                    .environmentObject(ans_tab)
                                    .environmentObject(ans_profile)){
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
                                    }
                                }.accentColor(Color(.systemBlue))
                            }
                            .frame(width: geometry.size.width, height: geometry.size.height/8)
                        }
                    }         .edgesIgnoringSafeArea(.bottom)
                }
                .padding(.horizontal)
            }
        .navigationBarBackButtonHidden(true)
    }
}


struct QuizScroll3: View {
    @EnvironmentObject var ans_tab: Ans
    @EnvironmentObject var ans_profile: Ans2
    var body: some View {
        ZStack{
            VStack{
                ScrollView{
                    Group{
                        ZStack(alignment: .center) {
                            Button(action: {}, label: {
                                NavigationLink(destination: h_Quiz7w()
                                    .environmentObject(ans_tab)
                                    .environmentObject(ans_profile)){
                                        VStack(alignment: .center) {
                                            Text("Bed Time")
                                                .font(.title)
                                                .fontWeight(.bold)
                                                .foregroundColor(.white)
                                        }.padding(.trailing, 1)
                                            .frame(width: 350, height: abs(UIScreen.main.bounds.height*0.15), alignment: .center)
                                        Spacer()
                                    }
                            })
                            .frame(width: 350, height: abs(UIScreen.main.bounds.height*0.15), alignment: .center)
                            .background(Color.purple)
                            .modifier(CardModifier())
                        }
                        ZStack(alignment: .center) {
                            Button(action: {}, label: {
                                NavigationLink(destination: h_Quiz8w()
                                    .environmentObject(ans_tab)
                                    .environmentObject(ans_profile)){
                                        VStack(alignment: .leading) {
                                            Text("Wake Up Time")
                                                .font(.title)
                                                .fontWeight(.bold)
                                                .foregroundColor(.white)
                                        }.padding(.trailing, 1)
                                            .frame(width: 350, height: abs(UIScreen.main.bounds.height*0.15), alignment: .center)
                                        Spacer()
                                    }
                            })
                            .frame(width: 350, height: abs(UIScreen.main.bounds.height*0.15), alignment: .center)
                            .background(Color.purple)
                            .modifier(CardModifier())
                        }
                        ZStack(alignment: .center) {
                            Button(action: {}, label: {
                                NavigationLink(destination: h_Quiz9w()
                                    .environmentObject(ans_tab)
                                    .environmentObject(ans_profile)){
                                        VStack(alignment: .leading) {
                                            Text("Bring People")
                                                .font(.title)
                                                .fontWeight(.bold)
                                                .foregroundColor(.white)
                                        }.padding(.trailing, 1)
                                            .frame(width: 350, height: abs(UIScreen.main.bounds.height*0.15), alignment: .center)
                                        Spacer()
                                    }
                            })
                            .frame(width: 350, height: abs(UIScreen.main.bounds.height*0.15), alignment: .center)
                            .background(Color.purple)
                            .modifier(CardModifier())
                        }
                        ZStack(alignment: .center) {
                            Button(action: {}, label: {
                                NavigationLink(destination: h_Quiz10w()
                                    .environmentObject(ans_tab)
                                    .environmentObject(ans_profile)){
                                        VStack(alignment: .leading) {
                                            Text("Pet")
                                                .font(.title)
                                                .fontWeight(.bold)
                                                .foregroundColor(.white)
                                        }.padding(.trailing, 1)
                                            .frame(width: 350, height: abs(UIScreen.main.bounds.height*0.15), alignment: .center)
                                        Spacer()
                                    }
                            })
                            .frame(width: 350, height: abs(UIScreen.main.bounds.height*0.15), alignment: .center)
                            .background(Color.purple)
                            .modifier(CardModifier())
                        }
                    }
                    ZStack(alignment: .center) {
                        Button(action: {}, label: {
                            NavigationLink(destination: h_Quiz11w()
                                .environmentObject(ans_tab)
                                .environmentObject(ans_profile)){
                                    VStack(alignment: .leading) {
                                        Text("Music")
                                            .font(.title)
                                            .fontWeight(.bold)
                                            .foregroundColor(.white)
                                    }.padding(.trailing, 1)
                                        .frame(width: 350, height: abs(UIScreen.main.bounds.height*0.15), alignment: .center)
                                    Spacer()
                                }
                        })
                        .frame(width: 350, height: abs(UIScreen.main.bounds.height*0.15), alignment: .center)
                        .background(Color.purple)
                        .modifier(CardModifier())
                    }
                    ZStack(alignment: .center) {
                        Button(action: {}, label: {
                            NavigationLink(destination: h_Quiz12w()
                                .environmentObject(ans_tab)
                                .environmentObject(ans_profile)){
                                    VStack(alignment: .leading) {
                                        Text("Clean")
                                            .font(.title)
                                            .fontWeight(.bold)
                                            .foregroundColor(.white)
                                    }.padding(.trailing, 1)
                                        .frame(width: 350, height: abs(UIScreen.main.bounds.height*0.15), alignment: .center)
                                    Spacer()
                                }
                        })
                        .frame(width: 350, height: abs(UIScreen.main.bounds.height*0.15), alignment: .center)
                        .background(Color.purple)
                        .modifier(CardModifier())
                    }
                    ZStack(alignment: .center) {
                        Button(action: {}, label: {
                            NavigationLink(destination: h_Quiz13w()
                                .environmentObject(ans_tab)
                                .environmentObject(ans_profile)){
                                    VStack(alignment: .leading) {
                                        Text("Cooking")
                                            .font(.title)
                                            .fontWeight(.bold)
                                            .foregroundColor(.white)
                                    }.padding(.trailing, 1)
                                        .frame(width: 350, height: abs(UIScreen.main.bounds.height*0.15), alignment: .center)
                                    Spacer()
                                }
                        })
                        .frame(width: 350, height: abs(UIScreen.main.bounds.height*0.15), alignment: .center)
                        .background(Color.purple)
                        .modifier(CardModifier())
                    }
                    ZStack(alignment: .center) {
                        Button(action: {}, label: {
                            NavigationLink(destination: h_Quiz14w()
                                .environmentObject(ans_tab)
                                .environmentObject(ans_profile)){
                                    VStack(alignment: .leading) {
                                        Text("sharing preference")
                                            .font(.title)
                                            .fontWeight(.bold)
                                            .foregroundColor(.white)
                                    }.padding(.trailing, 1)
                                        .frame(width: 350, height: abs(UIScreen.main.bounds.height*0.15), alignment: .center)
                                    Spacer()
                                }
                        })
                        .frame(width: 350, height: abs(UIScreen.main.bounds.height*0.15), alignment: .center)
                        .background(Color.purple)
                        .modifier(CardModifier())
                    }
                    ZStack(alignment: .center) {
                        Button(action: {}, label: {
                            NavigationLink(destination: h_Quiz15w()
                                .environmentObject(ans_tab)
                                .environmentObject(ans_profile)){
                                    VStack(alignment: .leading) {
                                        Text("Smoke")
                                            .font(.title)
                                            .fontWeight(.bold)
                                            .foregroundColor(.white)
                                    }.padding(.trailing, 1)
                                        .frame(width: 350, height: abs(UIScreen.main.bounds.height*0.15), alignment: .center)
                                    Spacer()
                                }
                        })
                        .frame(width: 350, height: abs(UIScreen.main.bounds.height*0.15), alignment: .center)
                        .background(Color.purple)
                        .modifier(CardModifier())
                    }
                    ZStack(alignment: .center) {
                        Button(action: {}, label: {
                            NavigationLink(destination: h_Quiz16w()
                                .environmentObject(ans_tab)
                                .environmentObject(ans_profile)){
                                    VStack(alignment: .leading) {
                                        Text("Alcohol")
                                            .font(.title)
                                            .fontWeight(.bold)
                                            .foregroundColor(.white)
                                    }.padding(.trailing, 1)
                                        .frame(width: 350, height: abs(UIScreen.main.bounds.height*0.15), alignment: .center)
                                    Spacer()
                                }
                        })
                        .frame(width: 350, height: abs(UIScreen.main.bounds.height*0.15), alignment: .center)
                        .background(Color.purple)
                        .modifier(CardModifier())
                    }
                    ZStack(alignment: .center) {
                        Button(action: {}, label: {
                            NavigationLink(destination: h_Quiz17w()
                                .environmentObject(ans_tab)
                                .environmentObject(ans_profile)){
                                    VStack(alignment: .leading) {
                                        Text("Personality")
                                            .font(.title)
                                            .fontWeight(.bold)
                                            .foregroundColor(.white)
                                    }.padding(.trailing, 1)
                                        .frame(width: 350, height: abs(UIScreen.main.bounds.height*0.15), alignment: .center)
                                    Spacer()
                                }
                        })
                        .frame(width: 350, height: abs(UIScreen.main.bounds.height*0.15), alignment: .center)
                        .background(Color.purple)
                        .modifier(CardModifier())
                    }
                    ZStack(alignment: .center) {
                        Button(action: {}, label: {
                            NavigationLink(destination: h_Quiz18w()
                                .environmentObject(ans_tab)
                                .environmentObject(ans_profile)){
                                    VStack(alignment: .leading) {
                                        Text("Academics")
                                            .font(.title)
                                            .fontWeight(.bold)
                                            .foregroundColor(.white)
                                    }.padding(.trailing, 1)
                                        .frame(width: 350, height: abs(UIScreen.main.bounds.height*0.15), alignment: .center)
                                    Spacer()
                                }
                        })
                        .frame(width: 350, height: abs(UIScreen.main.bounds.height*0.15), alignment: .center)
                        .background(Color.purple)
                        .modifier(CardModifier())
                    }
                    
                }
            }
            .padding(.bottom, 135)
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
                            NavigationLink(destination: SettingView()
                                .environmentObject(ans_tab)
                                .environmentObject(ans_profile)){
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
                                }
                            }.accentColor(Color(.systemBlue))
                        }
                        .frame(width: geometry.size.width, height: geometry.size.height/8)
                    }
                }         .edgesIgnoringSafeArea(.bottom)
            }
            .padding(.horizontal)
        }
        .navigationBarBackButtonHidden(true)
    }
}

                      

struct QuizScroll_Previews: PreviewProvider {
     static var previews: some View {
         NavigationView{
             QuizScrollselection()
         }
    }
}
