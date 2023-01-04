//
//  QuizPage.swift
//  Awise
//
//  Created by liu zhenke on 10/10/22.
//

import SwiftUI


var uid:Int = -1 // testing: 50 (remote server); 8857 (if using local server)
// uid=-400 signals login unsuccessful
// uid=-401 signals registration unsuccessful
// var auth：Int = 0 // 0 represents "good", 1 signals error


struct QuizPage_home: View {
    var body: some View {
        NavigationView{
            Quiz1_home()
        }
    }
}

struct h_QuizGender: View{
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
                    Text("Confirm")
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


struct Quiz1_home: View{
    @State var name = ""
    @AppStorage("hasBG") private var hasBG = false
    @EnvironmentObject var ans_tab: Ans
    @EnvironmentObject var ans_profile: Ans2
   
    //@EnvironmentObject var ans: QuizAnswers

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

            NavigationLink(destination: QuizScroll2()
                .environmentObject(ans_tab)
                .environmentObject(ans_profile)){
                ZStack{
                    Capsule()
                        .foregroundColor(.blue)
                        .frame(width:180, height:60)
                    Text("Back")
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                        .padding(.vertical)
                        .frame(width: UIScreen.main.bounds.width - 150)
                        .background(Color("black"))
                }
            }
            .padding(.bottom)
            
            NavigationLink(destination: QuizScroll2()
                .environmentObject(ans_tab)
                .environmentObject(ans_profile)
                .onAppear{
                    setQ1(q1ans:name, uid: uid)
                                }){
                ZStack{
                    Capsule()
                        .foregroundColor(.blue)
                        .frame(width:180, height:60)
                    Text("Confirm")
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                        .padding(.vertical)
                        .frame(width: UIScreen.main.bounds.width - 150)
                        .background(Color("black"))
                }
            }
            .padding(.bottom)
        }
        .background(hasBG ? bgView(top1:100, top2: -250) : bgView(top1:100, top2: -250, radius1:0, radius2:0))
        .navigationBarHidden(true)
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

struct Quiz2_home: View{
    @State var year = ""
    @AppStorage("hasBG") private var hasBG = false
    @EnvironmentObject var ans_tab: Ans
    @EnvironmentObject var ans_profile: Ans2
    //@EnvironmentObject var ans: QuizAnswers
    var body: some View{
        VStack{

            Spacer()
            
            Text("What year are you in school?")
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
                TextField("Your year here", text: $year)
                    .padding(.bottom, 100)

            }
            .padding()
            .background(Color.black.opacity(year == "" ? 0 : 0.12))
            .cornerRadius(15)
            .padding(.horizontal)
            .padding(.bottom)
            
            Spacer()
            
            NavigationLink(destination: QuizScroll2()
                .environmentObject(ans_tab)
                .environmentObject(ans_profile)){
                ZStack{
                    Capsule()
                        .foregroundColor(.blue)
                        .frame(width:180, height:60)
                    Text("Back")
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                        .padding(.vertical)
                        .frame(width: UIScreen.main.bounds.width - 150)
                        .background(Color("black"))
                }
            }
            .padding(.bottom)
            NavigationLink(destination: QuizScroll2()
                .environmentObject(ans_tab)
                .environmentObject(ans_profile)
                .onAppear{setIntAnsGeneric(question:"school-year", question2:"school_year", answer:Int(year)!, uid:uid)
                                }){
                ZStack{
                    Capsule()
                        .foregroundColor(.blue)
                        .frame(width:180, height:60)
                    Text("Confirm")
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                        .padding(.vertical)
                        .frame(width: UIScreen.main.bounds.width - 150)
                        .background(Color("black"))
                }
            }
            .padding(.bottom)
        }
        .background(hasBG ? bgView(top1:100, top2: -250) : bgView(top1:100, top2: -250, radius1:0, radius2:0))
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

struct Quiz3_home: View{
    @State var rent = ""
    @AppStorage("hasBG") private var hasBG = false
    @EnvironmentObject var ans_tab: Ans
    @EnvironmentObject var ans_profile: Ans2
    //@EnvironmentObject var ans: QuizAnswers
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
            
            NavigationLink(destination: QuizScroll2()
                .environmentObject(ans_tab)
                .environmentObject(ans_profile)){
                ZStack{
                    Capsule()
                        .foregroundColor(.blue)
                        .frame(width:180, height:60)
                    Text("Back")
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                        .padding(.vertical)
                        .frame(width: UIScreen.main.bounds.width - 150)
                        .background(Color("black"))
                }
            }
            .padding(.bottom)
            NavigationLink(destination: QuizScroll2()
                .environmentObject(ans_tab)
                .environmentObject(ans_profile)
                .onAppear{
                                    setIntAnsGeneric(question:"rent", question2:"rent", answer:Int(rent)!, uid:uid)
                                }){
                ZStack{
                    Capsule()
                        .foregroundColor(.blue)
                        .frame(width:180, height:60)
                    Text("Confirm")
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                        .padding(.vertical)
                        .frame(width: UIScreen.main.bounds.width - 150)
                        .background(Color("black"))
                }
            }
            .padding(.bottom)
        }   .background(hasBG ? bgView(top1:100, top2: -250) : bgView(top1:100, top2: -250, radius1:0, radius2:0))
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

struct Quiz4_home: View{
   // @State var date = ""
    @State private var date = Date()
    @AppStorage("hasBG") private var hasBG = false
    @EnvironmentObject var ans_tab: Ans
    @EnvironmentObject var ans_profile: Ans2
    //@EnvironmentObject var ans: QuizAnswers
    let formatter = DateFormatter()

