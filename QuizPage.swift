//
//  QuizPage.swift
//  Awise
//
//  Created by liu zhenke on 10/10/22.
//

import SwiftUI

struct QuizPage: View {
    var body: some View {
        NavigationView{
            Quiz1()
        }
    }
}
struct Quiz1: View{
    @State var name = ""
    var body: some View{
        VStack{
            Text("Profile")
                .font(.largeTitle)
                .foregroundColor(Color.pink)
                .padding()
            Text("Question 1/19")
                .padding()
            Spacer()
            Text("What is your name?")
                .font(.title)
                .padding()
            
            HStack{
                TextField("Please input your name here", text: $name)
                    .autocapitalization(.none)
                    .fontWeight(.heavy)
                    .padding()

            }
            .padding()
            .background(Color.black.opacity(name == "" ? 0 : 0.12))
            .cornerRadius(15)
            .padding(.horizontal)
            .padding(.bottom)
            Spacer()
           
            Button(action: {}, label: {
                NavigationLink(destination: Quiz2()){
                    ZStack{
                        Capsule()
                            .foregroundColor(.blue.opacity(0.6))
                            .frame(width:180, height:60)
                        
        
                        
                        Text("Next Question")
                            .fontWeight(.heavy)
                            .foregroundColor(.black.opacity(0.6))
                            .padding(.vertical)
                            .frame(width: UIScreen.main.bounds.width - 150)
                            .background(Color("black"))
                    }
                }
            })
            Spacer()
        }
        
    }
}

struct Quiz2: View{
    @State var year = ""
    var body: some View{
        VStack{
            Text("Profile")
                .font(.largeTitle)
                .foregroundColor(Color.pink)
                .padding()
            Text("Question 2/19")
                .padding()
            Spacer()
            Text("What is your year?")
                .font(.title)
                .padding()
            
            HStack{
                TextField("Please input your year here", text: $year)
                    .autocapitalization(.none)
                    .fontWeight(.heavy)
                    .padding()

            }
            .padding()
            .background(Color.black.opacity(year == "" ? 0 : 0.12))
            .cornerRadius(15)
            .padding(.horizontal)
            .padding(.bottom)
            Spacer()
            Button(action: {}, label: {
                NavigationLink(destination: Quiz1()){
                    ZStack{
                        Capsule()
                            .foregroundColor(.blue.opacity(0.6))
                            .frame(width:180, height:60)
                        Text("Previous Question")
                            .fontWeight(.heavy)
                            .foregroundColor(.black.opacity(0.6))
                            .padding(.vertical)
                            .frame(width: UIScreen.main.bounds.width - 150)
                            .background(Color("black"))
                    }
                }
            })
            Button(action: {}, label: {
                NavigationLink(destination: Quiz3()){
                    ZStack{
                        Capsule()
                            .foregroundColor(.blue.opacity(0.6))
                            .frame(width:180, height:60)
                        Text("Next Question")
                            .fontWeight(.heavy)
                            .foregroundColor(.black.opacity(0.6))
                            .padding(.vertical)
                            .frame(width: UIScreen.main.bounds.width - 150)
                            .background(Color("black"))
                    }
                }
            })
            Spacer()
        }
        
    }
}

