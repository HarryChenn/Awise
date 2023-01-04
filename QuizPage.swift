//
//  QuizPage.swift
//  Awise
//
//  Created by liu zhenke on 10/10/22.
//

import Foundation
import SwiftUI
import UIKit

struct QuizPage: View {
    var body: some View {
        NavigationView{
            Quiz1()
        }
    }
}



struct Quiz1: View{
    @State var name = ""
    @AppStorage("hasBG") private var hasBG = false
    @EnvironmentObject var ans: QuizAnswers
    var body: some View{
        VStack{
            Spacer()
            Text("What is your name?")
                .font(.title)
                .fontWeight(.bold)
                .padding()
            
            Spacer()
            
            Text("Please type in the area below")
                .font(.subheadline)
                .foregroundColor(.gray)
                .padding(.leading)
                .padding(.top)
                .padding(.trailing)
            
            GroupBox(){
                TextField("Your name here", text: $name)
                    .padding(.bottom, 100)
            }
            .padding()
            .background(Color.black.opacity(name == "" ? 0 : 0.12))
            .cornerRadius(15)
            .padding(.horizontal)
            .padding(.bottom)
            Spacer()

            NavigationLink(destination: HomeView()
                .onAppear{uid = -1}){
                ZStack{
                    Capsule()
                        .foregroundColor(.blue)
                        .frame(width:180, height:60)
                    Text("Quit")
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                        .padding(.vertical)
                        .frame(width: UIScreen.main.bounds.width - 150)
                        .background(Color("black"))
                }
            }
            .padding(.bottom)
            NavigationLink(destination: QuizGender()
                .environmentObject(ans)
                .onAppear{
                    setQ1(q1ans:name, uid: ans.user_id)
                }){
                ZStack{
                    Capsule()
                        .foregroundColor(.blue)
                        .frame(width:180, height:60)
                    Text("Next")
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                        .padding(.vertical)
                        .frame(width: UIScreen.main.bounds.width - 150)
                        .background(Color("black"))
                }
            }.disabled(name != "" && uid != -401 ? false : true)
        }.navigationBarBackButtonHidden(true)
        .background(hasBG ? bgView(top1:100, top2: -250) : bgView(top1:100, top2: -250, radius1:0, radius2:0))
        //isDark ? .dark : .light
        .toolbar{
            ToolbarItemGroup(placement:.navigationBarTrailing){
                Text("Question 1/31")
                .font(.subheadline)
                .fontWeight(.medium)
                .multilineTextAlignment(.leading)
            }
        }
        .cornerRadius(20)
        .padding()
        
    }
}



struct QuizGender: View{
    @State var name = ""
    @AppStorage("hasBG") private var hasBG = false
    @EnvironmentObject var ans: QuizAnswers
    var body: some View{
        
        VStack{
            Spacer()
            Text("What is your gender?")
                .font(.title)
                .fontWeight(.bold)
                .padding()
            
            Spacer()
            
            Text("Please type in the area below")
                .font(.subheadline)
                .foregroundColor(.gray)
                .padding(.leading)
                .padding(.top)
                .padding(.trailing)
            
            GroupBox(){
                TextField("Your gender here", text: $name)
                    .padding(.bottom, 100)
            }
            .padding()
            .background(Color.black.opacity(name == "" ? 0 : 0.12))
            .cornerRadius(15)
            .padding(.horizontal)
            .padding(.bottom)
            Spacer()

            NavigationLink(destination: Quiz1()
                .environmentObject(ans)){
                ZStack{
                    Capsule()
                        .foregroundColor(.blue)
                        .frame(width:180, height:60)
                    Text("Previous")
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                        .padding(.vertical)
                        .frame(width: UIScreen.main.bounds.width - 150)
                        .background(Color("black"))
                }
            }
            .padding(.bottom)
            NavigationLink(destination: Quiz2()
                .environmentObject(ans)
                .onAppear{
                    setAnsGeneric(question:"gender", question2:"gender", answer:name, uid:ans.user_id)
                }
                ){
                ZStack{
                    Capsule()
                        .foregroundColor(.blue)
                        .frame(width:180, height:60)
                    Text("Next")
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                        .padding(.vertical)
                        .frame(width: UIScreen.main.bounds.width - 150)
                        .background(Color("black"))
                }
            }.disabled(name != "" ? false : true)
        }
        .navigationBarBackButtonHidden(true)
        .background(hasBG ? bgView(top1:100, top2: -250) : bgView(top1:100, top2: -250, radius1:0, radius2:0))
        //isDark ? .dark : .light
        
        .toolbar{
            ToolbarItemGroup(placement:.navigationBarTrailing){
                Text("Question 2/31")
                .font(.subheadline)
                .fontWeight(.medium)
                .multilineTextAlignment(.leading)
            }
        }
        .cornerRadius(20)
        .padding()
    }
}






struct Quiz2: View{
    @State var year = ""
    @AppStorage("hasBG") private var hasBG = false
    @EnvironmentObject var ans: QuizAnswers

