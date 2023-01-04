//
//  matchresult.swift
//  Awise
//
//  Created by liu zhenke on 11/27/22.
//

//import Foundation
//import SwiftUI
//
//struct Match_Previews: PreviewProvider {
//     static var previews: some View {
//         NavigationView{
//             MatchView()
//         }
//    }
//}
//
//struct BadgeView: View {
//    var title: String
//    var padding: CGFloat
//    var radius: CGFloat
//    var rotation: Double
//    var xOffset: CGFloat
//    var yOffset: CGFloat
//
//    var body: some View {
//        Text(title)
//            .font(.callout)
//            .fontWeight(.bold)
//            .padding(padding)
//            .background(Color(red: 20/255, green: 18/255, blue: 237/255))
//            .foregroundColor(.white)
//            .cornerRadius(radius)
//            .rotationEffect(.degrees(rotation))
//            .offset(x: xOffset, y: yOffset)
//    }
//}
//
//struct CardView2: View {
//    var iconName: String
//    var title: String
//    var description: String
//
//    var body: some View {
//        VStack(spacing: 20) {
//            Image(systemName: iconName)
//                .font(.system(size: 60))
//                .rotation3DEffect(
//                    .degrees(20),
//                    axis: (x: 1.0, y: 0.0, z: -0.5)
//                )
//            VStack(spacing: 10) {
//                Text(title)
//                    .font(.system(.title2, design:.rounded))
//                    .fontWeight(.black)
//                Text(description)
//                    .font(.body)
//                    .fontWeight(.bold)
//                    .lineLimit(2)
//                    .multilineTextAlignment(.center)
//            }
//        }
//        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 200, maxHeight: 200)
//        .padding(10)
//       // .background(Color(red: 200/255, green: 200/255, blue: 230/255))
//        .background(Color.blue)
//        .cornerRadius(20)
//    }
//}
//
//struct MatchView: View {
//    var body: some View {
//        ZStack{
//            VStack {
//                HeaderView()
//                HStack {
//                    CardView2(
//                        iconName: "character.book.closed.fill",
//                        title: "Roommate",
//                        description: "Meet potentail Roommate"
//                    )
//                    
//                    CardView2(
//                        iconName: "music.quarternote.3",
//                        title: "Detailed Result",
//                        description: "See detailed match result"
//                    )
//                }.padding(.horizontal)
//                
//                ZStack {
//                    CardView2(
//                        iconName: "laptopcomputer.and.iphone",
//                        title: "Match Score",
//                        description: "See the Match Grading"
//                    )
//                }.padding(.horizontal)
//                Spacer()
//                
//            }
//            HStack{
//                GeometryReader { geometry in
//                    VStack {
//                        Spacer()
//                        HStack {
//                            NavigationLink(destination: ProfileView()){
//                                VStack {
//                                    Image(systemName: "person.crop.circle")
//                                        .resizable()
//                                        .aspectRatio(contentMode: .fit)
//                                        .frame(width: geometry.size.width/5, height: geometry.size.height/28)
//                                        .padding(.top, 10)
//                                    Text("Profile")
//                                        .font(.footnote)
//                                    Spacer()
//                                }
//                            }.accentColor(Color(.black))
//                            NavigationLink(destination: QuizScrollselection()){
//                                VStack {
//                                    Image(systemName: "doc.richtext")
//                                        .resizable()
//                                        .aspectRatio(contentMode: .fit)
//                                        .frame(width: geometry.size.width/5, height: geometry.size.height/28)
//                                        .padding(.top, 10)
//                                    Text("Quiz")
//                                        .font(.footnote)
//                                    Spacer()
//                                }
//                            }.accentColor(Color(.black))
//                            NavigationLink(destination: HomeView()){
//                                ZStack {
//                                    
//                                    Circle()
//                                        .foregroundColor(.white)
//                                        .frame(width: geometry.size.width/7, height: geometry.size.width/7)
//                                        .shadow(radius: 4)
//                                    Image(systemName: "homekit")
//                                        .resizable()
//                                        .aspectRatio(contentMode: .fit)
//                                        .frame(width: geometry.size.width/7-6 , height: geometry.size.width/7-6)
//                                        .foregroundColor(Color.pink)
//                                }
//                            }
//                            .offset(y: -geometry.size.height/8/2)
//                            NavigationLink(destination: SettingView()){
//                                VStack {
//                                    Image(systemName: "highlighter")
//                                        .resizable()
//                                        .aspectRatio(contentMode: .fit)
//                                        .frame(width: geometry.size.width/5, height: geometry.size.height/28)
//                                        .padding(.top, 10)
//                                    
//                                    Text("Setting")
//                                        .font(.footnote)
//                                    Spacer()
//                                }
//                            }.accentColor(Color(.black))
//                            NavigationLink(destination: signInPage()){
//                                VStack {
//                                    Image(systemName: "figure.walk.circle")
//                                        .resizable()
//                                        .aspectRatio(contentMode: .fit)
//                                        .frame(width: geometry.size.width/5, height: geometry.size.height/28)
//                                        .padding(.top, 10)
//                                    
//                                    Text("Log Out")
//                                        .font(.footnote)
//                                    Spacer()
//                                }
//                            }.accentColor(Color(.black))
//                        }
//                        .frame(width: geometry.size.width, height: geometry.size.height/8)
//                    }
//                }         .edgesIgnoringSafeArea(.bottom)
//                
//            }
//            .padding(.horizontal)
//        }.navigationBarHidden(true)
//        
//    }
//}
//
//struct HeaderView: View {
//    var body: some View {
//        HStack {
//            VStack(alignment: .leading, spacing: 5){
//                Text("Match Result")
//                    .font(.system(.largeTitle, design:.rounded))
//                    .fontWeight(.black)
//                Text("See potential roommate")
//                    .font(.title2)
//            }
//            Spacer()
//        }
//    }
//}