    var body: some View{
        VStack{
            
            Spacer()
            
            Text("What is your ideal move-in date?")
                .font(.title)
                .fontWeight(.bold)
                .padding()
            
            Spacer()
  
            DatePicker(
                "Start Date",
                selection: $date,
                displayedComponents: [.date]
            ).datePickerStyle(.graphical)
            
            Spacer()
            
            NavigationLink(destination: QuizScroll()
                .environmentObject(ans_tab)
                .environmentObject(ans_profile)){
                ZStack{
                    Capsule()
                        .foregroundColor(.blue)
                        .frame(width:180, height:60)
                    Text("Back")
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                        .padding(.vertical)
                        .frame(width: UIScreen.main.bounds.width - 150)
                        .background(Color("black"))
                }
            }            .padding(.bottom)

            NavigationLink(destination: QuizScroll()
                .environmentObject(ans_tab)
                .environmentObject(ans_profile)
                .onAppear{
                                    setAnsGeneric(question:"move-in-date", question2:"move_in_date", answer: formatter.string(from:date), uid:uid)
                                    print(formatter.string(from:date))
                                }){
                ZStack{
                    Capsule()
                        .foregroundColor(.blue)
                        .frame(width:180, height:60)
                    Text("Confirm")
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                        .padding(.vertical)
                        .frame(width: UIScreen.main.bounds.width - 150)
                        .background(Color("black"))
                }
            }
            .padding(.bottom)
        }.background(hasBG ? bgView(top1:50, top2: -250) : bgView(top1:100, top2: -250, radius1:0, radius2:0))
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

struct Quiz5_home: View{
    @State var number = ""
    @AppStorage("hasBG") private var hasBG = false
    @EnvironmentObject var ans_tab: Ans
    @EnvironmentObject var ans_profile: Ans2
    //@EnvironmentObject var ans: QuizAnswers
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
                TextField("Your number here", text: $number)
                    .padding(.bottom, 100)
            }
            .padding()
            .background(Color.black.opacity(number == "" ? 0 : 0.12))
            .cornerRadius(15)
            .padding(.horizontal)
            .padding(.bottom)
            
            Spacer()
            
            NavigationLink(destination: QuizScroll2()
                .environmentObject(ans_tab)
                .environmentObject(ans_profile)
                ){
                ZStack{
                    Capsule()
                        .foregroundColor(.blue)
                        .frame(width:180, height:60)
                    Text("Back")
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                        .padding(.vertical)
                        .frame(width: UIScreen.main.bounds.width - 150)
                        .background(Color("black"))
                }
            }
            .padding(.bottom)
            NavigationLink(destination: QuizScroll2()
                .environmentObject(ans_tab)
                .environmentObject(ans_profile)
                .onAppear{
                                    setIntAnsGeneric(question:"number-of-room", question2:"number_of_room", answer: Int(number)!, uid: uid)
                                }){
                ZStack{
                    Capsule()
                        .foregroundColor(.blue)
                        .frame(width:180, height:60)
                    Text("Confirm")
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                        .padding(.vertical)
                        .frame(width: UIScreen.main.bounds.width - 150)
                        .background(Color("black"))
                }
            }
            .padding(.bottom)

        }.background(hasBG ? bgView(top1:50, top2: -300) : bgView(top1:80, top2: -250, radius1:10, radius2:0))
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

struct Quiz6_home: View{
    @State var location = ""
    @AppStorage("hasBG") private var hasBG = false
    @EnvironmentObject var ans_tab: Ans
    @EnvironmentObject var ans_profile: Ans2
    //@EnvironmentObject var ans: QuizAnswers
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
           
            NavigationLink(destination: QuizScroll()
                .environmentObject(ans_tab)
                .environmentObject(ans_profile)){
                ZStack{
                    Capsule()
                        .foregroundColor(.blue)
                        .frame(width:180, height:60)
                    Text("Back")
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                        .padding(.vertical)
                        .frame(width: UIScreen.main.bounds.width - 150)
                        .background(Color("black"))
                }
            }
            .padding(.bottom)
            NavigationLink(destination: QuizScroll()
                .environmentObject(ans_tab)
                .environmentObject(ans_profile)
                .onAppear{
                                    setAnsGeneric(question:"location", question2:"location", answer:location, uid:uid)
                                }){
                ZStack{
                    Capsule()
                        .foregroundColor(.blue)
                        .frame(width:180, height:60)
                    Text("Confirm")
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                        .padding(.vertical)
                        .frame(width: UIScreen.main.bounds.width - 150)
                        .background(Color("black"))
                }
            }
            .padding(.bottom)

        }   .background(hasBG ? bgView(top1:400, top2: -250) : bgView(top1:100, top2: -250, radius1:0, radius2:0))
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

struct Quiz7_home: View{
    @State var hour = ""
    @State var minute = ""
    @State var time = ""
    @State private var date = Date()
    @AppStorage("hasBG") private var hasBG = true
    @EnvironmentObject var ans_tab: Ans
    @EnvironmentObject var ans_profile: Ans2
    //@EnvironmentObject var ans: QuizAnswers
    
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

            DatePicker(
                   "Sleep Time",
                    selection: $date,
                    displayedComponents: [.hourAndMinute]
               )
            .background(Color.black.opacity(time == "" ? 0 : 0.12))
            .cornerRadius(15)
            .padding(.horizontal)
            .padding(.bottom)
            Spacer()
            NavigationLink(destination: QuizScroll()
                .environmentObject(ans_tab)
                .environmentObject(ans_profile)){
                ZStack{
                    Capsule()
                        .foregroundColor(.blue)
                        .frame(width:180, height:60)
                    Text("Back")
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                        .padding(.vertical)
                        .frame(width: UIScreen.main.bounds.width - 150)
                        .background(Color("black"))
                }
            }
            .padding(.bottom)
            NavigationLink(destination: QuizScroll()
                .environmentObject(ans_tab)
                .environmentObject(ans_profile)
                .onAppear{
                                    let hour = calendar.component(.hour, from: date)
                                    setIntAnsGeneric2(question:"bed-time", question2:"bed_time", answer:Int(hour), uid:uid)
                                    
                                    //print(formatter.string(from:date))
                                }){
                ZStack{
                    Capsule()
                        .foregroundColor(.blue)
                        .frame(width:180, height:60)
                    Text("Confirm")
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                        .padding(.vertical)
                        .frame(width: UIScreen.main.bounds.width - 150)
                        .background(Color("black"))
                }
            }
            .padding(.bottom)

        }   .background(hasBG ? bgView(top1:290, top2: -250) : bgView(top1:100, top2: -250, radius1:0, radius2:0))
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

struct Quiz8_home: View{
    @State var hour = ""
    @State var minute = ""
    @State var time = ""
    @State private var date = Date()
    @AppStorage("hasBG") private var hasBG = false
    @EnvironmentObject var ans_tab: Ans
    @EnvironmentObject var ans_profile: Ans2
    //@EnvironmentObject var ans: QuizAnswers
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
            
