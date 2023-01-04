//
//  ContentView.swift
//  Awise
//
//  Created by liu zhenke, harry Chen on 10/2/22.
//

import SwiftUI
import LocalAuthentication



struct ContentView: View {
    var body: some View {
       NavigationView{
            //signInPage()
           Launchscreen_View()
        }
    }
}





class QuizAnswers: ObservableObject {
    @Published var user_id = 0
    @Published var name = ""
    @Published var email = ""
    @Published var password = ""
    @Published var gender = 0
    @Published var profile_picture = 0
    @Published var year = 0
    @Published var rent = 0
    @Published var move_in_date = 0
    @Published var num_of_rooms = 0
    @Published var location = ""
    @Published var getup_time = 0
    @Published var getup_time_w = 1
    @Published var bed_time = 0
    @Published var bed_time_w = 1
    @Published var social = 0
    @Published var social_w = 1
    @Published var academic = 0
    @Published var academic_w = 1
    @Published var bring_people = 0
    @Published var bring_people_w = 1
    @Published var animal = 0
    @Published var animal_w = 1
    @Published var instrument = 0
    @Published var instrument_w = 1
    @Published var cleaning = 0
    @Published var cleaning_w = 1
    @Published var cook = 0
    @Published var cook_w = 1
    @Published var sharing = 0
    @Published var sharing_w = 1
    @Published var smoke = 0
    @Published var smoke_w = 1
    @Published var alcohol = 0
    @Published var alcohol_w = 0
}

// SignIn Page

extension String {
    func matches(_ regex: String) -> Bool {
        return self.range(of: regex, options: .regularExpression, range: nil, locale: nil) != nil
    }
}

struct Getuid: Codable {
    var user_id: Int
}



struct signInPage: View {
    @State var account = ""
    @State var password = ""
    @State private var end_with_emory = false
    @State private var showingAlert = false
    