struct Quiz3: View{
    @State var rent = ""
    var body: some View{
        VStack{
            Text("Profile")
                .font(.largeTitle)
                .foregroundColor(Color.pink)
                .padding()
            Text("Question 3/19")
                .padding()
            Spacer()
            Text("How much rent is accepable?")
                .font(.title)
                .padding()
            
            HStack{
                TextField("Please input the number here", text: $rent)
                    .autocapitalization(.none)
                    .fontWeight(.heavy)
                    .padding()

            }
            .padding()
            .background(Color.black.opacity(rent == "" ? 0 : 0.12))
            .cornerRadius(15)
            .padding(.horizontal)
            .padding(.bottom)
             Spacer()
            Button(action: {}, label: {
                NavigationLink(destination: Quiz2()){
                    ZStack{
                        Capsule()
                            .foregroundColor(.blue.opacity(0.6))
                            .frame(width:180, height:60)
                        Text("Previous Question")
                            .fontWeight(.heavy)
                            .foregroundColor(.black.opacity(0.6))
                            .padding(.vertical)
                            .frame(width: UIScreen.main.bounds.width - 150)
                            .background(Color("black"))
                    }
                }
            })
            Button(action: {}, label: {
                NavigationLink(destination: Quiz4()){
                    ZStack{
                        Capsule()
                            .foregroundColor(.blue.opacity(0.6))
                            .frame(width:180, height:60)
                        Text("Next Question")
                            .fontWeight(.heavy)
                            .foregroundColor(.black.opacity(0.6))
                            .padding(.vertical)
                            .frame(width: UIScreen.main.bounds.width - 150)
                            .background(Color("black"))
                    }
                }
            })
            Spacer()
        }
        
    }
}
//Need further improvements
struct Quiz4: View{
    @State var date = ""
    var body: some View{
        VStack{
            Text("Profile")
                .font(.largeTitle)
                .foregroundColor(Color.pink)
                .padding()
            Text("Question 4/19")
                .padding()
            Spacer()
            Text("What is your ideal move in date?")
                .font(.title)
                .padding()
            
            HStack{
                TextField("mm/dd/yyyy", text: $date)
                    .autocapitalization(.none)
                    .fontWeight(.heavy)
                    .padding()

            }
            .padding()
            .background(Color.black.opacity(date == "" ? 0 : 0.12))
            .cornerRadius(15)
            .padding(.horizontal)
            .padding(.bottom)
            Spacer()
            Button(action: {}, label: {
                NavigationLink(destination: Quiz3()){
                    ZStack{
                        Capsule()
                            .foregroundColor(.blue.opacity(0.6))
                            .frame(width:180, height:60)
                        Text("Previous Question")
                            .fontWeight(.heavy)
                            .foregroundColor(.black.opacity(0.6))
                            .padding(.vertical)
                            .frame(width: UIScreen.main.bounds.width - 150)
                            .background(Color("black"))
                    }
                }
            })
            Button(action: {}, label: {
                NavigationLink(destination: Quiz5()){
                    ZStack{
                        Capsule()
                            .foregroundColor(.blue.opacity(0.6))
                            .frame(width:180, height:60)
                        Text("Next Question")
                            .fontWeight(.heavy)
                            .foregroundColor(.black.opacity(0.6))
                            .padding(.vertical)
                            .frame(width: UIScreen.main.bounds.width - 150)
                            .background(Color("black"))
                    }
                }
            })
            Spacer()
        }
        
    }
}

struct Quiz5: View{
    @State var number = ""
    var body: some View{
        VStack{
            Text("Profile")
                .font(.largeTitle)
                .foregroundColor(Color.pink)
                .padding()
            Text("Question 5/19")
                .padding()
            Spacer()
            Text("How many roommates do you want?")
                .font(.title)
                .padding()
            
            HStack{
                TextField("Input number here", text: $number)
                    .autocapitalization(.none)
                    .fontWeight(.heavy)
                    .padding()

            }
            .padding()
            .background(Color.black.opacity(number == "" ? 0 : 0.12))
            .cornerRadius(15)
            .padding(.horizontal)
            .padding(.bottom)
            Spacer()
            Button(action: {}, label: {
                NavigationLink(destination: Quiz4()){
                    ZStack{
                        Capsule()
                            .foregroundColor(.blue.opacity(0.6))
                            .frame(width:180, height:60)
                        Text("Previous Question")
                            .fontWeight(.heavy)
                            .foregroundColor(.black.opacity(0.6))
                            .padding(.vertical)
                            .frame(width: UIScreen.main.bounds.width - 150)
                            .background(Color("black"))
                    }
                }
            })
            Button(action: {}, label: {
                NavigationLink(destination: Quiz6()){
                    ZStack{
                        Capsule()
                            .foregroundColor(.blue.opacity(0.6))
                            .frame(width:180, height:60)
                        Text("Next Question")
                            .fontWeight(.heavy)
                            .foregroundColor(.black.opacity(0.6))
                            .padding(.vertical)
                            .frame(width: UIScreen.main.bounds.width - 150)
                            .background(Color("black"))
                    }
                }
            })
            Spacer()
        }
        
    }
}

