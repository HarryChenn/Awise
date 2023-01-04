//
//  tab.swift
//  Awise
//
//  Created by liu zhenke on 11/18/22.
//

import SwiftUI

struct Tab_Previews: PreviewProvider {
     static var previews: some View {
         NavigationView{
             HomeView()
         }
    }
}




// store matching result values
class Ans: ObservableObject {
    // user ID
    @Published var user_id_list: [Int] = [0]
    
    // match score list
    @Published var match_score_list: [Float] = [0.0]
    @Published var match_score_list2: Float = 0.0
    @Published var match_score_list3: Float = 0.0
    @Published var match_score_list4: Float = 0.0
    
    // detailed matching scores
    @Published var first_match_field_list_str1: String = ""
    @Published var first_match_field_list_val1: String = ""
    
    @Published var second_match_field_list_str1: String = ""
    @Published var second_match_field_list_val1: String = ""
    
    @Published var third_match_field_list_str1: String = ""
    @Published var third_match_field_list_val1: String = ""
    
    @Published var first_match_field_list_str2: String = ""
    @Published var first_match_field_list_val2: String = ""
    
    @Published var second_match_field_list_str2: String = ""
    @Published var second_match_field_list_val2: String = ""
    
    @Published var third_match_field_list_str2: String = ""
    @Published var third_match_field_list_val2: String = ""

    
    @Published var first_match_field_list_str3: String = ""
    @Published var first_match_field_list_val3: String = ""
    
    @Published var second_match_field_list_str3: String = ""
    @Published var second_match_field_list_val3: String = ""
    
    @Published var third_match_field_list_str3: String = ""
    @Published var third_match_field_list_val3: String = ""
    
    
    
    
    
    @Published var user_email1: String = ""
    @Published var user_email2: String = ""
    @Published var user_email3: String = ""
    @Published var user_email4: String = ""
}




// store user info values for profile
class Ans2: ObservableObject {
    @Published var user_name: String = ""
    @Published var email: String = ""
    @Published var gender: String = ""
    @Published var school_year: Int = 0
    @Published var rent: Int = 0
    
}
 
// fetch matching result values
struct MatchRes: Codable {
    var user_id_list: [Int]
    var user_email_list: [String]
    var match_score_list: [Float]
    var first_match_field_list: [[String]]
    var second_match_field_list: [[String]]
    var third_match_field_list: [[String]]
    
    
}

struct MatchRes2: Codable {
    var user_id_list: [Int]
    var match_score_list: [Float]
    var first_match_field_list: [[String]]
    var second_match_field_list: [[String]]
    var third_match_field_list: [[String]]
    
    
}


// fetch user info values
struct BasicInfo: Codable {
    var user_id:Int = -1
    var user_name:String = ""
    var email:String = ""
    var password:String = ""
    var gender:String = ""
    // let profile_picture: Image
    var school_year:Int = -1
    var rent:Int = -1
    var move_in_date:String = ""
    var number_of_room:Int = -1
    var location:String = ""
}

struct HomeView: View{
    
    // @State private var results = BasicInfo()
    
    @StateObject var ans_tab = Ans()
    @StateObject var ans_profile = Ans2() // basic info for profile
    var gold = #colorLiteral(red: 0.9882352941, green: 0.7607843137, blue: 0, alpha: 1)

