//
//  ResetPassword.swift
//  Awise
//
//  Created by Harry Chen on 10/23/22.
//

import SwiftUI

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
                        .foregroundColor(/*@START_MENU_TOKEN@*/.white/*@END_MENU_TOKEN@*/)
                }
            }
            Spacer()
        }
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
            
            NavigationLink(destination: forgetPassword()){
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
    }
}