            NavigationLink(destination: QuizScroll()
                .environmentObject(ans_tab)
                .environmentObject(ans_profile)){
                ZStack{
                    Capsule()
                        .foregroundColor(.blue)
                        .frame(width:180, height:60)
                    Text("Back")
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                        .padding(.vertical)
                        .frame(width: UIScreen.main.bounds.width - 150)
                        .background(Color("black"))
                }
            }
            .padding(.bottom)
            NavigationLink(destination: QuizScroll()
                .environmentObject(ans_tab)
                .environmentObject(ans_profile)
                .onAppear{
                                    let hour = calendar.component(.hour, from: date)
                                    setIntAnsGeneric2(question:"getup-time", question2:"getup_time", answer:Int(hour), uid:uid)
                                }){
                ZStack{
                    Capsule()
                        .foregroundColor(.blue)
                        .frame(width:180, height:60)
                    Text("Confirm")
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                        .padding(.vertical)
                        .frame(width: UIScreen.main.bounds.width - 150)
                        .background(Color("black"))
                }
            }
            .padding(.bottom)
        }        .background(hasBG ? bgView(top1:100, top2: -250) : bgView(top1:100, top2: -250, radius1:0, radius2:0))
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

struct Quiz9_home: View{
    @State var people = ""
    @AppStorage("hasBG") private var hasBG = false
    @EnvironmentObject var ans_tab: Ans
    @EnvironmentObject var ans_profile: Ans2
    //@EnvironmentObject var ans: QuizAnswers
    var body: some View{
        VStack{
            
            Spacer()
            
            Text("Approximately, How many times would you bring people to your apartment every week?")
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
                TextField("number", text: $people)
            }
            .padding()
            .background(Color.black.opacity(people == "" ? 0 : 0.12))
            .cornerRadius(15)
            .padding(.horizontal)
            .padding(.bottom)
            
            Spacer()

            NavigationLink(destination: QuizScroll4()
                .environmentObject(ans_tab)
                .environmentObject(ans_profile)){
                ZStack{
                    Capsule()
                        .foregroundColor(.blue)
                        .frame(width:180, height:60)
                    Text("Back")
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                        .padding(.vertical)
                        .frame(width: UIScreen.main.bounds.width - 150)
                        .background(Color("black"))
                }
            }
            .padding(.bottom)
            NavigationLink(destination: QuizScroll4()
                .environmentObject(ans_tab)
                .environmentObject(ans_profile)
                .onAppear{
                                    setIntAnsGeneric2(question:"bring-people", question2:"bring_people", answer:Int(people)!, uid:uid)
                                }){
                ZStack{
                    Capsule()
                        .foregroundColor(.blue)
                        .frame(width:180, height:60)
                    Text("Confirm")
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                        .padding(.vertical)
                        .frame(width: UIScreen.main.bounds.width - 150)
                        .background(Color("black"))
                }
            }
            .padding(.bottom)
        }       .background(hasBG ? bgView(top1:100, top2: -250) : bgView(top1:100, top2: -250, radius1:0, radius2:0))
        .navigationBarBackButtonHidden(true)
        .toolbar{
            ToolbarItemGroup(placement:.navigationBarTrailing){
                Text("Question 10/31")
                .font(.subheadline)
                .fontWeight(.medium)
                .multilineTextAlignment(.leading)
            }
        }
        .cornerRadius(20)
        .padding()
    }
}

struct Quiz10_home: View{
    @State var animal = ""
    @AppStorage("hasBG") private var hasBG = false
    @EnvironmentObject var ans_tab: Ans
    @EnvironmentObject var ans_profile: Ans2
    //@EnvironmentObject var ans: QuizAnswers
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
                TextField("Comfortable or Uncomfortable", text: $animal)

            }
            .padding()
            .background(Color.black.opacity(animal == "" ? 0 : 0.12))
            .cornerRadius(15)
            .padding(.horizontal)
            .padding(.bottom)
            
            Spacer()

            NavigationLink(destination: QuizScroll4()
                .environmentObject(ans_tab)
                .environmentObject(ans_profile)){
                ZStack{
                    Capsule()
                        .foregroundColor(.blue)
                        .frame(width:180, height:60)
                    Text("Back")
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                        .padding(.vertical)
                        .frame(width: UIScreen.main.bounds.width - 150)
                        .background(Color("black"))
                }
            }
            .padding(.bottom)
            NavigationLink(destination: QuizScroll4()
                .environmentObject(ans_tab)
                .environmentObject(ans_profile)
                .onAppear{
                                    setIntAnsGeneric2(question:"animal", question2:"animal", answer:Int(animal)!, uid:uid)
                                }){
                ZStack{
                    Capsule()
                        .foregroundColor(.blue)
                        .frame(width:180, height:60)
                    Text("Confirm")
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                        .padding(.vertical)
                        .frame(width: UIScreen.main.bounds.width - 150)
                        .background(Color("black"))
                }
            }
            .padding(.bottom)
        }       .background(hasBG ? bgView(top1:190, top2: -250) : bgView(top1:100, top2: -250, radius1:0, radius2:0))
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

struct Quiz11_home: View{
    @State var animal = ""
    @AppStorage("hasBG") private var hasBG = false
    @EnvironmentObject var ans_tab: Ans
    @EnvironmentObject var ans_profile: Ans2
    //@EnvironmentObject var ans: QuizAnswers
    
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
                TextField("Your frequency here", text: $animal)
                    .padding(.bottom, 100)

            }
            .padding()
            .background(Color.black.opacity(animal == "" ? 0 : 0.12))
            .cornerRadius(15)
            .padding(.horizontal)
            .padding(.bottom)
            
            Spacer()
            
            NavigationLink(destination: QuizScroll4()
                .environmentObject(ans_tab)
                .environmentObject(ans_profile)){
                ZStack{
                    Capsule()
                        .foregroundColor(.blue)
                        .frame(width:180, height:60)
                    Text("Back")
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                        .padding(.vertical)
                        .frame(width: UIScreen.main.bounds.width - 150)
                        .background(Color("black"))
                }
            }
            .padding(.bottom)

            NavigationLink(destination: QuizScroll4()
                .environmentObject(ans_tab)
                .environmentObject(ans_profile)
                .onAppear{
                                    setIntAnsGeneric2(question:"instrument", question2:"instrument", answer:Int(animal)!, uid:uid)
                                }){
                ZStack{
                    Capsule()
                        .foregroundColor(.blue)
                        .frame(width:180, height:60)
                    Text("Confirm")
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                        .padding(.vertical)
                        .frame(width: UIScreen.main.bounds.width - 150)
                        .background(Color("black"))
                }
            }
            .padding(.bottom)
        }       .background(hasBG ? bgView(top1:100, top2: -430) : bgView(top1:100, top2: 250, radius1:0, radius2:0))
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