    var body: some View {
        ZStack{
                    VStack(alignment: .leading){
                        Text("Summary")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .padding([.top, .leading, .bottom])
                        Text("Potential Roomates")
                            .font(.title3)
                            .fontWeight(.semibold)
                            .multilineTextAlignment(.leading)
                            .padding([.leading])
                        ScrollView(.horizontal){
                        HStack{
                            Spacer()
                            NavigationLink(destination: Roommate()
                                .environmentObject(ans_tab)
                                .environmentObject(ans_profile)
                                .onAppear(){
                                    fetchMatch(uid: uid)
                                    print("this is a test")
                                    print(uid)
                                    
                                    
                                }){
                                    ZStack(alignment:.center){
                                        RoundedRectangle(cornerRadius: 25)
                                            .foregroundColor(.blue)
                                            .opacity(0.5)
                                            .frame(width:abs(UIScreen.main.bounds.width*0.7), height: abs(UIScreen.main.bounds.height*0.6))
                                        
                                        VStack{
                                            Image(systemName: "person.fill.checkmark.rtl")
                                                .rotation3DEffect(
                                                    .degrees(20),
                                                    axis: (x: 1.0, y: 0.0, z: -0.5)
                                                )
                                                .font(.system(size: 60))
                                                .foregroundColor(.black)
                                            Text("Roommate")
                                                .font(.title)
                                                .foregroundColor(.black)
                                                .fontWeight(.bold)
                                                .padding(.vertical)
                                            Text("Meet your ")
                                                .font(.headline)
                                                .foregroundColor(.black)
                                                .fontWeight(.bold)
                                                .opacity(0.7)
                                                .lineLimit(2)
                                                .multilineTextAlignment(.center)
                                            Text("roommates!")
                                                .font(.headline)
                                                .foregroundColor(.black)
                                                .fontWeight(.bold)
                                                .opacity(0.7)
                                                .lineLimit(2)
                                                .multilineTextAlignment(.center)
                                            
                                        }
                                        
                                    }
                                }
                                .disabled(uid != -400 ? false : true)
                            NavigationLink(destination: Result()
                                .environmentObject(ans_tab)
                                .environmentObject(ans_profile)
                                .onAppear(){
                                    fetchMatch(uid: uid)
                                }){
                                    ZStack(alignment:.center){
                                        RoundedRectangle(cornerRadius: 25)
                                            .foregroundColor(Color(gold))
                                        //.opacity(0.6)
                                            .frame(width:abs(UIScreen.main.bounds.width*0.7), height: abs(UIScreen.main.bounds.height*0.6))
                                        
                                        VStack{
                                            Image(systemName: "list.bullet.rectangle.portrait.fill")
                                                .rotation3DEffect(
                                                    .degrees(20),
                                                    axis: (x: 1.0, y: 0.0, z: -0.5)
                                                )
                                                .font(.system(size: 60))
                                                .foregroundColor(.black)
                                            Text("Results")
                                                .font(.title)
                                                .foregroundColor(.black)
                                                .fontWeight(.bold)
                                                .padding(.vertical)
                                            Text("See detailed ")
                                                .font(.headline)
                                                .foregroundColor(.black)
                                                .fontWeight(.bold)
                                                .opacity(0.7)
                                                .lineLimit(2)
                                                .multilineTextAlignment(.center)
                                            Text("Match Results!")
                                                .font(.headline)
                                                .foregroundColor(.black)
                                                .fontWeight(.bold)
                                                .opacity(0.7)
                                                .lineLimit(2)
                                                .multilineTextAlignment(.center)
                                            
                                        }
                                        
                                    }
                                }
                                .disabled(uid != -400 ? false : true)
                            Spacer()
                        }
                }
               /*NavigationLink(destination: matchScore()
                    .environmentObject(ans_tab)
                    .environmentObject(ans_profile)
                    .onAppear(){
                        fetchMatch(uid: uid)
                    }){
                    ZStack(alignment:.center){
                        RoundedRectangle(cornerRadius: 25)
                            .foregroundColor(.blue)
                            .opacity(0.7)
                            .frame(width:abs(UIScreen.main.bounds.width-35), height: abs(UIScreen.main.bounds.height*0.25))

                        VStack{
                            Image(systemName: "laptopcomputer.and.iphone")
                                .rotation3DEffect(
                                    .degrees(20),
                                    axis: (x: 1.0, y: 0.0, z: -0.5)
                                )
                                .font(.system(size: 60))
                                .foregroundColor(.black)
                            Text("Match Score")
                                .font(.title)
                                .foregroundColor(.black)
                                .fontWeight(.bold)
                                .padding(.vertical)
                            Text("See detailed ")
                                .font(.title3)
                                .foregroundColor(.black)
                                .fontWeight(.bold)
                                .opacity(0.7)
                                .lineLimit(2)
                                .multilineTextAlignment(.center)
                            Text("Match Scores!")
                                .font(.title3)
                                .foregroundColor(.black)
                                .fontWeight(.bold)
                                .opacity(0.7)
                                .lineLimit(2)
                                .multilineTextAlignment(.center)
                                
                        }
                        
                    }*/
                //}
                .padding([.leading, .bottom, .trailing])
                .disabled(uid != -400 ? false : true)
                Spacer()
            }
            .padding(.bottom, UIScreen.main.bounds.height*0.15)
            .navigationBarBackButtonHidden(true)
            HStack{
                GeometryReader { geometry in
                    VStack {
                        Spacer()
                        HStack {
                            NavigationLink(destination: ProfileView()
                                .environmentObject(ans_profile)
                                .environmentObject(ans_tab)
                                .onAppear(){
                                    fetchBasic(uid: uid)
                                    print(uid)
                                }){
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
                            .disabled(uid != -400 ? false : true)
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
                            }
                            .accentColor(Color(.systemBlue))
                            .disabled(uid != -400 ? false : true)
                             
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
                                .disabled(uid != -400 ? false : true)
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
                                // .disabled(uid != -400 ? false : true)
                        }
                        .frame(width: geometry.size.width, height: geometry.size.height/8)
                    }
                }         .edgesIgnoringSafeArea(.bottom)
                
            }
            .padding(.horizontal)
            
        }
    }
    