    var body: some View {
        VStack{
            Image("logo with name")
                .resizable()
                .frame(width:180, height:180)
                .padding(/*@START_MENU_TOKEN@*/[.top, .leading, .trailing]/*@END_MENU_TOKEN@*/)

            Text("Awise Roommate")
                .font(.title)
                .fontWeight(.heavy)
                .padding([.leading, .bottom, .trailing])
            Text("Please log in to continue")
                .foregroundColor(Color.blue.opacity(0.5))
                .fontWeight(.heavy)
                .padding()
                .padding(/*@START_MENU_TOKEN@*/[.top, .leading, .trailing]/*@END_MENU_TOKEN@*/)
            VStack{
                GroupBox{
                    HStack{
                        //account
                        Image(systemName: "person.fill")
                            .font(.title2)
                            .frame(width: 35)
                        
                        TextField("Account", text: $account)
                            .autocapitalization(.none)
                        
                        
                    }
                }
                .background(Color.black.opacity(account == "" ? 0 : 0.12))
                .cornerRadius(15)
                .frame(width:abs(UIScreen.main.bounds.width-40.0), height: abs(UIScreen.main.bounds.height*0.05))
            }.padding(.bottom)
            VStack{
                GroupBox{
                    HStack{
                        //password
                        Image(systemName: "lock.fill")
                            .font(.title2)
                            .frame(width: 35)
                        SecureField("Password", text: $password)
                        
                            .autocapitalization(.none)
                        
                    }
                }
                .background(Color.black.opacity(password == "" ? 0 : 0.12))
                .cornerRadius(15)
                //.padding(/*@START_MENU_TOKEN@*/[.top, .leading, .trailing]/*@END_MENU_TOKEN@*/)
                .frame(width:abs(UIScreen.main.bounds.width-40.0), height: abs(UIScreen.main.bounds.height*0.05))
            }
            HStack{
                Spacer()
                NavigationLink(destination: forgetPassword()){
                    Text("Forget your password?")
                        .underline()
                        .fontWeight(.semibold)
                        .padding(.vertical)
                        .frame(width: UIScreen.main.bounds.width - 200.0)
                }
            }
            .frame(width:abs(UIScreen.main.bounds.width-80.0), height: abs(UIScreen.main.bounds.height*0.05))
            .padding(.bottom, abs(UIScreen.main.bounds.height*0.05))
            NavigationLink(destination: HomeView()
                .onAppear{
                    /*
                    login(email:account, password: password)
                    print("uid: " + String(uid))
                    fetchBasic(email: account)
                     */
                    login_and_fetchBasic(email:account, password: password)
                }){
                ZStack{
                    HStack{
                        ZStack{
                            Capsule()
                                .foregroundColor(.blue)
                                .frame(width:abs(UIScreen.main.bounds.width-30), height: abs(UIScreen.main.bounds.height*0.07))
                            
                            
                            // HStack{
                            Image(systemName: "envelope.fill")
                                .resizable()
                                .foregroundColor(.white)
                                .frame(width: 40, height: 30)
                                .padding(.trailing, UIScreen.main.bounds.width-100)
                            
                            Text("Log in")
                                .font(.title)
                                .foregroundColor(.white)
                                .fontWeight(.medium)
                                .padding(.vertical)
                                .frame(width: UIScreen.main.bounds.width - 80.0)
                                .clipShape(Capsule())
                            //}
                        }
                    }
                }
            }
            .opacity(account != "" && password != "" ? 1 : 1)
             .disabled(account != "" && password != "" ? false : true)
             .disabled(!account.matches("emory.edu$"))
        
            .padding([.leading, .trailing])
            Divider()
            NavigationLink(destination: SignUpPage()){
                ZStack{
                    HStack{
                        ZStack{
                            Capsule()
                                .foregroundColor(.blue)
                                .frame(width:abs(UIScreen.main.bounds.width-30), height: abs(UIScreen.main.bounds.height*0.07))
                           // HStack{
                                Image(systemName: "person.crop.rectangle.stack.fill")
                                    .resizable()
                                    .foregroundColor(.white)
                                    .frame(width: 40, height: 30)
                                    .padding(.trailing, UIScreen.main.bounds.width-100)
                                
                                
                                Text("Register")
                                    .font(.title)
                                    .foregroundColor(.white)
                                    .fontWeight(.medium)
                                    .padding(.vertical)
                                    .frame(width: UIScreen.main.bounds.width - 80)
                                    .clipShape(Capsule())
                            
                        }
                    }
                }
            }
            .padding(.bottom, abs(UIScreen.main.bounds.height-900))
           // .padding([.leading, .bottom, .trailing])
        }
        .navigationBarBackButtonHidden(true)
        .toolbar{
            ToolbarItemGroup(placement:.navigationBarTrailing){
                Image("Awise Image Header")
                    .resizable()
                    .scaledToFit()
                    .frame(width:80.0, height: 35)
            }
        }
        
    }
    
    private func error() -> Void {
        if (!account.matches("emory.edu$")) {
            self.showingAlert = true
        }
    }
    
    
}

func fetchBasic(email: String){
    let urlString = "https://awise.herokuapp.com/api/survey/retrieve-user-id/\(email)"
    guard let url = URL(string: urlString) else {
          return
      }
    var request = URLRequest(url: url)

    // Make the request
    URLSession.shared.dataTask(with: request) { data, response, error in
                if let data = data {
                    
                    /*
                    do {try JSONDecoder().decode(Getuid.self, from: data)}
                    catch {
                        print(error)
                        print(uid)
                    }
                     */
                    
                   
                        print(response)
                        if let response = try? JSONDecoder().decode(Getuid.self, from: data) {
                            
                    
                            uid = response.user_id
                            print("this is uid at login")
                            print(uid)
                            return
                        } else {
                            print("Decoding error occurs...")
                        }
                    
                }
        
    }.resume()
      
}

func login_and_fetchBasic(email:String, password:String){
    login(email:email, password:password)
    print("uid at login_and_fetchBasic(): " + String(uid))
    fetchBasic(email: email)
    
    
}