    var body: some View{
        VStack{

            Spacer()
            
            Text("What year are you in school?")
                .font(.title)
                .fontWeight(.bold)
                .padding()
            
            Spacer()
            
            Text("Please type in the number in the area below")
                .font(.subheadline)
                .foregroundColor(.gray)
                .padding(.leading)
                .padding(.top)
                .padding(.trailing)
            
            GroupBox{
                TextField("Fill 1-6 as your response", text: $year)
                    .padding(.bottom, 100)

            }
            .padding()
            .background(Color.black.opacity(year == "" ? 0 : 0.12))
            .cornerRadius(15)
            .padding(.horizontal)
            .padding(.bottom)
            
            Spacer()
            
            NavigationLink(destination: Quiz1()
                .environmentObject(ans)){
                ZStack{
                    Capsule()
                        .foregroundColor(.blue)
                        .frame(width:180, height:60)
                    Text("Previous")
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                        .padding(.vertical)
                        .frame(width: UIScreen.main.bounds.width - 150)
                        .background(Color("black"))
                }
            }
            .padding(.bottom)
            NavigationLink(destination: Quiz3()
                .environmentObject(ans)
                .onAppear{
                    setIntAnsGeneric(question:"school-year", question2:"school_year", answer:Int(year)!, uid:ans.user_id)
                }){
                ZStack{
                    Capsule()
                        .foregroundColor(.blue)
                        .frame(width:180, height:60)
                    Text("Next")
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                        .padding(.vertical)
                        .frame(width: UIScreen.main.bounds.width - 150)
                        .background(Color("black"))
                }
            }.disabled(year != "1" && year != "2" && year != "3" && year != "4" && year != "5" && year != "6" ? true : false)
        }
        .navigationBarBackButtonHidden(true)
        .background(hasBG ? bgView(top1:50, top2: -200) : bgView(radius1:0,radius2:0))
        .navigationBarBackButtonHidden(true)
        .toolbar{
            ToolbarItemGroup(placement:.navigationBarTrailing){
                Text("Question 3/31")
                .font(.subheadline)
                .fontWeight(.medium)
                .multilineTextAlignment(.leading)
            }
        }
        .cornerRadius(20)
        .padding()
    }
}

struct Quiz3: View{
    @State var rent = ""
    @AppStorage("hasBG") private var hasBG = false
    @EnvironmentObject var ans: QuizAnswers

    var body: some View{
        VStack{

            Spacer()
            
            Text("About how much rent is appropriate to you?")
                .font(.title)
                .fontWeight(.bold)
                .padding()
            
            Spacer()
            
            Text("Please type in the area below")
                .font(.subheadline)
                .foregroundColor(.gray)
                .padding(.leading)
                .padding(.top)
                .padding(.trailing)
            
            GroupBox{
                TextField("Your number here", text: $rent)
                    .padding(.bottom, 100)

            }
            .padding()
            .background(Color.black.opacity(rent == "" ? 0 : 0.12))
            .cornerRadius(15)
            .padding(.horizontal)
            .padding(.bottom)
            
             Spacer()
            
            NavigationLink(destination: Quiz2()
                .environmentObject(ans)){
                ZStack{
                    Capsule()
                        .foregroundColor(.blue)
                        .frame(width:180, height:60)
                    Text("Previous")
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                        .padding(.vertical)
                        .frame(width: UIScreen.main.bounds.width - 150)
                        .background(Color("black"))
                }
            }
            .padding(.bottom)
            
             NavigationLink(destination: Quiz4()
                .environmentObject(ans)
                .onAppear{
                    setIntAnsGeneric(question:"rent", question2:"rent", answer:Int(rent)!, uid:ans.user_id)
                }){
                ZStack{
                    Capsule()
                        .foregroundColor(.blue)
                        .frame(width:180, height:60)
                    Text("Next")
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                        .padding(.vertical)
                        .frame(width: UIScreen.main.bounds.width - 150)
                        .background(Color("black"))
                }
            }.disabled(rent != "" ? false : true)
        }
        .background(hasBG ? bgView(top1:100, top2: -250) : bgView(top1:100, top2: -250, radius1:0, radius2:0))
        .navigationBarBackButtonHidden(true)
        .toolbar{
            ToolbarItemGroup(placement:.navigationBarTrailing){
                Text("Question 4/31")
                .font(.subheadline)
                .fontWeight(.medium)
                .multilineTextAlignment(.leading)
            }
        }
        .cornerRadius(20)
        .padding()
    }
    
}

struct Quiz4: View{
   // @State var date = ""
    @State private var date = Date()
    @EnvironmentObject var ans: QuizAnswers
    let formatter = DateFormatter()

    @AppStorage("hasBG") private var hasBG = false

    var body: some View{
        VStack{
            
            Spacer()
            
            Text("What is your ideal move-in date?")
                .font(.title)
                .fontWeight(.bold)
                .padding()
            
            Spacer()
            
           /* Text("Please follow the format in the textfield")
                .font(.subheadline)
                .foregroundColor(.gray)
                .padding(.leading)
                .padding(.top)
                .padding(.trailing)*/
            
            
            /*GroupBox{
                TextField("mm/dd/yyyy", text: $date)
            }
            .padding()
            .background(Color.black.opacity(date == "" ? 0 : 0.12))
            .cornerRadius(15)
            .padding(.horizontal)
            .padding(.bottom)*/
            DatePicker(
                "Start Date",
                selection: $date,
                displayedComponents: [.date]
            ).datePickerStyle(.graphical)
            
            Spacer()
            
            NavigationLink(destination: Quiz3()
                .environmentObject(ans)){
                ZStack{
                    Capsule()
                        .foregroundColor(.blue)
                        .frame(width:180, height:60)
                    Text("Previous")
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                        .padding(.vertical)
                        .frame(width: UIScreen.main.bounds.width - 150)
                        .background(Color("black"))
                }
            }
            .padding(.bottom)
            NavigationLink(destination: Quiz5()
                .environmentObject(ans)
                .onAppear{
                    setAnsGeneric(question:"move-in-date", question2:"move_in_date", answer: formatter.string(from:date), uid:ans.user_id)
                    print(date)
                    print(formatter.string(from:date))
                }){
                ZStack{
                    Capsule()
                        .foregroundColor(.blue)
                        .frame(width:180, height:60)
                    Text("Next")
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                        .padding(.vertical)
                        .frame(width: UIScreen.main.bounds.width - 150)
                        .background(Color("black"))
                }
            }
        }
        .background(hasBG ? bgView(top1:100, top2: -250) : bgView(top1:100, top2: -250, radius1:0, radius2:0))
        .navigationBarBackButtonHidden(true)
        .toolbar{
            ToolbarItemGroup(placement:.navigationBarTrailing){
                Text("Question 5/31")
                .font(.subheadline)
                .fontWeight(.medium)
                .multilineTextAlignment(.leading)
            }
        }
        .cornerRadius(20)
        .padding()
    }
}