struct Quiz12_home: View{
    @State var animal = ""
    @AppStorage("hasBG") private var hasBG = false
    @EnvironmentObject var ans_tab: Ans
    @EnvironmentObject var ans_profile: Ans2
    //@EnvironmentObject var ans: QuizAnswers
    
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
                TextField("Your frequency here", text: $animal)
                    .padding(.bottom, 100)

            }
            .padding()
            .background(Color.black.opacity(animal == "" ? 0 : 0.12))
            .cornerRadius(15)
            .padding(.horizontal)
            .padding(.bottom)
            
            Spacer()

            NavigationLink(destination: QuizScroll4()
                .environmentObject(ans_tab)
                .environmentObject(ans_profile)){
                ZStack{
                    Capsule()
                        .foregroundColor(.blue)
                        .frame(width:180, height:60)
                    Text("Back")
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                        .padding(.vertical)
                        .frame(width: UIScreen.main.bounds.width - 150)
                        .background(Color("black"))
                }
            }
            .padding(.bottom)
            NavigationLink(destination: QuizScroll4()
                .environmentObject(ans_tab)
                .environmentObject(ans_profile)
                .onAppear{
                                    setIntAnsGeneric2(question:"cleaning", question2:"cleaning", answer:Int(animal)!, uid:uid)
                                }){
                ZStack{
                    Capsule()
                        .foregroundColor(.blue)
                        .frame(width:180, height:60)
                    Text("Confirm")
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                        .padding(.vertical)
                        .frame(width: UIScreen.main.bounds.width - 150)
                        .background(Color("black"))
                }
            }
            .padding(.bottom)
        }       .background(hasBG ? bgView(top1:10, top2: -430) : bgView(top1:100, top2: 250, radius1:0, radius2:0))
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

struct Quiz13_home: View{
    @State var cook = ""
    @AppStorage("hasBG") private var hasBG = false
    @EnvironmentObject var ans_tab: Ans
    @EnvironmentObject var ans_profile: Ans2
    //@EnvironmentObject var ans: QuizAnswers

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
                TextField("Your frequency here", text: $cook)
                    .padding(.bottom, 100)

            }
            .padding()
            .background(Color.black.opacity(cook == "" ? 0 : 0.12))
            .cornerRadius(15)
            .padding(.horizontal)
            .padding(.bottom)
            
            Spacer()
            
            NavigationLink(destination: QuizScroll4()
                .environmentObject(ans_tab)
                .environmentObject(ans_profile)){
                ZStack{
                    Capsule()
                        .foregroundColor(.blue)
                        .frame(width:180, height:60)
                    Text("Back")
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                        .padding(.vertical)
                        .frame(width: UIScreen.main.bounds.width - 150)
                        .background(Color("black"))
                }
            }.padding(.bottom)
            NavigationLink(destination: QuizScroll4()
                .environmentObject(ans_tab)
                .environmentObject(ans_profile)
                .onAppear{
                                    setIntAnsGeneric2(question:"cook", question2:"cook", answer:Int(cook)!, uid:uid)
                                }){
                ZStack{
                    Capsule()
                        .foregroundColor(.blue)
                        .frame(width:180, height:60)
                    Text("Confirm")
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                        .padding(.vertical)
                        .frame(width: UIScreen.main.bounds.width - 150)
                        .background(Color("black"))
                }
            }
            .padding(.bottom)
        }       .background(hasBG ? bgView(top1: 120, top2: -30) : bgView(top1:100, top2: 250, radius1:0, radius2:0))
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

struct Quiz14_home: View{
    @State var boolean = ""
    @AppStorage("hasBG") private var hasBG = false
    @EnvironmentObject var ans_tab: Ans
    @EnvironmentObject var ans_profile: Ans2
    //@EnvironmentObject var ans: QuizAnswers
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
                TextField("Yes, No, or Something else?", text: $boolean)
                    .padding(.bottom, 100)
                
            }
            .padding()
            .background(Color.black.opacity(boolean == "" ? 0 : 0.12))
            .cornerRadius(15)
            .padding(.horizontal)
            .padding(.bottom)
            
            Spacer()
            
            NavigationLink(destination: QuizScroll5()
                .environmentObject(ans_tab)
                .environmentObject(ans_profile)
                .onAppear{
                                    setIntAnsGeneric2(question:"share", question2:"share", answer:Int(boolean)!, uid:uid)
                                }){
                ZStack{
                    Capsule()
                        .foregroundColor(.blue)
                        .frame(width:180, height:60)
                    Text("Back")
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                        .padding(.vertical)
                        .frame(width: UIScreen.main.bounds.width - 150)
                        .background(Color("black"))
                }
                }.padding(.bottom)
                
                NavigationLink(destination: QuizScroll5()
                    .environmentObject(ans_tab)
                    .environmentObject(ans_profile)){
                    ZStack{
                        Capsule()
                            .foregroundColor(.blue)
                            .frame(width:180, height:60)
                        Text("Confirm")
                            .fontWeight(.heavy)
                            .foregroundColor(.white)
                            .padding(.vertical)
                            .frame(width: UIScreen.main.bounds.width - 150)
                            .background(Color("black"))
                    }
                }.padding(.bottom)
            .background(hasBG ? bgView(top1:100, top2: -430) : bgView(top1:100, top2: 250, radius1:0, radius2:0))
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
}

struct Quiz15_home: View{
    @State var boolean = ""
    @AppStorage("hasBG") private var hasBG = false
    @EnvironmentObject var ans_tab: Ans
    @EnvironmentObject var ans_profile: Ans2
    //@EnvironmentObject var ans: QuizAnswers

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
                TextField("Yes, No, or Something else?", text: $boolean)
                    .padding(.bottom, 100)
                
            }
            .padding()
            .background(Color.black.opacity(boolean == "" ? 0 : 0.12))
            .cornerRadius(15)
            .padding(.horizontal)
            .padding(.bottom)
            
            Spacer()
            
            NavigationLink(destination: QuizScroll5()
                .environmentObject(ans_tab)
                .environmentObject(ans_profile)){
                ZStack{
                    Capsule()
                        .foregroundColor(.blue)
                        .frame(width:180, height:60)
                    Text("Back")
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                        .padding(.vertical)
                        .frame(width: UIScreen.main.bounds.width - 150)
                        .background(Color("black"))
                }
            }
            .padding(.bottom)
            
            NavigationLink(destination: QuizScroll5()
                .environmentObject(ans_tab)
                .environmentObject(ans_profile)
                .onAppear{
                                    setIntAnsGeneric2(question:"smoke", question2:"smoke", answer:Int(boolean)!, uid:uid)
                                }){
                ZStack{
                    Capsule()
                        .foregroundColor(.blue)
                        .frame(width:180, height:60)
                    Text("Confirm")
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                        .padding(.vertical)
                        .frame(width: UIScreen.main.bounds.width - 150)
                        .background(Color("black"))
                }
            }
            }.padding(.bottom)
                .background(hasBG ? bgView(top1:100, top2: -430) : bgView(top1:100, top2: 250, radius1:0, radius2:0))
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