    // fetch data for profile
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
  
    // fetch data for matching results
    func fetchMatch(uid: Int){
        let urlString = "https://awise.herokuapp.com/api/recommender/retrieve-match-result-base/\(uid)" // 127.0.0.1:8000
        // awise.herokuapp.com
        guard let url = URL(string: urlString) else {
              return
          }
        var request = URLRequest(url: url)

        // Make the request
        URLSession.shared.dataTask(with: request) { data, response, error in
                    if let data = data {
                        
                        /*
                        do {
                            try JSONDecoder().decode(MatchRes.self, from: data)
                        } catch {
                            print(error)
                        }
                        */
                        
                        /*
                        do {
                            try JSONDecoder().decode(MatchRes2.self, from: data)
                        } catch {
                            print(error)
                        }*/
                        
                        if let response = try? JSONDecoder().decode(MatchRes.self, from: data) {
                            // DispatchQueue.main.async {
                            //    self.results = response
                            // }
                            
                            // print(response.user_id_list)
                            // print(response)
                            ans_tab.user_id_list = response.user_id_list
                            print(response.user_id_list)
                            // match score list
                            
                            ans_tab.match_score_list = response.match_score_list
                            ans_tab.match_score_list2 = response.match_score_list[1]
                            ans_tab.match_score_list3 = response.match_score_list[2]
                            ans_tab.match_score_list4 = response.match_score_list[3]
                            //
                            ans_tab.first_match_field_list_str1 = response.first_match_field_list[0][0]
                            ans_tab.first_match_field_list_val1 = response.first_match_field_list[0][1]
                            ans_tab.second_match_field_list_str1 = response.first_match_field_list[0][0]
                            ans_tab.second_match_field_list_val1 = response.first_match_field_list[0][1]
                            
                            ans_tab.first_match_field_list_str2 = response.first_match_field_list[1][0]
                            ans_tab.first_match_field_list_val2 = response.first_match_field_list[1][1]
                            ans_tab.second_match_field_list_str2 = response.first_match_field_list[1][0]
                            ans_tab.second_match_field_list_val2 = response.first_match_field_list[1][1]
                            
                            ans_tab.first_match_field_list_str3 = response.first_match_field_list[2][0]
                            ans_tab.first_match_field_list_val3 = response.first_match_field_list[2][1]
                            ans_tab.second_match_field_list_str3 = response.first_match_field_list[2][0]
                            ans_tab.second_match_field_list_val3 = response.first_match_field_list[2][1]
                            
                            ans_tab.user_email1 = response.user_email_list[0]
                            ans_tab.user_email2 = response.user_email_list[1]
                            ans_tab.user_email3 = response.user_email_list[2]
                            ans_tab.user_email4 = response.user_email_list[3]
                            
                            
                             
                                
                        }
                        
                    }
            
            
            // print(response)
        }.resume()
          
    }
}