struct Quiz5: View{
    @State var number = ""
    @AppStorage("hasBG") private var hasBG = false
    @EnvironmentObject var ans: QuizAnswers

    var body: some View{
        VStack{
            
            Spacer()
            
            Text("What is your desired amount of roommates?")
                .font(.title)
                .fontWeight(.bold)
                .padding()
            
            Spacer()
            
            Text("Please type in the area below")
                .font(.subheadline)
                .foregroundColor(.gray)
                .padding(.leading)
                .padding(.top)
                .padding(.trailing)
            
            
            GroupBox{
                TextField("Fill in 1-10 as your response", text: $number)
                    .padding(.bottom, 100)
            }
            .padding()
            .background(Color.black.opacity(number == "" ? 0 : 0.12))
            .cornerRadius(15)
            .padding(.horizontal)
            .padding(.bottom)
            
            Spacer()
            
            NavigationLink(destination: Quiz4()
                .environmentObject(ans)){
                ZStack{
                    Capsule()
                        .foregroundColor(.blue)
                        .frame(width:180, height:60)
                    Text("Previous")
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                        .padding(.vertical)
                        .frame(width: UIScreen.main.bounds.width - 150)
                        .background(Color("black"))
                }
            }
            .padding(.bottom)
            NavigationLink(destination: Quiz6()
                .environmentObject(ans)
                .onAppear{
                    setIntAnsGeneric(question:"number-of-room", question2:"number_of_room", answer: Int(number)!, uid: ans.user_id)
                }){
                ZStack{
                    Capsule()
                        .foregroundColor(.blue)
                        .frame(width:180, height:60)
                    Text("Next")
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                        .padding(.vertical)
                        .frame(width: UIScreen.main.bounds.width - 150)
                        .background(Color("black"))
                }
            }.disabled(number != "" ? false : true)
        }
        .background(hasBG ? bgView(top1:100, top2: -250) : bgView(top1:100, top2: -250, radius1:0, radius2:0))
        .navigationBarBackButtonHidden(true)
        .toolbar{
            ToolbarItemGroup(placement:.navigationBarTrailing){
                Text("Question 6/31")
                .font(.subheadline)
                .fontWeight(.medium)
                .multilineTextAlignment(.leading)
            }
        }
        .cornerRadius(20)
        .padding()
    }
}

struct Quiz6: View{
    @State var location = ""
    @AppStorage("hasBG") private var hasBG = false
    @EnvironmentObject var ans: QuizAnswers

    var body: some View{
        VStack{
            
            Spacer()
            
            Text("Where do you want to live?")
                .font(.title)
                .fontWeight(.bold)
                .padding()

            Spacer()
            
            Text("Please type in the area below")
                .font(.subheadline)
                .foregroundColor(.gray)
                .padding(.leading)
                .padding(.top)
                .padding(.trailing)
            
            GroupBox{
                TextField("Input locations here", text: $location)
                    .padding(.bottom, 100)
            }
            .padding()
            .background(Color.black.opacity(location == "" ? 0 : 0.12))
            .cornerRadius(15)
            .padding(.horizontal)
            .padding(.bottom)
            
            Spacer()
           
            NavigationLink(destination: Quiz5()
                .environmentObject(ans)){
                ZStack{
                    Capsule()
                        .foregroundColor(.blue)
                        .frame(width:180, height:60)
                    Text("Previous")
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                        .padding(.vertical)
                        .frame(width: UIScreen.main.bounds.width - 150)
                        .background(Color("black"))
                }
            }
            .padding(.bottom)
            
            NavigationLink(destination: Quiz7()
                .environmentObject(ans)
                .onAppear{
                    setAnsGeneric(question:"location", question2:"location", answer:location, uid:ans.user_id)
                }){
                ZStack{
                    Capsule()
                        .foregroundColor(.blue)
                        .frame(width:180, height:60)
                    Text("Next")
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                        .padding(.vertical)
                        .frame(width: UIScreen.main.bounds.width - 150)
                        .background(Color("black"))
                }
            }
        }
        .background(hasBG ? bgView(top1:100, top2: -250) : bgView(top1:100, top2: -250, radius1:0, radius2:0))
        .navigationBarBackButtonHidden(true)
        .toolbar{
            ToolbarItemGroup(placement:.navigationBarTrailing){
                Text("Question 7/31")
                .font(.subheadline)
                .fontWeight(.medium)
                .multilineTextAlignment(.leading)
            }
        }
        .cornerRadius(20)
        .padding()
    }
}

// survey questions (for algorithm)

struct Quiz7: View{
    @State var hour = ""
    @State var minute = ""
    @State var time = ""
    @State private var date = Date()
    @AppStorage("hasBG") private var hasBG = false
    @EnvironmentObject var ans: QuizAnswers
    
    var calendar = Calendar.current
    let formatter = DateFormatter()