struct Quiz16_home: View{
    @State var boolean = ""
    @AppStorage("hasBG") private var hasBG = false
    @EnvironmentObject var ans_tab: Ans
    @EnvironmentObject var ans_profile: Ans2
    //@EnvironmentObject var ans: QuizAnswers

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
                TextField("Yes, No, or Something else?", text: $boolean)
                    .padding(.bottom, 100)

            }
            .padding()
            .background(Color.black.opacity(boolean == "" ? 0 : 0.12))
            .cornerRadius(15)
            .padding(.horizontal)
            .padding(.bottom)
            
            Spacer()
            
            NavigationLink(destination: QuizScroll5()
                .environmentObject(ans_tab)
                .environmentObject(ans_profile)){
                ZStack{
                    Capsule()
                        .foregroundColor(.blue)
                        .frame(width:180, height:60)
                    Text("Back")
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                        .padding(.vertical)
                        .frame(width: UIScreen.main.bounds.width - 150)
                        .background(Color("black"))
                }
            }
            .padding(.bottom)
            NavigationLink(destination: QuizScroll5()
                .environmentObject(ans_tab)
                .environmentObject(ans_profile)
                .onAppear{
                                    setIntAnsGeneric2(question:"alcohol", question2:"alcohol", answer:Int(boolean)!, uid:uid)
                                }){
                ZStack{
                    Capsule()
                        .foregroundColor(.blue)
                        .frame(width:180, height:60)
                    Text("Confirm")
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                        .padding(.vertical)
                        .frame(width: UIScreen.main.bounds.width - 150)
                        .background(Color("black"))
                }
            }
            }.padding(.bottom)
                .background(hasBG ? bgView(top1:90, top2: -330) : bgView(top1:100, top2: 250, radius1:0, radius2:0))
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

struct Quiz17_home: View{
    @State var boolean = ""
    @AppStorage("hasBG") private var hasBG = false
    @EnvironmentObject var ans_tab: Ans
    @EnvironmentObject var ans_profile: Ans2
    //@EnvironmentObject var ans: QuizAnswers

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
                TextField("Introvert or Extrovert", text: $boolean)

            }
            .padding()
            .background(Color.black.opacity(boolean == "" ? 0 : 0.12))
            .cornerRadius(15)
            .padding(.horizontal)
            .padding(.bottom)
            
            Spacer()
            
            NavigationLink(destination: QuizScroll5()
                .environmentObject(ans_tab)
                .environmentObject(ans_profile)){
                ZStack{
                    Capsule()
                        .foregroundColor(.blue)
                        .frame(width:180, height:60)
                    Text("Back")
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                        .padding(.vertical)
                        .frame(width: UIScreen.main.bounds.width - 150)
                        .background(Color("black"))
                }
            }
            .padding(.bottom)

            NavigationLink(destination: QuizScroll5()
                .environmentObject(ans_tab)
                .environmentObject(ans_profile)
                .onAppear{
                                    setIntAnsGeneric2(question:"social", question2:"social", answer:Int(boolean)!, uid:uid)
                                }){
                ZStack{
                    Capsule()
                        .foregroundColor(.blue)
                        .frame(width:180, height:60)
                    Text("Confirm")
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                        .padding(.vertical)
                        .frame(width: UIScreen.main.bounds.width - 150)
                        .background(Color("black"))
                }
            }
            }.padding(.bottom)
                .background(hasBG ? bgView(top1:220, top2: -30) : bgView(top1:100, top2: 250, radius1:0, radius2:0))
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

struct Quiz18_home: View{
    @State var boolean = ""
    @AppStorage("hasBG") private var hasBG = false
    @EnvironmentObject var ans_tab: Ans
    @EnvironmentObject var ans_profile: Ans2
    //@EnvironmentObject var ans: QuizAnswers

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
                TextField("Courses? Projects?", text: $boolean)
                    .padding(.bottom, 100)

            }
            .padding()
            .background(Color.black.opacity(boolean == "" ? 0 : 0.12))
            .cornerRadius(15)
            .padding(.horizontal)
            .padding(.bottom)
            
            Spacer()
            
            NavigationLink(destination: QuizScroll5()
                .environmentObject(ans_tab)
                .environmentObject(ans_profile)){
                ZStack{
                    Capsule()
                        .foregroundColor(.blue)
                        .frame(width:180, height:60)
                    Text("Back")
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                        .padding(.vertical)
                        .frame(width: UIScreen.main.bounds.width - 150)
                        .background(Color("black"))
                }
            }
            .padding(.bottom)
            NavigationLink(destination: QuizScroll5()
                .environmentObject(ans_tab)
                .environmentObject(ans_profile)
                .onAppear{
                                    setIntAnsGeneric2(question:"academic", question2:"academic", answer:Int(boolean)!, uid:uid)
                                }){
                ZStack{
                    Capsule()
                        .foregroundColor(.blue)
                        .frame(width:180, height:60)
                    Text("Confirm")
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                        .padding(.vertical)
                        .frame(width: UIScreen.main.bounds.width - 150)
                        .background(Color("black"))
                }
            }
            }.padding(.bottom)
                .background(hasBG ? bgView(top1:170, top2: -130) : bgView(top1:100, top2: 250, radius1:0, radius2:0))
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

struct Quiz_home_Previews: PreviewProvider {
    static var previews: some View {
        QuizPage_home()
    }
}


struct h_Quiz7w: View{
    @State var people = ""
    @AppStorage("hasBG") private var hasBG = false
    // @EnvironmentObject var ans: QuizAnswers
    @EnvironmentObject var ans_tab: Ans
    @EnvironmentObject var ans_profile: Ans2


    var body: some View{
        VStack{
            
            Spacer()
            
            Text("How do you value the importance of go-to-bed time?")
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
                TextField("Fill 1-10 as your response. 1 for not important and 10 for important", text: $people)
            }
            .padding()
            .background(Color.black.opacity(people == "" ? 0 : 0.12))
            .cornerRadius(15)
            .padding(.horizontal)
            .padding(.bottom)
            
            Spacer()

            NavigationLink(destination: QuizScroll2()
                .environmentObject(ans_tab)
                .environmentObject(ans_profile)){
                ZStack{
                    Capsule()
                        .foregroundColor(.blue)
                        .frame(width:180, height:60)
                    Text("Back")
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                        .padding(.vertical)
                        .frame(width: UIScreen.main.bounds.width - 150)
                        .background(Color("black"))
                }
            }
            .padding(.bottom)
            
            NavigationLink(destination: QuizScroll2()
                .environmentObject(ans_tab)
                .environmentObject(ans_profile)
                .onAppear{
                    setIntAnsGeneric2(question:"bed-time-w", question2:"bed_time_w", answer:Int(people)!, uid:uid)
                }){
                ZStack{
                    Capsule()
                        .foregroundColor(.blue)
                        .frame(width:180, height:60)
                    Text("Confirm")
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
                Text("Question 20/31")
                .font(.subheadline)
                .fontWeight(.medium)
                .multilineTextAlignment(.leading)
            }
        }
        .cornerRadius(20)
        .padding()
    }
}