struct Quiz6: View{
    @State var location = ""
    var body: some View{
        VStack{
            Text("Profile")
                .font(.largeTitle)
                .foregroundColor(Color.pink)
                .padding()
            Text("Question 6/19")
                .padding()
            Spacer()
            Text("Where do you want to live?")
                .font(.title)
                .padding()
            
            HStack{
                TextField("Input locations here", text: $location)
                    .autocapitalization(.none)
                    .fontWeight(.heavy)
                    .padding()

            }
            .padding()
            .background(Color.black.opacity(location == "" ? 0 : 0.12))
            .cornerRadius(15)
            .padding(.horizontal)
            .padding(.bottom)
            Spacer()
            Button(action: {}, label: {
                NavigationLink(destination: Quiz5()){
                    ZStack{
                        Capsule()
                            .foregroundColor(.blue.opacity(0.6))
                            .frame(width:180, height:60)
                        Text("Previous Question")
                            .fontWeight(.heavy)
                            .foregroundColor(.black.opacity(0.6))
                            .padding(.vertical)
                            .frame(width: UIScreen.main.bounds.width - 150)
                            .background(Color("black"))
                    }
                }
            })
            Button(action: {}, label: {
                NavigationLink(destination: Quiz7()){
                    ZStack{
                        Capsule()
                            .foregroundColor(.blue.opacity(0.6))
                            .frame(width:180, height:60)
                        Text("Next Question")
                            .fontWeight(.heavy)
                            .foregroundColor(.black.opacity(0.6))
                            .padding(.vertical)
                            .frame(width: UIScreen.main.bounds.width - 150)
                            .background(Color("black"))
                    }
                }
            })
            Spacer()
        }
        
    }
}


struct Quiz7: View{
    @State var hour = ""
    @State var minute = ""
    @State var time = ""
    var body: some View{
        VStack{
            Text("Profile")
                .font(.largeTitle)
                .foregroundColor(Color.pink)
                .padding()
            Text("Question 7/19")
                .padding()
            Spacer()
            Text("What time do you go to bed at night?")
                .font(.title)
                .padding()
            
            HStack{
                TextField("Hour:Minute", text: $time)
                    .autocapitalization(.none)
                    .fontWeight(.heavy)
                    .padding()

            }
            .padding()
            .background(Color.black.opacity(time == "" ? 0 : 0.12))
            .cornerRadius(15)
            .padding(.horizontal)
            .padding(.bottom)
            Spacer()
            Button(action: {}, label: {
                NavigationLink(destination: Quiz6()){
                    ZStack{
                        Capsule()
                            .foregroundColor(.blue.opacity(0.6))
                            .frame(width:180, height:60)
                        Text("Previous Question")
                            .fontWeight(.heavy)
                            .foregroundColor(.black.opacity(0.6))
                            .padding(.vertical)
                            .frame(width: UIScreen.main.bounds.width - 150)
                            .background(Color("black"))
                    }
                }
            })
            Button(action: {}, label: {
                NavigationLink(destination: Quiz8()){
                    ZStack{
                        Capsule()
                            .foregroundColor(.blue.opacity(0.6))
                            .frame(width:180, height:60)
                        Text("Next Question")
                            .fontWeight(.heavy)
                            .foregroundColor(.black.opacity(0.6))
                            .padding(.vertical)
                            .frame(width: UIScreen.main.bounds.width - 150)
                            .background(Color("black"))
                    }
                }
            })
            Spacer()
        }
        
    }
}