    var body: some View{
        VStack{
            
            Spacer()
            
            Text("What time do you go to bed at night?")
                .font(.title)
                .fontWeight(.bold)
                .padding()

            Spacer()
            
            /*Text("Please follow the format in the textfield")
                .font(.subheadline)
                .foregroundColor(.gray)
                .padding(.leading)
                .padding(.top)
                .padding(.trailing)
            
            GroupBox{
                TextField("Hour:Minute", text: $time)
            }
            .padding()
            .background(Color.black.opacity(time == "" ? 0 : 0.12))
            .cornerRadius(15)
            .padding(.horizontal)
            .padding(.bottom)*/
            DatePicker(
                   "Sleep Time",
                    selection: $date,
                    displayedComponents: [.hourAndMinute]
               )
            .padding()
            .padding(.horizontal)
            .padding(.bottom)
            Spacer()
            NavigationLink(destination: Quiz6()
                .environmentObject(ans)){
                ZStack{
                    Capsule()
                        .foregroundColor(.blue)
                        .frame(width:180, height:60)
                    Text("Previous")
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                        .padding(.vertical)
                        .frame(width: UIScreen.main.bounds.width - 150)
                        .background(Color("black"))
                }
            }
            .padding(.bottom)

            NavigationLink(destination: Quiz8()
                .environmentObject(ans)
                .onAppear{
                    let hour = calendar.component(.hour, from: date)
                    setIntAnsGeneric2(question:"bed-time", question2:"bed_time", answer:Int(hour), uid:ans.user_id)
                    
                    //print(formatter.string(from:date))
                }){
                ZStack{
                    Capsule()
                        .foregroundColor(.blue)
                        .frame(width:180, height:60)
                    Text("Next")
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                        .padding(.vertical)
                        .frame(width: UIScreen.main.bounds.width - 150)
                        .background(Color("black"))
                }
            }
        }
        .background(hasBG ? bgView(top1:100, top2: -250) : bgView(top1:100, top2: -250, radius1:0, radius2:0))
        .navigationBarBackButtonHidden(true)
        .toolbar{
            ToolbarItemGroup(placement:.navigationBarTrailing){
                Text("Question 8/31")
                .font(.subheadline)
                .fontWeight(.medium)
                .multilineTextAlignment(.leading)
            }
        }
        .cornerRadius(20)
        .padding()
    }
}

struct Quiz8: View{
    @State var hour = ""
    @State var minute = ""
    @State var time = ""
    @State private var date = Date()
    @AppStorage("hasBG") private var hasBG = false
    @EnvironmentObject var ans: QuizAnswers
    var calendar = Calendar.current

    var body: some View{
        VStack{
            
            Spacer()
            
            Text("What time do you get up in the morning?")
                .font(.title)
                .fontWeight(.bold)
                .padding()

            Spacer()
            
            DatePicker(
                   "Sleep Time",
                    selection: $date,
                    displayedComponents: [.hourAndMinute]
               )
            
            .padding()
            .background(Color.black.opacity(time == "" ? 0 : 0.12))
            .cornerRadius(15)
            .padding(.horizontal)
            .padding(.bottom)
            
            Spacer()
            
            NavigationLink(destination: Quiz7()
                .environmentObject(ans)){
                ZStack{
                    Capsule()
                        .foregroundColor(.blue)
                        .frame(width:180, height:60)
                    Text("Previous")
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                        .padding(.vertical)
                        .frame(width: UIScreen.main.bounds.width - 150)
                        .background(Color("black"))
                }
            }
            .padding(.bottom)

            NavigationLink(destination: Quiz9()
                .environmentObject(ans)
                .onAppear{
                    let hour = calendar.component(.hour, from: date)
                    setIntAnsGeneric2(question:"getup-time", question2:"getup_time", answer:Int(hour), uid:ans.user_id)
                }
            ){
                ZStack{
                    Capsule()
                        .foregroundColor(.blue)
                        .frame(width:180, height:60)
                    Text("Next")
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                        .padding(.vertical)
                        .frame(width: UIScreen.main.bounds.width - 150)
                        .background(Color("black"))
                }
            }
        }
        .background(hasBG ? bgView(top1:100, top2: -250) : bgView(top1:100, top2: -250, radius1:0, radius2:0))
        .navigationBarBackButtonHidden(true)
        .toolbar{
            ToolbarItemGroup(placement:.navigationBarTrailing){
                Text("Question 9/31")
                .font(.subheadline)
                .fontWeight(.medium)
                .multilineTextAlignment(.leading)
            }
        }
        .cornerRadius(20)
        .padding()
    }
}

struct Quiz9: View{
    @State var people = ""
    @AppStorage("hasBG") private var hasBG = false
    @EnvironmentObject var ans: QuizAnswers


    var body: some View{
        VStack{
            
            Spacer()
            
            Text("Approximately, How many times would you bring people to your apartment per week?")
                .font(.title)
                .fontWeight(.bold)
                .padding()

            Spacer()
            
            Text("Fill in 1-10 as your response")
                .font(.subheadline)
                .foregroundColor(.gray)
                .padding(.leading)
                .padding(.top)
                .padding(.trailing)
            
            GroupBox{
                TextField("number", text: $people)
            }
            .padding()
            .background(Color.black.opacity(people == "" ? 0 : 0.12))
            .cornerRadius(15)
            .padding(.horizontal)
            .padding(.bottom)
            
            Spacer()

            NavigationLink(destination: Quiz8()
                .environmentObject(ans)){
                ZStack{
                    Capsule()
                        .foregroundColor(.blue)
                        .frame(width:180, height:60)
                    Text("Previous")
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                        .padding(.vertical)
                        .frame(width: UIScreen.main.bounds.width - 150)
                        .background(Color("black"))
                }
            }
            .padding(.bottom)
            
            NavigationLink(destination: Quiz10()
                .environmentObject(ans)
                .onAppear{
                    setIntAnsGeneric2(question:"bring-people", question2:"bring_people", answer:Int(people)!, uid:ans.user_id)
                }){
                ZStack{
                    Capsule()
                        .foregroundColor(.blue)
                        .frame(width:180, height:60)
                    Text("Next")
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                        .padding(.vertical)
                        .frame(width: UIScreen.main.bounds.width - 150)
                        .background(Color("black"))
                }
            }.disabled(people != "1" && people != "2" && people != "3" && people != "4" && people != "5" && people != "6" && people != "7" && people != "8" && people != "9" && people != "10" ? true : false)
        }
        .background(hasBG ? bgView(top1:100, top2: -250) : bgView(top1:100, top2: -250, radius1:0, radius2:0))
        .navigationBarBackButtonHidden(true)
        .toolbar{
            ToolbarItemGroup(placement:.navigationBarTrailing){
                Text("Question 11/30")
                .font(.subheadline)
                .fontWeight(.medium)
                .multilineTextAlignment(.leading)
            }
        }
        .cornerRadius(20)
        .padding()
    }
}