struct h_Quiz8w: View{
    @State var people = ""
    @AppStorage("hasBG") private var hasBG = false
    @EnvironmentObject var ans_tab: Ans
    @EnvironmentObject var ans_profile: Ans2


    var body: some View{
        VStack{
            
            Spacer()
            
            Text("How do you value the importance of get-up time?")
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
                TextField("Fill 1-10 as your response. 1 for not important and 10 for important", text: $people)
            }
            .padding()
            .background(Color.black.opacity(people == "" ? 0 : 0.12))
            .cornerRadius(15)
            .padding(.horizontal)
            .padding(.bottom)
            
            Spacer()

            NavigationLink(destination: QuizScroll2()
                .environmentObject(ans_tab)
                .environmentObject(ans_profile)){
                ZStack{
                    Capsule()
                        .foregroundColor(.blue)
                        .frame(width:180, height:60)
                    Text("Back")
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                        .padding(.vertical)
                        .frame(width: UIScreen.main.bounds.width - 150)
                        .background(Color("black"))
                }
            }
            .padding(.bottom)
            
            NavigationLink(destination: QuizScroll2()
                .environmentObject(ans_tab)
                .environmentObject(ans_profile)
                .onAppear{
                    setIntAnsGeneric2(question:"getup-time-w", question2:"getup_time_w", answer:Int(people)!, uid:uid)
                }){
                ZStack{
                    Capsule()
                        .foregroundColor(.blue)
                        .frame(width:180, height:60)
                    Text("Confirm")
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
                Text("Question 21/31")
                .font(.subheadline)
                .fontWeight(.medium)
                .multilineTextAlignment(.leading)
            }
        }
        .cornerRadius(20)
        .padding()
    }
}


struct h_Quiz9w: View{
    @State var people = ""
    @AppStorage("hasBG") private var hasBG = false
    @EnvironmentObject var ans_tab: Ans
    @EnvironmentObject var ans_profile: Ans2


    var body: some View{
        VStack{
            
            Spacer()
            
            Text("How do you value the importance of bringing people to the apartment?")
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
                TextField("Fill 1-10 as your response. 1 for not important and 10 for important", text: $people)
            }
            .padding()
            .background(Color.black.opacity(people == "" ? 0 : 0.12))
            .cornerRadius(15)
            .padding(.horizontal)
            .padding(.bottom)
            
            Spacer()

            NavigationLink(destination: QuizScroll2()
                .environmentObject(ans_tab)
                .environmentObject(ans_profile)){
                ZStack{
                    Capsule()
                        .foregroundColor(.blue)
                        .frame(width:180, height:60)
                    Text("Back")
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                        .padding(.vertical)
                        .frame(width: UIScreen.main.bounds.width - 150)
                        .background(Color("black"))
                }
            }
            .padding(.bottom)
            
            NavigationLink(destination: QuizScroll2()
                .environmentObject(ans_tab)
                .environmentObject(ans_profile)
                .onAppear{
                    setIntAnsGeneric2(question:"bring-people-w", question2:"bring_people_w", answer:Int(people)!, uid:uid)
                }){
                ZStack{
                    Capsule()
                        .foregroundColor(.blue)
                        .frame(width:180, height:60)
                    Text("Confirm")
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
                Text("Question 22/31")
                .font(.subheadline)
                .fontWeight(.medium)
                .multilineTextAlignment(.leading)
            }
        }
        .cornerRadius(20)
        .padding()
    }
}

struct h_Quiz10w: View{
    @State var animal = ""
    @AppStorage("hasBG") private var hasBG = false
    @EnvironmentObject var ans_tab: Ans
    @EnvironmentObject var ans_profile: Ans2


    var body: some View{
        VStack{

            Spacer()
            
            Text("How do you value the importance of pet preference?")
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
                TextField("Fill 1-10 as your response. 1 for not important and 10 for important", text: $animal)

            }
            .padding()
            .background(Color.black.opacity(animal == "" ? 0 : 0.12))
            .cornerRadius(15)
            .padding(.horizontal)
            .padding(.bottom)
            
            Spacer()

            NavigationLink(destination: QuizScroll2()
                .environmentObject(ans_tab)
                .environmentObject(ans_profile)){
                ZStack{
                    Capsule()
                        .foregroundColor(.blue)
                        .frame(width:180, height:60)
                    Text("Back")
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                        .padding(.vertical)
                        .frame(width: UIScreen.main.bounds.width - 150)
                        .background(Color("black"))
                }
            }
            .padding(.bottom)
            
            NavigationLink(destination: QuizScroll2()
                .environmentObject(ans_tab)
                .environmentObject(ans_profile)
                .onAppear{
                    setIntAnsGeneric2(question:"animal-w", question2:"animal_w", answer:Int(animal)!, uid:uid)
                }){
                ZStack{
                    Capsule()
                        .foregroundColor(.blue)
                        .frame(width:180, height:60)
                    Text("Confirm")
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
                Text("Question 23/31")
                .font(.subheadline)
                .fontWeight(.medium)
                .multilineTextAlignment(.leading)
            }
        }
        .cornerRadius(20)
        .padding()
    }
}

struct h_Quiz11w: View{
    @State var animal = ""
    @AppStorage("hasBG") private var hasBG = false
    @EnvironmentObject var ans_tab: Ans
    @EnvironmentObject var ans_profile: Ans2