struct Quiz8: View{
    @State var hour = ""
    @State var minute = ""
    @State var time = ""
    var body: some View{
        VStack{
            Text("Profile")
                .font(.largeTitle)
                .foregroundColor(Color.pink)
                .padding()
            Text("Question 8/19")
                .padding()
            Spacer()
            Text("What time do you get up in the morning?")
                .font(.title)
                .padding()
            
            HStack{
                TextField("Hour:Minute", text: $time)
                    .autocapitalization(.none)
                    .fontWeight(.heavy)
                    .padding()

            }
            .padding()
            .background(Color.black.opacity(time == "" ? 0 : 0.12))
            .cornerRadius(15)
            .padding(.horizontal)
            .padding(.bottom)
            Spacer()
            Button(action: {}, label: {
                NavigationLink(destination: Quiz7()){
                    ZStack{
                        Capsule()
                            .foregroundColor(.blue.opacity(0.6))
                            .frame(width:180, height:60)
                        Text("Previous Question")
                            .fontWeight(.heavy)
                            .foregroundColor(.black.opacity(0.6))
                            .padding(.vertical)
                            .frame(width: UIScreen.main.bounds.width - 150)
                            .background(Color("black"))
                    }
                }
            })
            Button(action: {}, label: {
                NavigationLink(destination: Quiz9()){
                    ZStack{
                        Capsule()
                            .foregroundColor(.blue.opacity(0.6))
                            .frame(width:180, height:60)
                        Text("Next Question")
                            .fontWeight(.heavy)
                            .foregroundColor(.black.opacity(0.6))
                            .padding(.vertical)
                            .frame(width: UIScreen.main.bounds.width - 150)
                            .background(Color("black"))
                    }
                }
            })
            Spacer()
        }
    }
}


struct Quiz9: View{
    @State var people = ""

    var body: some View{
        VStack{
            Text("Profile")
                .font(.largeTitle)
                .foregroundColor(Color.pink)
                .padding()
            Text("Question 9/19")
                .padding()
            Spacer()
            Text("How frequent would you bring people to your apartment per week?")
                .font(.title)
                .padding()
            
            HStack{
                TextField("number", text: $people)
                    .autocapitalization(.none)
                    .fontWeight(.heavy)
                    .padding()

            }
            .padding()
            .background(Color.black.opacity(people == "" ? 0 : 0.12))
            .cornerRadius(15)
            .padding(.horizontal)
            .padding(.bottom)
            Spacer()
            Button(action: {}, label: {
                NavigationLink(destination: Quiz8()){
                    ZStack{
                        Capsule()
                            .foregroundColor(.blue.opacity(0.6))
                            .frame(width:180, height:60)
                        Text("Previous Question")
                            .fontWeight(.heavy)
                            .foregroundColor(.black.opacity(0.6))
                            .padding(.vertical)
                            .frame(width: UIScreen.main.bounds.width - 150)
                            .background(Color("black"))
                    }
                }
            })
            Button(action: {}, label: {
                NavigationLink(destination: Quiz10()){
                    ZStack{
                        Capsule()
                            .foregroundColor(.blue.opacity(0.6))
                            .frame(width:180, height:60)
                        Text("Next Question")
                            .fontWeight(.heavy)
                            .foregroundColor(.black.opacity(0.6))
                            .padding(.vertical)
                            .frame(width: UIScreen.main.bounds.width - 150)
                            .background(Color("black"))
                    }
                }
            })
            Spacer()
        }
    }
}

struct Quiz10: View{
    @State var animal = ""