struct Quiz10: View{
    @State var animal = ""
    @AppStorage("hasBG") private var hasBG = false
    @EnvironmentObject var ans: QuizAnswers


    var body: some View{
        VStack{

            Spacer()
            
            Text("Are you comfortable to live with animals in the apartment?")
                .font(.title)
                .fontWeight(.bold)
                .padding()

            Spacer()
            
            Text("Please follow the format in the textfield")
                .font(.subheadline)
                .foregroundColor(.gray)
                .padding(.leading)
                .padding(.top)
                .padding(.trailing)
            
            GroupBox{
                TextField("Fill in 1-10 to indicate your response. 1 for mild and 10 for severe", text: $animal)

            }
            .padding()
            .background(Color.black.opacity(animal == "" ? 0 : 0.12))
            .cornerRadius(15)
            .padding(.horizontal)
            .padding(.bottom)
            
            Spacer()

            NavigationLink(destination: Quiz9()
                .environmentObject(ans)){
                ZStack{
                    Capsule()
                        .foregroundColor(.blue)
                        .frame(width:180, height:60)
                    Text("Previous")
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                        .padding(.vertical)
                        .frame(width: UIScreen.main.bounds.width - 150)
                        .background(Color("black"))
                }
            }
            .padding(.bottom)
            
            NavigationLink(destination: Quiz11()
                .environmentObject(ans)
                .onAppear{
                    setIntAnsGeneric2(question:"animal", question2:"animal", answer:Int(animal)!, uid:ans.user_id)
                }){
                ZStack{
                    Capsule()
                        .foregroundColor(.blue)
                        .frame(width:180, height:60)
                    Text("Next")
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                        .padding(.vertical)
                        .frame(width: UIScreen.main.bounds.width - 150)
                        .background(Color("black"))
                }
            }.disabled(animal != "1" && animal != "2" && animal != "3" && animal != "4" && animal != "5" && animal != "6" && animal != "7" && animal != "8" && animal != "9" && animal != "10" ? true : false)
        }
        .background(hasBG ? bgView(top1:100, top2: -250) : bgView(top1:100, top2: -250, radius1:0, radius2:0))
        .navigationBarBackButtonHidden(true)
        .toolbar{
            ToolbarItemGroup(placement:.navigationBarTrailing){
                Text("Question 11/31")
                .font(.subheadline)
                .fontWeight(.medium)
                .multilineTextAlignment(.leading)
            }
        }
        .cornerRadius(20)
        .padding()
    }
}

struct Quiz11: View{
    @State var animal = ""
    @AppStorage("hasBG") private var hasBG = false
    @EnvironmentObject var ans: QuizAnswers



    var body: some View{
        VStack{
            
            Spacer()
            
            Text("What frequency do you play music or instruments in the apartment per week?")
                .font(.title)
                .fontWeight(.bold)
                .padding()

            Spacer()
            
            Text("Please type in the area below")
                .font(.subheadline)
                .foregroundColor(.gray)
                .padding(.leading)
                .padding(.top)
                .padding(.trailing)
            
            GroupBox{
                TextField("Fill in 1-10 to indicate your response. 1 for not frequent and 10 for always", text: $animal)
                    .padding(.bottom, 100)

            }
            .padding()
            .background(Color.black.opacity(animal == "" ? 0 : 0.12))
            .cornerRadius(15)
            .padding(.horizontal)
            .padding(.bottom)
            
            Spacer()
            
            NavigationLink(destination: Quiz10()
                .environmentObject(ans)){
                ZStack{
                    Capsule()
                        .foregroundColor(.blue)
                        .frame(width:180, height:60)
                    Text("Previous")
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                        .padding(.vertical)
                        .frame(width: UIScreen.main.bounds.width - 150)
                        .background(Color("black"))
                }
            }
            .padding(.bottom)
            
            NavigationLink(destination: Quiz12()
                .environmentObject(ans)
                .onAppear{
                    setIntAnsGeneric2(question:"instrument", question2:"instrument", answer:Int(animal)!, uid:ans.user_id)
                }){
                ZStack{
                    Capsule()
                        .foregroundColor(.blue)
                        .frame(width:180, height:60)
                    Text("Next")
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                        .padding(.vertical)
                        .frame(width: UIScreen.main.bounds.width - 150)
                        .background(Color("black"))
                }
            }.disabled(animal != "1" && animal != "2" && animal != "3" && animal != "4" && animal != "5" && animal != "6" && animal != "7" && animal != "8" && animal != "9" && animal != "10" ? true : false)
        }
        .background(hasBG ? bgView(top1:100, top2: -250) : bgView(top1:100, top2: -250, radius1:0, radius2:0))
        .navigationBarBackButtonHidden(true)
        .toolbar{
            ToolbarItemGroup(placement:.navigationBarTrailing){
                Text("Question 12/31")
                .font(.subheadline)
                .fontWeight(.medium)
                .multilineTextAlignment(.leading)
            }
        }
        .cornerRadius(20)
        .padding()
    }
}

struct Quiz12: View{
    @State var animal = ""
    @AppStorage("hasBG") private var hasBG = false
    @EnvironmentObject var ans: QuizAnswers