//Sign Up Page
struct SignUpPage: View {
    @State var account = ""
    @State var password = ""
    @State var confirmpassword = ""
    @StateObject var ans = QuizAnswers()
    var body: some View {
        VStack(alignment: .leading){
            
            Spacer()
            
            Text("Join Awise")
                .font(.title)
                .fontWeight(.bold)
                .padding([.leading, .bottom])
            
            Text("Enter your email and password")
                .font(.subheadline)
                .fontWeight(.medium)
                .multilineTextAlignment(.leading)
                .padding(.leading)
            GroupBox{
                HStack{
                    Image(systemName: "person.fill")
                        .font(.title2)
                        .foregroundColor(.black)
                        .frame(width: 35)
                    
                    
                    TextField("please enter you account", text: $account)
                        .autocapitalization(.none)
                       
                    
                }
            }
            .background(Color.black.opacity(account == "" ? 0 : 0.12))
            .cornerRadius(15)
            .padding()
            
            GroupBox{
                HStack{
                    Image(systemName: "lock.fill")
                        .font(.title2)
                        .foregroundColor(.black)
                        .frame(width: 35)
                    SecureField("please enter you password", text: $password)
                        .autocapitalization(.none)
                       
                }
            }
            .background(Color.black.opacity(account == "" ? 0 : 0.12))
            .cornerRadius(15)
            .padding()
            
            GroupBox{
                HStack{
                    Image(systemName: "lock.rectangle.on.rectangle.fill")
                        .font(.title2)
                        .foregroundColor(.black)
                        .frame(width: 35)
                    SecureField("confirm you password", text: $confirmpassword)
                        .autocapitalization(.none)
                        
                }
            }
            .background(Color.black.opacity(password == "" ? 0 : 0.12))
            .cornerRadius(15)
            .padding()
        
            Divider()
            
            HStack{
                Spacer()
                NavigationLink(destination: signInPage()){
                    Text("Already a member?")
                        .underline()
                        .fontWeight(.semibold)
                        //.foregroundColor(.black)
                        .padding(.vertical)
                        .frame(width: UIScreen.main.bounds.width - 150)
                        //.background(Color("black"))
                }
            }
            
            HStack{
                NavigationLink(destination: Quiz1()
                    .environmentObject(ans)
                    .onAppear{
                        // register(emailipt:account, password: password)
                        ans.user_id = Int.random(in: 550..<100000)
                        register_and_init(account:account, password:password, uid2:ans.user_id)
                        
                        
                        
                    }){
                    
                    ZStack{
                        Capsule()
                            .foregroundColor(.blue)
                            .frame(width:350, height:60)
                        Text("Continue")
                            .font(.title)
                            .foregroundColor(.white)
                            .fontWeight(.medium)
                            .padding(.vertical)
                            .frame(width: UIScreen.main.bounds.width - 150)
                            .clipShape(Capsule())
                    }
                }
            }.disabled(account != "" && password != "" ? false : true)
            .padding([.leading, .bottom, .trailing])
            .disabled(!account.matches("emory.edu$"))
             .disabled(password != confirmpassword)

            
            Spacer()
        }
        .navigationBarBackButtonHidden(true)
        .toolbar{
            ToolbarItemGroup(placement:.navigationBarTrailing){
                Image("Awise Image Header")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 90, height: 90)
            }
        }
    }

}

                
struct forgetPassword: View{
    
    @State var username: String = ""
    