    var body: some View{
        VStack{
            Text("Profile")
                .font(.largeTitle)
                .foregroundColor(Color.pink)
                .padding()
            Text("Question 10/19")
                .padding()
            Spacer()
            Text("How comfortable are you with an animal in the apartment?")
                .font(.title)
                .padding()
            
            HStack{
                TextField("Input your feeling here", text: $animal)
                    .autocapitalization(.none)
                    .fontWeight(.heavy)
                    .padding()

            }
            .padding()
            .background(Color.black.opacity(animal == "" ? 0 : 0.12))
            .cornerRadius(15)
            .padding(.horizontal)
            .padding(.bottom)
            Spacer()
            Button(action: {}, label: {
                NavigationLink(destination: Quiz9()){
                    ZStack{
                        Capsule()
                            .foregroundColor(.blue.opacity(0.6))
                            .frame(width:180, height:60)
                        Text("Previous Question")
                            .fontWeight(.heavy)
                            .foregroundColor(.black.opacity(0.6))
                            .padding(.vertical)
                            .frame(width: UIScreen.main.bounds.width - 150)
                            .background(Color("black"))
                    }
                }
            })
            Button(action: {}, label: {
                NavigationLink(destination: Quiz11()){
                    ZStack{
                        Capsule()
                            .foregroundColor(.blue.opacity(0.6))
                            .frame(width:180, height:60)
                        Text("Next Question")
                            .fontWeight(.heavy)
                            .foregroundColor(.black.opacity(0.6))
                            .padding(.vertical)
                            .frame(width: UIScreen.main.bounds.width - 150)
                            .background(Color("black"))
                    }
                }
            })
            Spacer()
        }
    }
}

struct Quiz11: View{
    @State var animal = ""

    var body: some View{
        VStack{
            Text("Profile")
                .font(.largeTitle)
                .foregroundColor(Color.pink)
                .padding()
            Text("Question 11/19")
                .padding()
            Spacer()
            Text("How often do you play music or instruments publicly per week?")
                .font(.title)
                .padding()
            
            HStack{
                TextField("Input frequency here", text: $animal)
                    .autocapitalization(.none)
                    .fontWeight(.heavy)
                    .padding()

            }
            .padding()
            .background(Color.black.opacity(animal == "" ? 0 : 0.12))
            .cornerRadius(15)
            .padding(.horizontal)
            .padding(.bottom)
            Spacer()
            Button(action: {}, label: {
                NavigationLink(destination: Quiz10()){
                    ZStack{
                        Capsule()
                            .foregroundColor(.blue.opacity(0.6))
                            .frame(width:180, height:60)
                        Text("Previous Question")
                            .fontWeight(.heavy)
                            .foregroundColor(.black.opacity(0.6))
                            .padding(.vertical)
                            .frame(width: UIScreen.main.bounds.width - 150)
                            .background(Color("black"))
                    }
                }
            })
            Button(action: {}, label: {
                NavigationLink(destination: Quiz12()){
                    ZStack{
                        Capsule()
                            .foregroundColor(.blue.opacity(0.6))
                            .frame(width:180, height:60)
                        Text("Next Question")
                            .fontWeight(.heavy)
                            .foregroundColor(.black.opacity(0.6))
                            .padding(.vertical)
                            .frame(width: UIScreen.main.bounds.width - 150)
                            .background(Color("black"))
                    }
                }
            })
            Spacer()
        }
    }
}

struct Quiz12: View{
    @State var animal = ""

    var body: some View{
        VStack{
            Text("Profile")
                .font(.largeTitle)
                .foregroundColor(Color.pink)
                .padding()
            Text("Question 12/19")
                .padding()
            Spacer()
            Text("How often would you clean your room per week?")
                .font(.title)
                .padding()
            
            HStack{
                TextField("Input frequency here", text: $animal)
                    .autocapitalization(.none)
                    .fontWeight(.heavy)
                    .padding()

            }
            .padding()
            .background(Color.black.opacity(animal == "" ? 0 : 0.12))
            .cornerRadius(15)
            .padding(.horizontal)
            .padding(.bottom)
            Spacer()
            Button(action: {}, label: {
                NavigationLink(destination: Quiz11()){
                    ZStack{
                        Capsule()
                            .foregroundColor(.blue.opacity(0.6))
                            .frame(width:180, height:60)
                        Text("Previous Question")
                            .fontWeight(.heavy)
                            .foregroundColor(.black.opacity(0.6))
                            .padding(.vertical)
                            .frame(width: UIScreen.main.bounds.width - 150)
                            .background(Color("black"))
                    }
                }
            })
            Button(action: {}, label: {
                NavigationLink(destination: Quiz13()){
                    ZStack{
                        Capsule()
                            .foregroundColor(.blue.opacity(0.6))
                            .frame(width:180, height:60)
                        Text("Next Question")
                            .fontWeight(.heavy)
                            .foregroundColor(.black.opacity(0.6))
                            .padding(.vertical)
                            .frame(width: UIScreen.main.bounds.width - 150)
                            .background(Color("black"))
                    }
                }
            })
            Spacer()
        }
    }
}