    var body: some View{
        VStack{

            Spacer()
            
            Text("What frequency do you clean your room per week?")
                .font(.title)
                .fontWeight(.bold)
                .padding()

            Spacer()
            
            Text("Please type in the area below")
                .font(.subheadline)
                .foregroundColor(.gray)
                .padding(.leading)
                .padding(.top)
                .padding(.trailing)
            
            GroupBox{
                TextField("Fill in 1-10 to indicate your response. 1 for not frequent and 10 for always", text: $animal)
                    .padding(.bottom, 100)

            }
            .padding()
            .background(Color.black.opacity(animal == "" ? 0 : 0.12))
            .cornerRadius(15)
            .padding(.horizontal)
            .padding(.bottom)
            
            Spacer()

            NavigationLink(destination: Quiz11()
                .environmentObject(ans)){
                ZStack{
                    Capsule()
                        .foregroundColor(.blue)
                        .frame(width:180, height:60)
                    Text("Previous")
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                        .padding(.vertical)
                        .frame(width: UIScreen.main.bounds.width - 150)
                        .background(Color("black"))
                }
            }
            .padding(.bottom)
            
            NavigationLink(destination: Quiz13()
                .environmentObject(ans)
                .onAppear{
                    setIntAnsGeneric2(question:"cleaning", question2:"cleaning", answer:Int(animal)!, uid:ans.user_id)
                }){
                ZStack{
                    Capsule()
                        .foregroundColor(.blue)
                        .frame(width:180, height:60)
                    Text("Next")
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                        .padding(.vertical)
                        .frame(width: UIScreen.main.bounds.width - 150)
                        .background(Color("black"))
                }
            }.disabled(animal != "1" && animal != "2" && animal != "3" && animal != "4" && animal != "5" && animal != "6" && animal != "7" && animal != "8" && animal != "9" && animal != "10" ? true : false)
        }
        .background(hasBG ? bgView(top1:100, top2: -250) : bgView(top1:100, top2: -250, radius1:0, radius2:0))
        .navigationBarBackButtonHidden(true)
        .toolbar{
            ToolbarItemGroup(placement:.navigationBarTrailing){
                Text("Question 13/31")
                .font(.subheadline)
                .fontWeight(.medium)
                .multilineTextAlignment(.leading)
            }
        }
        .cornerRadius(20)
        .padding()
    }
}

struct Quiz13: View{
    @State var cook = ""
    @AppStorage("hasBG") private var hasBG = false
    @EnvironmentObject var ans: QuizAnswers

    var body: some View{
        VStack{
            
            Spacer()
            
            Text("What frequency do you cook in the apartment per week?")
                .font(.title)
                .fontWeight(.bold)
                .padding()

            Spacer()
            
            Text("Please type in the area below")
                .font(.subheadline)
                .foregroundColor(.gray)
                .padding(.leading)
                .padding(.top)
                .padding(.trailing)
            
            GroupBox{
                TextField("Fill in 1-10 to indicate your response. 1 for not frequent and 10 for always", text: $cook)
                    .padding(.bottom, 100)

            }
            .padding()
            .background(Color.black.opacity(cook == "" ? 0 : 0.12))
            .cornerRadius(15)
            .padding(.horizontal)
            .padding(.bottom)
            
            Spacer()
            
            NavigationLink(destination: Quiz12()
                .environmentObject(ans)){
                ZStack{
                    Capsule()
                        .foregroundColor(.blue)
                        .frame(width:180, height:60)
                    Text("Previous")
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                        .padding(.vertical)
                        .frame(width: UIScreen.main.bounds.width - 150)
                        .background(Color("black"))
                }
            }
            .padding(.bottom)
            
            NavigationLink(destination: Quiz14()
                .environmentObject(ans)
                .onAppear{
                    setIntAnsGeneric2(question:"cook", question2:"cook", answer:Int(cook)!, uid:ans.user_id)
                }){
                ZStack{
                    Capsule()
                        .foregroundColor(.blue)
                        .frame(width:180, height:60)
                    Text("Next")
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                        .padding(.vertical)
                        .frame(width: UIScreen.main.bounds.width - 150)
                        .background(Color("black"))
                }
            }.disabled(cook != "1" && cook != "2" && cook != "3" && cook != "4" && cook != "5" && cook != "6" && cook != "7" && cook != "8" && cook != "9" && cook != "10" ? true : false)
        }
        .background(hasBG ? bgView(top1:100, top2: -250) : bgView(top1:100, top2: -250, radius1:0, radius2:0))
        .navigationBarBackButtonHidden(true)
        .toolbar{
            ToolbarItemGroup(placement:.navigationBarTrailing){
                Text("Question 14/31")
                .font(.subheadline)
                .fontWeight(.medium)
                .multilineTextAlignment(.leading)
            }
        }
        .cornerRadius(20)
        .padding()
    }
}

struct Quiz14: View{
    @State var boolean = ""
    @AppStorage("hasBG") private var hasBG = false
    @EnvironmentObject var ans: QuizAnswers