struct Roommate: View{
    @EnvironmentObject var ans_tab: Ans // matching results
    @EnvironmentObject var ans_profile: Ans2
    
    
    var body: some View {
        ZStack{
            VStack(alignment: .leading){
                
                Spacer()
                
                Text("Roommate")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                    .padding([.top, .leading])
                
                ScrollView{
                    ZStack() {
                        RoundedRectangle(cornerRadius: 25)
                            .foregroundColor(.blue)
                            .opacity(0.6)
                            .frame(width:abs(UIScreen.main.bounds.width-40), height: abs(UIScreen.main.bounds.height*0.25))
                        
                        Text(ans_tab.user_email1)
                            .font(.system(size: 26, weight: .bold, design: .default))
                            .foregroundColor(.white) // size was 26 originally
                    }
                    .padding()

                    ZStack() {
                        RoundedRectangle(cornerRadius: 25)
                            .foregroundColor(.blue)
                            .opacity(0.6)
                            .frame(width:abs(UIScreen.main.bounds.width-40), height: abs(UIScreen.main.bounds.height*0.25))
                        Text(ans_tab.user_email2) // ans_tab.user_email_list[1]
                            .font(.system(size: 26, weight: .bold, design: .default))
                            .foregroundColor(.white)
                    }
                    .padding()
                    ZStack() {
                        RoundedRectangle(cornerRadius: 25)
                            .foregroundColor(.blue)
                            .opacity(0.6)
                            .frame(width:abs(UIScreen.main.bounds.width-40), height: abs(UIScreen.main.bounds.height*0.25))
                        Text(ans_tab.user_email3) // ans_tab.user_email_list[2]
                            .font(.system(size: 26, weight: .bold, design: .default))
                            .foregroundColor(.white)
                    }
                    .padding()
                    ZStack() {
                        RoundedRectangle(cornerRadius: 25)
                            .foregroundColor(.blue)
                            .opacity(0.6)
                            .frame(width:abs(UIScreen.main.bounds.width-40), height: abs(UIScreen.main.bounds.height*0.25))
                        Text(ans_tab.user_email4) // ans_tab.user_email_list[2]
                            .font(.system(size: 26, weight: .bold, design: .default))
                            .foregroundColor(.white)
                    }
                    .padding()

                }
            }
            .padding(.bottom,abs(UIScreen.main.bounds.height*0.15))
            
            HStack{
                GeometryReader { geometry in
                    VStack {
                        Spacer()
                        HStack {
                            NavigationLink(destination: ProfileView()
                                .environmentObject(ans_tab)
                                .environmentObject(ans_profile)
                                .onAppear{
                                    fetchBasic(uid: uid)
                                }){
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
                            NavigationLink(destination: HomeView()
                                
                                ){
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
                       
                            
                            if let response = try? JSONDecoder().decode(BasicInfo.self, from: data) {
                                
                                // DispatchQueue.main.async {
                                ans_profile.user_name = response.user_name
                                ans_profile.email = response.email
                                ans_profile.gender = response.gender
                                // }
                                
                                return
                            } else {
                                print("Decoding error occurs...")
                            }
                        
                    }
            
        }.resume()
          
    }
  
    


}

struct Result: View{
    @EnvironmentObject var ans_tab: Ans
    @EnvironmentObject var ans_profile: Ans2
    //string answeri_1 =(ans_tab.match_score_list[0]
        

    var gold = #colorLiteral(red: 0.9882352941, green: 0.7607843137, blue: 0, alpha: 1)

    @State var d1 = "null"
    @State var d2 = "null"
    @State var d3 = "null"
    
    func helper(){
        if ans_tab.match_score_list.count>=1 {
            d1=String(ans_tab.match_score_list[0])
            
        }
        if ans_tab.match_score_list.count>=2 {
            d2=String(ans_tab.match_score_list[1])
            
        }
        if ans_tab.match_score_list.count>=3 {
            d3=String(ans_tab.match_score_list[2])
            
        }
    }
    
    var body: some View {
        
        
        ZStack{
            VStack(alignment: .leading){
                
                Spacer()
                
                Text("Matching Scores")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding([.top, .leading])
                   // .foregroundColor(.black)
                //   .padding(.top, 70.0)
                Text("Lower Score means Matching")
                    .font(.footnote)
                    .padding(.leading)
                  //  .foregroundColor(.black)
                
                ScrollView{
                    ZStack() {
                        RoundedRectangle(cornerRadius: 25)
                            .foregroundColor(Color(gold))
                            .frame(width:abs(UIScreen.main.bounds.width-40), height: abs(UIScreen.main.bounds.height*0.25))
                        Text(ans_tab.user_email1+"\n"+String(String(ans_tab.match_score_list[0]).prefix(4)))
                            .lineLimit(2)
                            .font(.system(size: 26, weight: .bold, design: .default))
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)

                        
                    }.padding()
                    ZStack() {
                        RoundedRectangle(cornerRadius: 25)
                            .foregroundColor(Color(gold))

                            .frame(width:abs(UIScreen.main.bounds.width-40), height: abs(UIScreen.main.bounds.height*0.25))
                        Text(ans_tab.user_email2+"\n"+String(String(ans_tab.match_score_list2).prefix(4))).lineLimit(2)
                            .font(.system(size: 26, weight: .bold, design: .default))
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)

                        
                    }.padding()
                    ZStack() {
                        RoundedRectangle(cornerRadius: 25)
                            .foregroundColor(Color(gold))

                            .frame(width:abs(UIScreen.main.bounds.width-40), height: abs(UIScreen.main.bounds.height*0.25))
                        Text(ans_tab.user_email3+"\n"+String(String(ans_tab.match_score_list3).prefix(4)))
                            .font(.system(size: 26, weight: .bold, design: .default))
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)

                    }.padding()
                    ZStack() {
                        RoundedRectangle(cornerRadius: 25)
                            .foregroundColor(Color(gold))

                            .frame(width:abs(UIScreen.main.bounds.width-40), height: abs(UIScreen.main.bounds.height*0.25))
                      
                        Text(ans_tab.user_email3+"\n"+String(String(ans_tab.match_score_list4).prefix(4)))
                            .font(.system(size: 26, weight: .bold, design: .default))
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)

                    }

                }
            }
            .padding(.bottom, (UIScreen.main.bounds.height*0.15))
            HStack{
                GeometryReader { geometry in
                    VStack {
                        Spacer()
                        HStack {
                            NavigationLink(destination: ProfileView()
                                .environmentObject(ans_tab)
                                .environmentObject(ans_profile)
                                .onAppear{
                                    fetchBasic(uid: uid)
                                }){
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
                       
                            
                            if let response = try? JSONDecoder().decode(BasicInfo.self, from: data) {
                                
                                // DispatchQueue.main.async {
                                ans_profile.user_name = response.user_name
                                ans_profile.email = response.email
                                ans_profile.gender = response.gender
                                // }
                                
                                return
                            } else {
                                print("Decoding error occurs...")
                            }
                        
                    }
            
        }.resume()
          
    }
  
    

}

/*struct matchScore: View{
    @EnvironmentObject var ans_tab: Ans
    @EnvironmentObject var ans_profile: Ans2
    @State var d11 = ""
    @State var d12 = ""
    
    var body: some View {
        
        ZStack{
            VStack(alignment: .leading){
                               
                    Text("Detailed Match Scores")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                        .padding(.top)
                ScrollView{
                    ZStack() {
                        RoundedRectangle(cornerRadius: 25)
                            .foregroundColor(.blue)
                            .opacity(0.7)
                            .frame(width:abs(UIScreen.main.bounds.width-40), height: abs(UIScreen.main.bounds.height*0.25))
                        Text(ans_tab.first_match_field_list_str1+": "+String(String(ans_tab.first_match_field_list_val1).prefix(4)))
                            .font(.system(size: 26, weight: .bold, design: .default))
                            .font(.system(size: 26, weight: .bold, design: .default))
                            .foregroundColor(.white)
                        
                        
                    }
                    .onAppear(perform:{
                        
                        d11 = ans_tab.first_match_field_list_str1+": "+String(ans_tab.first_match_field_list_val1)
                        d12 = ans_tab.second_match_field_list_str1+": "+String(ans_tab.second_match_field_list_val1)
                        
                        
                    }
                              
                    )
                    ZStack() {
                        RoundedRectangle(cornerRadius: 25)
                            .foregroundColor(.blue)
                            .opacity(0.7)
                            .frame(width:abs(UIScreen.main.bounds.width-40), height: abs(UIScreen.main.bounds.height*0.25))
                        Text(ans_tab.first_match_field_list_str2+": "+String(String(ans_tab.first_match_field_list_val2).prefix(4)))
                            .font(.system(size: 26, weight: .bold, design: .default))
                            .foregroundColor(.white)
                    }
                    ZStack() {
                        RoundedRectangle(cornerRadius: 25)
                            .foregroundColor(.blue)
                            .opacity(0.7)
                            .frame(width:abs(UIScreen.main.bounds.width-40), height: abs(UIScreen.main.bounds.height*0.25))
                        Text(ans_tab.first_match_field_list_str3+": "+String(String(ans_tab.first_match_field_list_val3)).prefix(4))
                            .font(.system(size: 26, weight: .bold, design: .default))
                            .foregroundColor(.white)
                    }
                }
            }
            .padding(.bottom,abs(UIScreen.main.bounds.height*0.15))
            HStack{
                
                GeometryReader { geometry in
                    VStack {
                        Spacer()
                        HStack {
                            NavigationLink(destination: ProfileView()
                                .environmentObject(ans_tab)
                                .environmentObject(ans_profile)
                                .onAppear{
                                    fetchBasic(uid: uid)
                                    print("this is a test")
                                    print(uid)
                                }){
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
                            NavigationLink(destination: HomeView()
                                ){
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
                       
                            
                            if let response = try? JSONDecoder().decode(BasicInfo.self, from: data) {
                                
                                // DispatchQueue.main.async {
                                ans_profile.user_name = response.user_name
                                ans_profile.email = response.email
                                ans_profile.gender = response.gender
                                
                                // }
                                
                                return
                            } else {
                                print("Decoding error occurs...")
                            }
                        
                    }
            
        }.resume()
          
    }

}*/