    var body: some View{
        VStack(alignment: .leading) {
                        
            Spacer()
                        
            Text("Reset your password")
                .font(.title)
                .fontWeight(.bold)
                .padding(.bottom)
                        
            Text("Please enter the email address associated with your account. We’ll send you an email with instructions on how to reset your password.")
                .font(.subheadline)
                .fontWeight(.medium)
                .multilineTextAlignment(.leading)

            Spacer()
                        
            Text("Email")
                .fontWeight(.semibold)
                .foregroundColor(Color.black)
                .font(.headline)
                .padding(.bottom)
                        
            GroupBox() {
                TextField("Enter your email address", text: $username)
            }
            .padding(.bottom)
                        
            //send email to 'username' email address
            NavigationLink(destination: Verification(email: $username)){
                ZStack{
                    Capsule()
                        .foregroundColor(.blue)
                        .frame(width: 150, height: 50)
                    Text("Send Email")
                        .font(.headline)
                        .fontWeight(.semibold)
                        .foregroundColor(/*@START_MENU_TOKEN@*/.white/*@END_MENU_TOKEN@*/)
                }
            }
                .disabled(!username.matches("emory.edu$"))
            NavigationLink(destination: signInPage()){
                ZStack{
                    Capsule()
                        .foregroundColor(.blue)
                        .frame(width: 150, height: 50)
                    Text("Back")
                        .font(.headline)
                        .fontWeight(.semibold)
                        .foregroundColor(/*@START_MENU_TOKEN@*/.white/*@END_MENU_TOKEN@*/)
                }
            }
            Spacer()
        }.navigationBarBackButtonHidden()
        .toolbar{
            ToolbarItemGroup(placement:.navigationBarTrailing){
                Image("Awise Image Header")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 90, height: 90)
            }
        }
        .padding()
    }
}

struct CodeView: View{
    var code: String
    var body: some View{
        VStack(spacing: 10){
            Text(code)
                .foregroundColor(.black)
                .fontWeight(.bold)
                .font(.title2)
                .frame(height:45)
            Capsule()
                .fill(Color.gray.opacity(0.5))
                .frame(height:4)
        }
    }
}

struct Verification: View{
    
    @Binding var email: String
    @ObservedObject var loginData = LoginViewMode()
    @Environment(\.presentationMode) var present
    var body: some View{
        VStack(alignment: .leading){
            
            Spacer()
            
            Text("Check your email")
                .font(.title)
                .fontWeight(.bold)
                .padding(.bottom)
            
            Text("Verification code to your email address:")
                .font(.subheadline)
                .fontWeight(.medium)
                .foregroundColor(Color.gray)
                .multilineTextAlignment(.leading)
                .padding(.bottom)
                
            
            Text(email)
                .font(.subheadline)
                .fontWeight(.medium)
                .multilineTextAlignment(.leading)
                .padding(.bottom)
            Spacer()
            
            HStack(spacing:15){
                ForEach(0..<6, id: \.self){index in
                    //displaying code
                    CodeView(code:getCodeAtIndex(index: index))
                }
            }
            .padding(.bottom, 50.0)
            
            Spacer(minLength: 0)
            
            HStack(spacing: 6){
                Text("Didn't receive code?")
                    .foregroundColor(.gray)
                Button(action: {}) {
                    Text("Request Again")
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                }
            }
            .padding()
            NavigationLink(destination: ResetPassword()) {
                ZStack{
                    Capsule()
                        .foregroundColor(.blue)
                        .frame(width: 150, height: 50)
                    Text("Verify")
                        .font(.headline)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                }
            }
            CustomNumberPad(value: $loginData.code, isVerify: true)
        }
        .toolbar{
                ToolbarItemGroup(placement:.navigationBarTrailing){
                    Image("Awise Image Header")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 90, height: 90)
                }
            }
            .cornerRadius(20)
            .padding()
    }
    
    func getCodeAtIndex(index: Int) -> String{
        if loginData.code.count > index{
            let start = loginData.code.startIndex
            let current = loginData.code.index(start, offsetBy: index)
            return String(loginData.code[current])
        }
        return ""
    }
}

struct ResetPassword: View {
    @State var password: String = ""
    @State var password2: String = ""
    var body: some View{
        VStack(alignment: .leading) {
            Spacer()
            Text("Reset your password")
                .font(.title)
                .fontWeight(.bold)
                .padding(.bottom)
            Spacer()
            Text("Enter your new password")
                .font(.subheadline)
                .fontWeight(.medium)
                .multilineTextAlignment(.leading)

            GroupBox() {
                TextField("Enter your new password", text: $password)
            }
            .padding(.bottom)
            
            Text("Re-enter your new password")
                .font(.subheadline)
                .fontWeight(.medium)
                .multilineTextAlignment(.leading)

            GroupBox() {
                TextField("Enter your new password", text: $password2)
            }
            .padding(.bottom)
                        
            NavigationLink(destination: PasswordSuccess()){
                ZStack{
                    Capsule()
                        .foregroundColor(.blue)
                        .frame(width: 150, height: 50)
                    Text("Set Password")
                        .font(.headline)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                }
            }
            .disabled(password == password2 && password != "" && password2 != "" ? false : true)
            Spacer()
        }
        .navigationBarBackButtonHidden(true)
        .toolbar{
            ToolbarItemGroup(placement:.navigationBarTrailing){
                Image("Awise Image Header")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 90, height: 90)
            }
        }
        .padding()
    }
}