    var body: some View{
        VStack{
            
            Spacer()
            
            Text("Do you mind sharing items with rommates?")
                .font(.title)
                .fontWeight(.bold)
                .padding()

            Spacer()
            
            Text("Please type in the area below")
                .font(.subheadline)
                .foregroundColor(.gray)
                .padding(.leading)
                .padding(.top)
                .padding(.trailing)
            
            GroupBox{
                TextField("Fill in 1-10 to indicate your response. 1 for not willing and 10 for willing", text: $boolean)
                    .padding(.bottom, 100)

            }
            .padding()
            .background(Color.black.opacity(boolean == "" ? 0 : 0.12))
            .cornerRadius(15)
            .padding(.horizontal)
            .padding(.bottom)
            
            Spacer()
            
            NavigationLink(destination: Quiz13()
                .environmentObject(ans)){
                ZStack{
                    Capsule()
                        .foregroundColor(.blue)
                        .frame(width:180, height:60)
                    Text("Previous")
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                        .padding(.vertical)
                        .frame(width: UIScreen.main.bounds.width - 150)
                        .background(Color("black"))
                }
            }
            .padding(.bottom)
            NavigationLink(destination: Quiz15()
                .environmentObject(ans)
                .onAppear{
                    setIntAnsGeneric2(question:"share", question2:"share", answer:Int(boolean)!, uid:ans.user_id)
                }){
                ZStack{
                    Capsule()
                        .foregroundColor(.blue)
                        .frame(width:180, height:60)
                    Text("Next")
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                        .padding(.vertical)
                        .frame(width: UIScreen.main.bounds.width - 150)
                        .background(Color("black"))
                }
            }.disabled(boolean != "1" && boolean != "2" && boolean != "3" && boolean != "4" && boolean != "5" && boolean != "6" && boolean != "7" && boolean != "8" && boolean != "9" && boolean != "10" ? true : false)
        }
        .background(hasBG ? bgView(top1:100, top2: -250) : bgView(top1:100, top2: -250, radius1:0, radius2:0))
        .navigationBarBackButtonHidden(true)
        .toolbar{
            ToolbarItemGroup(placement:.navigationBarTrailing){
                Text("Question 15/31")
                .font(.subheadline)
                .fontWeight(.medium)
                .multilineTextAlignment(.leading)
            }
        }
        .cornerRadius(20)
        .padding()
    }
}

struct Quiz15: View{
    @State var boolean = ""
    @AppStorage("hasBG") private var hasBG = false
    @EnvironmentObject var ans: QuizAnswers

    var body: some View{
        VStack{
            Spacer()
            Text("Do you mind if your rommate smokes?")
                .font(.title)
                .fontWeight(.bold)
                .padding()

            Spacer()
            
            Text("Please type in the area below")
                .font(.subheadline)
                .foregroundColor(.gray)
                .padding(.leading)
                .padding(.top)
                .padding(.trailing)
            
            GroupBox{
                TextField("Fill in 1-10 to indicate your response. 1 for not willing and 10 for willing", text: $boolean)
                    .padding(.bottom, 100)

            }
            .padding()
            .background(Color.black.opacity(boolean == "" ? 0 : 0.12))
            .cornerRadius(15)
            .padding(.horizontal)
            .padding(.bottom)
            
            Spacer()
            
            NavigationLink(destination: Quiz14()
                .environmentObject(ans)){
                ZStack{
                    Capsule()
                        .foregroundColor(.blue)
                        .frame(width:180, height:60)
                    Text("Previous")
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                        .padding(.vertical)
                        .frame(width: UIScreen.main.bounds.width - 150)
                        .background(Color("black"))
                }
            }
            .padding(.bottom)
            NavigationLink(destination: Quiz16()
                .environmentObject(ans)
                .onAppear{
                    setIntAnsGeneric2(question:"smoke", question2:"smoke", answer:Int(boolean)!, uid:ans.user_id)
                }){
                ZStack{
                    Capsule()
                        .foregroundColor(.blue)
                        .frame(width:180, height:60)
                    Text("Next")
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                        .padding(.vertical)
                        .frame(width: UIScreen.main.bounds.width - 150)
                        .background(Color("black"))
                }
                }.disabled(boolean != "1" && boolean != "2" && boolean != "3" && boolean != "4" && boolean != "5" && boolean != "6" && boolean != "7" && boolean != "8" && boolean != "9" && boolean != "10" ? true : false)
        }
        .background(hasBG ? bgView(top1:100, top2: -250) : bgView(top1:100, top2: -250, radius1:0, radius2:0))
        .navigationBarBackButtonHidden(true)
        .toolbar{
            ToolbarItemGroup(placement:.navigationBarTrailing){
                Text("Question 16/31")
                .font(.subheadline)
                .fontWeight(.medium)
                .multilineTextAlignment(.leading)
            }
        }
        .cornerRadius(20)
        .padding()
    }
}

struct Quiz16: View{
    @State var boolean = ""
    @AppStorage("hasBG") private var hasBG = false
    @EnvironmentObject var ans: QuizAnswers

    var body: some View{
        VStack{
            
            Spacer()
            
            Text("Do you mind if your roomate drinks alcohol?")
                .font(.title)
                .fontWeight(.bold)
                .padding()

            Spacer()
            
            Text("Please type in the area below")
                .font(.subheadline)
                .foregroundColor(.gray)
                .padding(.leading)
                .padding(.top)
                .padding(.trailing)
            
            GroupBox{
                TextField("Fill in 1-10 to indicate your response. 1 for not willing and 10 for willing", text: $boolean)
                    .padding(.bottom, 100)

            }
            .padding()
            .background(Color.black.opacity(boolean == "" ? 0 : 0.12))
            .cornerRadius(15)
            .padding(.horizontal)
            .padding(.bottom)
            
            Spacer()
            
            NavigationLink(destination: Quiz15()
                .environmentObject(ans)){
                ZStack{
                    Capsule()
                        .foregroundColor(.blue)
                        .frame(width:180, height:60)
                    Text("Previous")
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                        .padding(.vertical)
                        .frame(width: UIScreen.main.bounds.width - 150)
                        .background(Color("black"))
                }
            }
            .padding(.bottom)
            NavigationLink(destination: Quiz17()
                .environmentObject(ans)
                .onAppear{
                    setIntAnsGeneric2(question:"alcohol", question2:"alcohol", answer:Int(boolean)!, uid:ans.user_id)
                }){
                ZStack{
                    Capsule()
                        .foregroundColor(.blue)
                        .frame(width:180, height:60)
                    Text("Next")
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                        .padding(.vertical)
                        .frame(width: UIScreen.main.bounds.width - 150)
                        .background(Color("black"))
                }
                }.disabled(boolean != "1" && boolean != "2" && boolean != "3" && boolean != "4" && boolean != "5" && boolean != "6" && boolean != "7" && boolean != "8" && boolean != "9" && boolean != "10" ? true : false)
        }
        .background(hasBG ? bgView(top1:100, top2: -250) : bgView(top1:100, top2: -250, radius1:0, radius2:0))
        .navigationBarBackButtonHidden(true)
        .toolbar{
            ToolbarItemGroup(placement:.navigationBarTrailing){
                Text("Question 17/31")
                .font(.subheadline)
                .fontWeight(.medium)
                .multilineTextAlignment(.leading)
            }
        }
        .cornerRadius(20)
        .padding()
    }
}

