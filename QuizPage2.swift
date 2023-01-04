//
//  QuizPage2.swift
//  Awise
//
//  Created by LinXuanYang on 12/3/22.
//

import Foundation
import SwiftUI
import UIKit
// import uid


struct Quiz7w: View{
    @State var people = ""
    @AppStorage("hasBG") private var hasBG = false
    @EnvironmentObject var ans: QuizAnswers


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

            NavigationLink(destination: Quiz18()
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
            
            NavigationLink(destination: Quiz8w()
                .environmentObject(ans)
                .onAppear{
                    setIntAnsGeneric2(question:"bed-time-w", question2:"bed_time_w", answer:Int(people)!, uid:ans.user_id)
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


struct Quiz8w: View{
    @State var people = ""
    @AppStorage("hasBG") private var hasBG = false
    @EnvironmentObject var ans: QuizAnswers


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

            NavigationLink(destination: Quiz7w()
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
            
            NavigationLink(destination: Quiz9w()
                .environmentObject(ans)
                .onAppear{
                    setIntAnsGeneric2(question:"getup-time-w", question2:"getup_time_w", answer:Int(people)!, uid:ans.user_id)
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


struct Quiz9w: View{
    @State var people = ""
    @AppStorage("hasBG") private var hasBG = false
    @EnvironmentObject var ans: QuizAnswers


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

            NavigationLink(destination: Quiz8w()
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
            
            NavigationLink(destination: Quiz10w()
                .environmentObject(ans)
                .onAppear{
                    setIntAnsGeneric2(question:"bring-people-w", question2:"bring_people_w", answer:Int(people)!, uid:ans.user_id)
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

struct Quiz10w: View{
    @State var animal = ""
    @AppStorage("hasBG") private var hasBG = false
    @EnvironmentObject var ans: QuizAnswers


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

            NavigationLink(destination: Quiz9w()
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
            
            NavigationLink(destination: Quiz11w()
                .environmentObject(ans)
                .onAppear{
                    setIntAnsGeneric2(question:"animal-w", question2:"animal_w", answer:Int(animal)!, uid:ans.user_id)
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

struct Quiz11w: View{
    @State var animal = ""
    @AppStorage("hasBG") private var hasBG = false
    @EnvironmentObject var ans: QuizAnswers



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
            
            NavigationLink(destination: Quiz10w()
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
            
            NavigationLink(destination: Quiz12w()
                .environmentObject(ans)
                .onAppear{
                    setIntAnsGeneric2(question:"instrument-w", question2:"instrument_w", answer:Int(animal)!, uid:ans.user_id)
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

struct Quiz12w: View{
    @State var animal = ""
    @AppStorage("hasBG") private var hasBG = false
    @EnvironmentObject var ans: QuizAnswers

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

            NavigationLink(destination: Quiz11w()
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
            
            NavigationLink(destination: Quiz13w()
                .environmentObject(ans)
                .onAppear{
                    setIntAnsGeneric2(question:"cleaning-w", question2:"cleaning_w", answer:Int(animal)!, uid:ans.user_id)
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

struct Quiz13w: View{
    @State var cook = ""
    @AppStorage("hasBG") private var hasBG = false
    @EnvironmentObject var ans: QuizAnswers

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
            
            NavigationLink(destination: Quiz12w()
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
            
            NavigationLink(destination: Quiz14w()
                .environmentObject(ans)
                .onAppear{
                    setIntAnsGeneric2(question:"cook-w", question2:"cook_w", answer:Int(cook)!, uid:ans.user_id)
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

struct Quiz14w: View{
    @State var boolean = ""
    @AppStorage("hasBG") private var hasBG = false
    @EnvironmentObject var ans: QuizAnswers

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
            
            NavigationLink(destination: Quiz13w()
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
            NavigationLink(destination: Quiz15w()
                .environmentObject(ans)
                .onAppear{
                    setIntAnsGeneric2(question:"share-w", question2:"share_w", answer:Int(boolean)!, uid:ans.user_id)
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

struct Quiz15w: View{
    @State var boolean = ""
    @AppStorage("hasBG") private var hasBG = false
    @EnvironmentObject var ans: QuizAnswers

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
            
            NavigationLink(destination: Quiz14w()
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
            NavigationLink(destination: Quiz16w()
                .environmentObject(ans)
                .onAppear{
                    setIntAnsGeneric2(question:"smoke-w", question2:"smoke_w", answer:Int(boolean)!, uid:ans.user_id)
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

struct Quiz16w: View{
    @State var boolean = ""
    @AppStorage("hasBG") private var hasBG = false
    @EnvironmentObject var ans: QuizAnswers

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
            
            NavigationLink(destination: Quiz15w()
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
            NavigationLink(destination: Quiz17w()
                .environmentObject(ans)
                .onAppear{
                    setIntAnsGeneric2(question:"alcohol-w", question2:"alcohol_w", answer:Int(boolean)!, uid:ans.user_id)
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

struct Quiz17w: View{
    @State var boolean = ""
    @AppStorage("hasBG") private var hasBG = false
    @EnvironmentObject var ans: QuizAnswers

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
            
            NavigationLink(destination: Quiz16w()
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

            NavigationLink(destination: Quiz18w()
                .environmentObject(ans)
                .onAppear{
                    setIntAnsGeneric2(question:"social-w", question2:"social_w", answer:Int(boolean)!, uid:ans.user_id)
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

struct Quiz18w: View{
    @State var boolean = ""
    @AppStorage("hasBG") private var hasBG = false
    @EnvironmentObject var ans: QuizAnswers

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
            
            NavigationLink(destination: Quiz17w()
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
            NavigationLink(destination: HomeView()
                .environmentObject(ans)
                .onAppear{
                    setIntAnsGeneric2(question:"academic-w", question2:"academic_w", answer:Int(boolean)!, uid:ans.user_id)
                }){
                ZStack{
                    Capsule()
                        .foregroundColor(.blue)
                        .frame(width:180, height:60)
                    Text("Finish")
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