struct PasswordSuccess: View {
    var body: some View{
        VStack(alignment: .leading) {
            Spacer()
                        
            Text("Your Password is Successfully Setup")
                .font(.title)
                .fontWeight(.bold)
                .padding(.bottom)
            
            NavigationLink(destination: signInPage()){
                ZStack{
                    Capsule()
                        .foregroundColor(.blue)
                        .frame(width: 250, height: 50)
                    Text("Back to Sign in Page")
                        .font(.headline)
                        .fontWeight(.semibold)
                        .foregroundColor(/*@START_MENU_TOKEN@*/.white/*@END_MENU_TOKEN@*/)
                }
            }
            
            Spacer()
        }
        .navigationBarBackButtonHidden(true)
    }
}

/*struct CardView: View{
    @State var card: Card
    let cardGradient = Gradient(colors: [Color.black.opacity(0), Color.black.opacity(0.5)])
    var body: some View{
        ZStack(alignment: .leading){
            Image(card.imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width:400)
            LinearGradient(gradient: cardGradient,startPoint: .top, endPoint: .bottom)
            VStack{
                
            }
            .padding()
            VStack{
                Spacer()
                VStack(alignment: .leading){
                    HStack{
                        Text(card.name).font(.largeTitle).fontWeight(.bold)
                        //Text(card.bio)
                    }
                   // Text(card.imageName)
                }
            }
            .padding()
            .foregroundColor(.white)
        }
        .cornerRadius(8)
        .offset(x: card.x, y:card.y)
        .rotationEffect(.init(degrees: card.degree))
        .gesture(
            DragGesture()
            
                .onChanged{value in
                    withAnimation(.default){
                        card.x = value.translation.width
                        card.y = value.translation.height
                        card.degree = 7*(value.translation.width > 0 ? 1: -1)
                    }
                }
                .onEnded{
                    value in
                    withAnimation(.interpolatingSpring(mass: 1.0, stiffness: 50,damping: 8,
                                                       initialVelocity:0)){
                        switch value.translation.width{
                        case 0...100:
                            card.x = 0; card.degree = 0; card.y = 0
                        case let x where x>100:
                            card.x = 500; card.degree = 12
                        case (-100)...(-1):
                            card.x = 0; card.degree = 0; card.y = 0
                        case let x where x < -100:
                            card.x = -500; card.degree = -12
                        default: card.x = 0; card.y = 0
                        }
                    }
                }
        )
    }
}*
struct HomePageView: View {
    @State var isShowing = false
    @State var dark = false
    var body: some View{
        //NavigationView{
            ZStack(){
                if isShowing{
                    SideMenuHeaderView(dark: self.$dark, isShowing: self.$isShowing)
                        .preferredColorScheme(self.dark ? .dark : .light)
                }
                HomeView()
                    .cornerRadius(isShowing ? 20 : 10)
                    .offset(x:isShowing ? 300 : 0, y:isShowing ? 44:0)
                    .scaleEffect(isShowing ? 0.8 : 1)
                    .toolbar{
                        ToolbarItemGroup(placement:.navigationBarTrailing){
                            Button(action:{
                                withAnimation(.spring()){
                                    isShowing.toggle()
                                }
                            },
                                           label:{
                                Image(systemName: "line.3.horizontal")
                                    .foregroundColor(.black)
                                    .padding(.trailing)
                                    .frame(width: 10.0, height: 10.0)
                                           })
                        }
                    }
                    .navigationTitle("Home Page")
                    .navigationBarHidden(true)
            }
    }
}*/

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