struct Quiz17: View{
    @State var boolean = ""
    @AppStorage("hasBG") private var hasBG = false
    @EnvironmentObject var ans: QuizAnswers

    var body: some View{
        VStack{

            Spacer()
            
            Text("What kind of roommate do you prefer? Introverted or extroverted?")
                .font(.title)
                .fontWeight(.bold)
                .padding()

            Spacer()
            
            Text("Please type in the area below")
                .font(.subheadline)
                .foregroundColor(.gray)
                .padding(.leading)
                .padding(.top)
                .padding(.trailing)
            
            GroupBox{
                TextField("Fill in 1-10 to indicate your response. 1 for Introverted and 10 for extroverted", text: $boolean)

            }
            .padding()
            .background(Color.black.opacity(boolean == "" ? 0 : 0.12))
            .cornerRadius(15)
            .padding(.horizontal)
            .padding(.bottom)
            
            Spacer()
            
            NavigationLink(destination: Quiz16()
                .environmentObject(ans)){
                ZStack{
                    Capsule()
                        .foregroundColor(.blue)
                        .frame(width:180, height:60)
                    Text("Previous")
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                        .padding(.vertical)
                        .frame(width: UIScreen.main.bounds.width - 150)
                        .background(Color("black"))
                }
            }
            .padding(.bottom)

            NavigationLink(destination: Quiz18()
                .environmentObject(ans)
                .onAppear{
                    setIntAnsGeneric2(question:"social", question2:"social", answer:Int(boolean)!, uid:ans.user_id)
                }){
                ZStack{
                    Capsule()
                        .foregroundColor(.blue)
                        .frame(width:180, height:60)
                    Text("Next")
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                        .padding(.vertical)
                        .frame(width: UIScreen.main.bounds.width - 150)
                        .background(Color("black"))
                }
                }.disabled(boolean != "1" && boolean != "2" && boolean != "3" && boolean != "4" && boolean != "5" && boolean != "6" && boolean != "7" && boolean != "8" && boolean != "9" && boolean != "10" ? true : false)
        }
        .background(hasBG ? bgView(top1:100, top2: -250) : bgView(top1:100, top2: -250, radius1:0, radius2:0))
        .navigationBarBackButtonHidden(true)
        .toolbar{
            ToolbarItemGroup(placement:.navigationBarTrailing){
                Text("Question 18/31")
                .font(.subheadline)
                .fontWeight(.medium)
                .multilineTextAlignment(.leading)
            }
        }
        .cornerRadius(20)
        .padding()
    }
}

struct Quiz18: View{
    @State var boolean = ""
    @AppStorage("hasBG") private var hasBG = false
    @EnvironmentObject var ans: QuizAnswers

    var body: some View{
        VStack{
            Spacer()
            
            Text("How academically focused you are?")
                .font(.title)
                .fontWeight(.bold)
                .padding()

            Spacer()
            
            Text("Please type in the area below")
                .font(.subheadline)
                .foregroundColor(.gray)
                .padding(.leading)
                .padding(.top)
                .padding(.trailing)
            
            GroupBox{
                TextField("Fill in 1-10 as your response. 1 for not academic and 10 for academic oriented", text: $boolean)
                    .padding(.bottom, 100)

            }
            .padding()
            .background(Color.black.opacity(boolean == "" ? 0 : 0.12))
            .cornerRadius(15)
            .padding(.horizontal)
            .padding(.bottom)
            
            Spacer()
            
            NavigationLink(destination: Quiz17()
                .environmentObject(ans)){
                ZStack{
                    Capsule()
                        .foregroundColor(.blue)
                        .frame(width:180, height:60)
                    Text("Previous")
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                        .padding(.vertical)
                        .frame(width: UIScreen.main.bounds.width - 150)
                        .background(Color("black"))
                }
            }
            .padding(.bottom)
            NavigationLink(destination: Quiz7w()
                .environmentObject(ans)
                .onAppear{
                    setIntAnsGeneric2(question:"academic", question2:"academic", answer:Int(boolean)!, uid:ans.user_id)
                }){
                ZStack{
                    Capsule()
                        .foregroundColor(.blue)
                        .frame(width:180, height:60)
                    Text("Next")
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                        .padding(.vertical)
                        .frame(width: UIScreen.main.bounds.width - 150)
                        .background(Color("black"))
                }
                }.disabled(boolean != "1" && boolean != "2" && boolean != "3" && boolean != "4" && boolean != "5" && boolean != "6" && boolean != "7" && boolean != "8" && boolean != "9" && boolean != "10" ? true : false)

        }
        .background(hasBG ? bgView(top1:100, top2: -250) : bgView(top1:100, top2: -250, radius1:0, radius2:0))
        .navigationBarBackButtonHidden(true)
        .toolbar{
            ToolbarItemGroup(placement:.navigationBarTrailing){
                Text("Question 19/31")
                .font(.subheadline)
                .fontWeight(.medium)
                .multilineTextAlignment(.leading)
            }
        }
        .cornerRadius(20)
        .padding()
    }
}

struct Quiz_Previews: PreviewProvider {
    static var previews: some View {
        QuizPage()
    }
}