    var body: some View{
        VStack{
            
            Spacer()
            
            Text("How do you value the importance of instrument?")
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
                TextField("Fill 1-10 as your response. 1 for not important and 10 for important", text: $animal)
                    .padding(.bottom, 100)

            }
            .padding()
            .background(Color.black.opacity(animal == "" ? 0 : 0.12))
            .cornerRadius(15)
            .padding(.horizontal)
            .padding(.bottom)
            
            Spacer()
            
            NavigationLink(destination: QuizScroll2()
                .environmentObject(ans_tab)
                .environmentObject(ans_profile)){
                ZStack{
                    Capsule()
                        .foregroundColor(.blue)
                        .frame(width:180, height:60)
                    Text("Back")
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                        .padding(.vertical)
                        .frame(width: UIScreen.main.bounds.width - 150)
                        .background(Color("black"))
                }
            }
            .padding(.bottom)
            
            NavigationLink(destination: QuizScroll2()
                .environmentObject(ans_tab)
                .environmentObject(ans_profile)
                .onAppear{
                    setIntAnsGeneric2(question:"instrument-w", question2:"instrument_w", answer:Int(animal)!, uid:uid)
                }){
                ZStack{
                    Capsule()
                        .foregroundColor(.blue)
                        .frame(width:180, height:60)
                    Text("Confirm")
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
                Text("Question 24/31")
                .font(.subheadline)
                .fontWeight(.medium)
                .multilineTextAlignment(.leading)
            }
        }
        .cornerRadius(20)
        .padding()
    }
}

struct h_Quiz12w: View{
    @State var animal = ""
    @AppStorage("hasBG") private var hasBG = false
    @EnvironmentObject var ans_tab: Ans
    @EnvironmentObject var ans_profile: Ans2

    var body: some View{
        VStack{

            Spacer()
            
            Text("How do you value the importance of cleaning habits?")
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
                TextField("Fill 1-10 as your response. 1 for not important and 10 for important", text: $animal)
                    .padding(.bottom, 100)

            }
            .padding()
            .background(Color.black.opacity(animal == "" ? 0 : 0.12))
            .cornerRadius(15)
            .padding(.horizontal)
            .padding(.bottom)
            
            Spacer()

            NavigationLink(destination: QuizScroll2()
                .environmentObject(ans_tab)
                .environmentObject(ans_profile)){
                ZStack{
                    Capsule()
                        .foregroundColor(.blue)
                        .frame(width:180, height:60)
                    Text("Back")
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                        .padding(.vertical)
                        .frame(width: UIScreen.main.bounds.width - 150)
                        .background(Color("black"))
                }
            }
            .padding(.bottom)
            
            NavigationLink(destination: QuizScroll2()
                .environmentObject(ans_tab)
                .environmentObject(ans_profile)
                .onAppear{
                    setIntAnsGeneric2(question:"cleaning-w", question2:"cleaning_w", answer:Int(animal)!, uid:uid)
                }){
                ZStack{
                    Capsule()
                        .foregroundColor(.blue)
                        .frame(width:180, height:60)
                    Text("Confirm")
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
                Text("Question 25/31")
                .font(.subheadline)
                .fontWeight(.medium)
                .multilineTextAlignment(.leading)
            }
        }
        .cornerRadius(20)
        .padding()
    }
}

struct h_Quiz13w: View{
    @State var cook = ""
    @AppStorage("hasBG") private var hasBG = false
    @EnvironmentObject var ans_tab: Ans
    @EnvironmentObject var ans_profile: Ans2

    var body: some View{
        VStack{
            
            Spacer()
            
            Text("How do you value the importance of cooking habits?")
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
                TextField("Fill 1-10 as your response. 1 for not important and 10 for important", text: $cook)
                    .padding(.bottom, 100)

            }
            .padding()
            .background(Color.black.opacity(cook == "" ? 0 : 0.12))
            .cornerRadius(15)
            .padding(.horizontal)
            .padding(.bottom)
            
            Spacer()
            
            NavigationLink(destination: QuizScroll2()
                .environmentObject(ans_tab)
                .environmentObject(ans_profile)){
                ZStack{
                    Capsule()
                        .foregroundColor(.blue)
                        .frame(width:180, height:60)
                    Text("Back")
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                        .padding(.vertical)
                        .frame(width: UIScreen.main.bounds.width - 150)
                        .background(Color("black"))
                }
            }
            .padding(.bottom)
            
            NavigationLink(destination: QuizScroll2()
                .environmentObject(ans_tab)
                .environmentObject(ans_profile)
                .onAppear{
                    setIntAnsGeneric2(question:"cook-w", question2:"cook_w", answer:Int(cook)!, uid:uid)
                }){
                ZStack{
                    Capsule()
                        .foregroundColor(.blue)
                        .frame(width:180, height:60)
                    Text("Confirm")
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
                Text("Question 26/31")
                .font(.subheadline)
                .fontWeight(.medium)
                .multilineTextAlignment(.leading)
            }
        }
        .cornerRadius(20)
        .padding()
    }
}

struct h_Quiz14w: View{
    @State var boolean = ""
    @AppStorage("hasBG") private var hasBG = false
    @EnvironmentObject var ans_tab: Ans
    @EnvironmentObject var ans_profile: Ans2

    var body: some View{
        VStack{
            
            Spacer()
            
            Text("How do you value the importance of sharing item preferences?")
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
                TextField("Fill 1-10 as your response. 1 for not important and 10 for important", text: $boolean)
                    .padding(.bottom, 100)

            }
            .padding()
            .background(Color.black.opacity(boolean == "" ? 0 : 0.12))
            .cornerRadius(15)
            .padding(.horizontal)
            .padding(.bottom)
            
            Spacer()
            
            NavigationLink(destination: QuizScroll2()
                .environmentObject(ans_tab)
                .environmentObject(ans_profile)){
                ZStack{
                    Capsule()
                        .foregroundColor(.blue)
                        .frame(width:180, height:60)
                    Text("Back")
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                        .padding(.vertical)
                        .frame(width: UIScreen.main.bounds.width - 150)
                        .background(Color("black"))
                }
            }
            .padding(.bottom)
            NavigationLink(destination: QuizScroll2()
                .environmentObject(ans_tab)
                .environmentObject(ans_profile)
                .onAppear{
                    setIntAnsGeneric2(question:"share-w", question2:"share_w", answer:Int(boolean)!, uid:uid)
                }){
                ZStack{
                    Capsule()
                        .foregroundColor(.blue)
                        .frame(width:180, height:60)
                    Text("Confirm")
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
                Text("Question 27/31")
                .font(.subheadline)
                .fontWeight(.medium)
                .multilineTextAlignment(.leading)
            }
        }
        .cornerRadius(20)
        .padding()
    }
}

struct h_Quiz15w: View{
    @State var boolean = ""
    @AppStorage("hasBG") private var hasBG = false
    @EnvironmentObject var ans_tab: Ans
    @EnvironmentObject var ans_profile: Ans2