struct Quiz13: View{
    @State var cook = ""

    var body: some View{
        VStack{
            Text("Profile")
                .font(.largeTitle)
                .foregroundColor(Color.pink)
                .padding()
            Text("Question 13/19")
                .padding()
            Spacer()
            Text("How many times do you cook per week?")
                .font(.title)
                .padding()
            
            HStack{
                TextField("Input frequency here", text: $cook)
                    .autocapitalization(.none)
                    .fontWeight(.heavy)
                    .padding()

            }
            .padding()
            .background(Color.black.opacity(cook == "" ? 0 : 0.12))
            .cornerRadius(15)
            .padding(.horizontal)
            .padding(.bottom)
            Spacer()
            Button(action: {}, label: {
                NavigationLink(destination: Quiz12()){
                    ZStack{
                        Capsule()
                            .foregroundColor(.blue.opacity(0.6))
                            .frame(width:180, height:60)
                        Text("Previous Question")
                            .fontWeight(.heavy)
                            .foregroundColor(.black.opacity(0.6))
                            .padding(.vertical)
                            .frame(width: UIScreen.main.bounds.width - 150)
                            .background(Color("black"))
                    }
                }
            })
            Button(action: {}, label: {
                NavigationLink(destination: Quiz14()){
                    ZStack{
                        Capsule()
                            .foregroundColor(.blue.opacity(0.6))
                            .frame(width:180, height:60)
                        Text("Next Question")
                            .fontWeight(.heavy)
                            .foregroundColor(.black.opacity(0.6))
                            .padding(.vertical)
                            .frame(width: UIScreen.main.bounds.width - 150)
                            .background(Color("black"))
                    }
                }
            })
            Spacer()
        }
    }
}

struct Quiz14: View{
    @State var boolean = ""

    var body: some View{
        VStack{
            Text("Profile")
                .font(.largeTitle)
                .foregroundColor(Color.pink)
                .padding()
            Text("Question 14/19")
                .padding()
            Spacer()
            Text("Are you ok with sharing?")
                .font(.title)
                .padding()
            
            HStack{
                TextField("Yes, Somewhat or No?", text: $boolean)
                    .autocapitalization(.none)
                    .fontWeight(.heavy)
                    .padding()

            }
            .padding()
            .background(Color.black.opacity(boolean == "" ? 0 : 0.12))
            .cornerRadius(15)
            .padding(.horizontal)
            .padding(.bottom)
            Spacer()
            Button(action: {}, label: {
                NavigationLink(destination: Quiz13()){
                    ZStack{
                        Capsule()
                            .foregroundColor(.blue.opacity(0.6))
                            .frame(width:180, height:60)
                        Text("Previous Question")
                            .fontWeight(.heavy)
                            .foregroundColor(.black.opacity(0.6))
                            .padding(.vertical)
                            .frame(width: UIScreen.main.bounds.width - 150)
                            .background(Color("black"))
                    }
                }
            })
            Button(action: {}, label: {
                NavigationLink(destination: Quiz15()){
                    ZStack{
                        Capsule()
                            .foregroundColor(.blue.opacity(0.6))
                            .frame(width:180, height:60)
                        Text("Next Question")
                            .fontWeight(.heavy)
                            .foregroundColor(.black.opacity(0.6))
                            .padding(.vertical)
                            .frame(width: UIScreen.main.bounds.width - 150)
                            .background(Color("black"))
                    }
                }
            })
            Spacer()
        }
    }
}
struct Quiz15: View{
    @State var boolean = ""