    var body: some View{
        VStack{
            Spacer()
            Text("How do you value the importance of smoking preferences?")
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
                TextField("Fill 1-10 as your response. 1 for not important and 10 for important", text: $boolean)
                    .padding(.bottom, 100)

            }
            .padding()
            .background(Color.black.opacity(boolean == "" ? 0 : 0.12))
            .cornerRadius(15)
            .padding(.horizontal)
            .padding(.bottom)
            
            Spacer()
            
            NavigationLink(destination: QuizScroll2()
                .environmentObject(ans_tab)
                .environmentObject(ans_profile)){
                ZStack{
                    Capsule()
                        .foregroundColor(.blue)
                        .frame(width:180, height:60)
                    Text("Back")
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                        .padding(.vertical)
                        .frame(width: UIScreen.main.bounds.width - 150)
                        .background(Color("black"))
                }
            }
            .padding(.bottom)
            NavigationLink(destination: QuizScroll2()
                .environmentObject(ans_tab)
                .environmentObject(ans_profile)
                .onAppear{
                    setIntAnsGeneric2(question:"smoke-w", question2:"smoke_w", answer:Int(boolean)!, uid:uid)
                }){
                ZStack{
                    Capsule()
                        .foregroundColor(.blue)
                        .frame(width:180, height:60)
                    Text("Confirm")
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
                Text("Question 28/31")
                .font(.subheadline)
                .fontWeight(.medium)
                .multilineTextAlignment(.leading)
            }
        }
        .cornerRadius(20)
        .padding()
    }
}

struct h_Quiz16w: View{
    @State var boolean = ""
    @AppStorage("hasBG") private var hasBG = false
    @EnvironmentObject var ans_tab: Ans
    @EnvironmentObject var ans_profile: Ans2

    var body: some View{
        VStack{
            
            Spacer()
            
            Text("How do you value the importance of alcohol preferences?")
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
                TextField("Fill 1-10 as your response. 1 for not important and 10 for important", text: $boolean)
                    .padding(.bottom, 100)

            }
            .padding()
            .background(Color.black.opacity(boolean == "" ? 0 : 0.12))
            .cornerRadius(15)
            .padding(.horizontal)
            .padding(.bottom)
            
            Spacer()
            
            NavigationLink(destination: QuizScroll2()
                .environmentObject(ans_tab)
                .environmentObject(ans_profile)){
                ZStack{
                    Capsule()
                        .foregroundColor(.blue)
                        .frame(width:180, height:60)
                    Text("Back")
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                        .padding(.vertical)
                        .frame(width: UIScreen.main.bounds.width - 150)
                        .background(Color("black"))
                }
            }
            .padding(.bottom)
            NavigationLink(destination: QuizScroll2()
                .environmentObject(ans_tab)
                .environmentObject(ans_profile)
                .onAppear{
                    setIntAnsGeneric2(question:"alcohol-w", question2:"alcohol_w", answer:Int(boolean)!, uid:uid)
                }){
                ZStack{
                    Capsule()
                        .foregroundColor(.blue)
                        .frame(width:180, height:60)
                    Text("Confirm")
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
                Text("Question 29/31")
                .font(.subheadline)
                .fontWeight(.medium)
                .multilineTextAlignment(.leading)
            }
        }
        .cornerRadius(20)
        .padding()
    }
}

struct h_Quiz17w: View{
    @State var boolean = ""
    @AppStorage("hasBG") private var hasBG = false
    @EnvironmentObject var ans_tab: Ans
    @EnvironmentObject var ans_profile: Ans2

    var body: some View{
        VStack{

            Spacer()
            
            Text("How do you value the importance of personality?")
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
                TextField("Fill 1-10 as your response. 1 for not important and 10 for important", text: $boolean)

            }
            .padding()
            .background(Color.black.opacity(boolean == "" ? 0 : 0.12))
            .cornerRadius(15)
            .padding(.horizontal)
            .padding(.bottom)
            
            Spacer()
            
            NavigationLink(destination: QuizScroll2()
                .environmentObject(ans_tab)
                .environmentObject(ans_profile)){
                ZStack{
                    Capsule()
                        .foregroundColor(.blue)
                        .frame(width:180, height:60)
                    Text("Back")
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                        .padding(.vertical)
                        .frame(width: UIScreen.main.bounds.width - 150)
                        .background(Color("black"))
                }
            }
            .padding(.bottom)

            NavigationLink(destination: QuizScroll2()
                .environmentObject(ans_tab)
                .environmentObject(ans_profile)
                .onAppear{
                    setIntAnsGeneric2(question:"social-w", question2:"social_w", answer:Int(boolean)!, uid:uid)
                }){
                ZStack{
                    Capsule()
                        .foregroundColor(.blue)
                        .frame(width:180, height:60)
                    Text("Confirm")
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
                Text("Question 30/31")
                .font(.subheadline)
                .fontWeight(.medium)
                .multilineTextAlignment(.leading)
            }
        }
        .cornerRadius(20)
        .padding()
    }
}

struct h_Quiz18w: View{
    @State var boolean = ""
    @AppStorage("hasBG") private var hasBG = false
    @EnvironmentObject var ans_tab: Ans
    @EnvironmentObject var ans_profile: Ans2

    var body: some View{
        VStack{
            Spacer()
            
            Text("How do you value the importance of academic?")
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
                TextField("Fill 1-10 as your response. 1 for not important and 10 for important.", text: $boolean)
                    .padding(.bottom, 100)

            }
            .padding()
            .background(Color.black.opacity(boolean == "" ? 0 : 0.12))
            .cornerRadius(15)
            .padding(.horizontal)
            .padding(.bottom)
            
            Spacer()
            
            NavigationLink(destination: QuizScroll2()
                .environmentObject(ans_tab)
                .environmentObject(ans_profile)){
                ZStack{
                    Capsule()
                        .foregroundColor(.blue)
                        .frame(width:180, height:60)
                    Text("Back")
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                        .padding(.vertical)
                        .frame(width: UIScreen.main.bounds.width - 150)
                        .background(Color("black"))
                }
            }
            .padding(.bottom)
            NavigationLink(destination: QuizScroll2()
                .environmentObject(ans_tab)
                .environmentObject(ans_profile)
                .onAppear{
                    setIntAnsGeneric2(question:"academic-w", question2:"academic_w", answer:Int(boolean)!, uid:uid)
                }){
                ZStack{
                    Capsule()
                        .foregroundColor(.blue)
                        .frame(width:180, height:60)
                    Text("Confirm")
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
                Text("Question 31/31")
                .font(.subheadline)
                .fontWeight(.medium)
                .multilineTextAlignment(.leading)
            }
        }
        .cornerRadius(20)
        .padding()
    }
}