    var body: some View{
        VStack{
            Text("Profile")
                .font(.largeTitle)
                .foregroundColor(Color.pink)
                .padding()
            Text("Question 15/19")
                .padding()
            Spacer()
            Text("How accepting of cigarette smoke are you?")
                .font(.title)
                .padding()
            
            HStack{
                TextField("Yes, Somewhat or No?", text: $boolean)
                    .autocapitalization(.none)
                    .fontWeight(.heavy)
                    .padding()

            }
            .padding()
            .background(Color.black.opacity(boolean == "" ? 0 : 0.12))
            .cornerRadius(15)
            .padding(.horizontal)
            .padding(.bottom)
            Spacer()
            Button(action: {}, label: {
                NavigationLink(destination: Quiz14()){
                    ZStack{
                        Capsule()
                            .foregroundColor(.blue.opacity(0.6))
                            .frame(width:180, height:60)
                        Text("Previous Question")
                            .fontWeight(.heavy)
                            .foregroundColor(.black.opacity(0.6))
                            .padding(.vertical)
                            .frame(width: UIScreen.main.bounds.width - 150)
                            .background(Color("black"))
                    }
                }
            })
            Button(action: {}, label: {
                NavigationLink(destination: Quiz16()){
                    ZStack{
                        Capsule()
                            .foregroundColor(.blue.opacity(0.6))
                            .frame(width:180, height:60)
                        Text("Next Question")
                            .fontWeight(.heavy)
                            .foregroundColor(.black.opacity(0.6))
                            .padding(.vertical)
                            .frame(width: UIScreen.main.bounds.width - 150)
                            .background(Color("black"))
                    }
                }
            })
            Spacer()
        }
    }
}

struct Quiz16: View{
    @State var boolean = ""

    var body: some View{
        VStack{
            Text("Profile")
                .font(.largeTitle)
                .foregroundColor(Color.pink)
                .padding()
            Text("Question 16/19")
                .padding()
            Spacer()
            Text("How accepting of cigarette smoke are you?")
                .font(.title)
                .padding()
            
            HStack{
                TextField("Yes, Somewhat or No?", text: $boolean)
                    .autocapitalization(.none)
                    .fontWeight(.heavy)
                    .padding()

            }
            .padding()
            .background(Color.black.opacity(boolean == "" ? 0 : 0.12))
            .cornerRadius(15)
            .padding(.horizontal)
            .padding(.bottom)
            Spacer()
            Button(action: {}, label: {
                NavigationLink(destination: Quiz15()){
                    ZStack{
                        Capsule()
                            .foregroundColor(.blue.opacity(0.6))
                            .frame(width:180, height:60)
                        Text("Previous Question")
                            .fontWeight(.heavy)
                            .foregroundColor(.black.opacity(0.6))
                            .padding(.vertical)
                            .frame(width: UIScreen.main.bounds.width - 150)
                            .background(Color("black"))
                    }
                }
            })
            Button(action: {}, label: {
                NavigationLink(destination: Quiz17()){
                    ZStack{
                        Capsule()
                            .foregroundColor(.blue.opacity(0.6))
                            .frame(width:180, height:60)
                        Text("Next Question")
                            .fontWeight(.heavy)
                            .foregroundColor(.black.opacity(0.6))
                            .padding(.vertical)
                            .frame(width: UIScreen.main.bounds.width - 150)
                            .background(Color("black"))
                    }
                }
            })
            Spacer()
        }
    }
}

struct Quiz17: View{
    @State var boolean = ""

    var body: some View{
        VStack{
            Text("Profile")
                .font(.largeTitle)
                .foregroundColor(Color.pink)
                .padding()
            Text("Question 17/19")
                .padding()
            Spacer()
            Text("How accepting of alcohol are you?")
                .font(.title)
                .padding()
            
            HStack{
                TextField("Yes, Somewhat or No?", text: $boolean)
                    .autocapitalization(.none)
                    .fontWeight(.heavy)
                    .padding()

            }
            .padding()
            .background(Color.black.opacity(boolean == "" ? 0 : 0.12))
            .cornerRadius(15)
            .padding(.horizontal)
            .padding(.bottom)
            Spacer()
            Button(action: {}, label: {
                NavigationLink(destination: Quiz16()){
                    ZStack{
                        Capsule()
                            .foregroundColor(.blue.opacity(0.6))
                            .frame(width:180, height:60)
                        Text("Previous Question")
                            .fontWeight(.heavy)
                            .foregroundColor(.black.opacity(0.6))
                            .padding(.vertical)
                            .frame(width: UIScreen.main.bounds.width - 150)
                            .background(Color("black"))
                    }
                }
            })
            Button(action: {}, label: {
                NavigationLink(destination: Quiz18()){
                    ZStack{
                        Capsule()
                            .foregroundColor(.blue.opacity(0.6))
                            .frame(width:180, height:60)
                        Text("Next Question")
                            .fontWeight(.heavy)
                            .foregroundColor(.black.opacity(0.6))
                            .padding(.vertical)
                            .frame(width: UIScreen.main.bounds.width - 150)
                            .background(Color("black"))
                    }
                }
            })
            Spacer()
        }
    }
}

struct Quiz18: View{
    @State var boolean = ""

    var body: some View{
        VStack{
            Text("Profile")
                .font(.largeTitle)
                .foregroundColor(Color.pink)
                .padding()
            Text("Question 18/19")
                .padding()
            Spacer()
            Text("Would you prefer your roommate to be introverted or extroverted?")
                .font(.title)
                .padding()
            
            HStack{
                TextField("extroverted or introverted?", text: $boolean)
                    .autocapitalization(.none)
                    .fontWeight(.heavy)
                    .padding()

            }
            .padding()
            .background(Color.black.opacity(boolean == "" ? 0 : 0.12))
            .cornerRadius(15)
            .padding(.horizontal)
            .padding(.bottom)
            Spacer()
            Button(action: {}, label: {
                NavigationLink(destination: Quiz17()){
                    ZStack{
                        Capsule()
                            .foregroundColor(.blue.opacity(0.6))
                            .frame(width:180, height:60)
                        Text("Previous Question")
                            .fontWeight(.heavy)
                            .foregroundColor(.black.opacity(0.6))
                            .padding(.vertical)
                            .frame(width: UIScreen.main.bounds.width - 150)
                            .background(Color("black"))
                    }
                }
            })
            Button(action: {}, label: {
                NavigationLink(destination: Quiz19()){
                    ZStack{
                        Capsule()
                            .foregroundColor(.blue.opacity(0.6))
                            .frame(width:180, height:60)
                        Text("Next Question")
                            .fontWeight(.heavy)
                            .foregroundColor(.black.opacity(0.6))
                            .padding(.vertical)
                            .frame(width: UIScreen.main.bounds.width - 150)
                            .background(Color("black"))
                    }
                }
            })
            Spacer()
        }
    }
}

struct Quiz19: View{
    @State var boolean = ""

    var body: some View{
        VStack{
            Text("Profile")
                .font(.largeTitle)
                .foregroundColor(Color.pink)
                .padding()
            Text("Question 19/19")
                .padding()
            Spacer()
            Text("How academically focused you are?")
                .font(.title)
                .padding()
            
            HStack{
                TextField("Yes, somewhat, or No?", text: $boolean)
                    .autocapitalization(.none)
                    .fontWeight(.heavy)
                    .padding()

            }
            .padding()
            .background(Color.black.opacity(boolean == "" ? 0 : 0.12))
            .cornerRadius(15)
            .padding(.horizontal)
            .padding(.bottom)
            Spacer()
            Button(action: {}, label: {
                NavigationLink(destination: Quiz18()){
                    ZStack{
                        Capsule()
                            .foregroundColor(.blue.opacity(0.6))
                            .frame(width:180, height:60)
                        Text("Previous Question")
                            .fontWeight(.heavy)
                            .foregroundColor(.black.opacity(0.6))
                            .padding(.vertical)
                            .frame(width: UIScreen.main.bounds.width - 150)
                            .background(Color("black"))
                    }
                }
            })
            Spacer()
        }
    }
}

struct Quiz_Previews: PreviewProvider {
    static var previews: some View {
        Quiz1()
    }
}