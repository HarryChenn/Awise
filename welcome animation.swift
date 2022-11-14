//
//  launchscreen.swift
//  Awise
//
//  Created by liu zhenke on 11/8/22.
//

import SwiftUI

extension Comparable {
    func clamp<T: Comparable>(lower: T, _ upper:T) ->T {
        return min(max(self as! T, lower), upper)
    }
}

enum AnimationState{
    case normal
    case compress
    case expand
}
struct Launchscreen_View: View {
    @State var account = ""
    @State var password = ""
    @State private var animationState: AnimationState = .normal
    @State private var done: Bool = false
    func calculate()->Double{
        switch animationState{
        case .normal:
            return 0.2
        case .compress:
            return 0.18
        case .expand:
            return 2
        }
    }
    var body: some View{
        ZStack{
            SwipeView()
            /*VStack{
                Image("logo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200)
                    .padding(.bottom)
                Divider()
            NavigationLink(destination: signInPage()){
                ZStack{
                    Capsule()
                        .foregroundColor(.blue)
                        .frame(width:350, height:60)
                    HStack{
                       
                        Text("Unlock")
                            .font(.title)
                            .foregroundColor(.white)
                            .fontWeight(.medium)
                            .padding(.vertical)
                            .frame(width: UIScreen.main.bounds.width - 150)
                            .clipShape(Capsule())
                    }
                }
            }
            }*/

            VStack{
                Image("logo")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .scaleEffect(calculate())
            }.frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(.white)
                .opacity(done ? 0:1)
        }.onAppear{
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                withAnimation(.spring()){
                    animationState = .compress
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5){
                        withAnimation(.spring()){
                            animationState = .expand

            withAnimation(.interpolatingSpring(mass: 1.0, stiffness: 100.0, damping:10.0, initialVelocity: 0)){
                                        done = true
                                    }
                                }
                            }

                }
            }
        }
    }
}

struct SwipeView: View {
    @State private var showUnlock = false
    @State private var didUnlock = false
    var body: some View{
        ZStack{
            VStack{
                Spacer()
                if showUnlock{
                    SwipeToUnlockView()
                        .onSwipeSuccess {
                            self.didUnlock = true
                            self.showUnlock = false
                        }
                        .transition(AnyTransition.scale.animation(Animation.spring(response: 0.3, dampingFraction: 0.5)))
                }
            }
            .padding(.bottom, 120)
            
            if didUnlock{
                signInPage()
            }
        }
        .edgesIgnoringSafeArea(.all)
        .onAppear(){
            self.showUnlock = true
        }
    }
}

extension CGSize {
    static var inactiveThumbSize: CGSize {
        return CGSize(width: 70, height: 50)
    }
    
    static var activeThumbSize: CGSize {
        return CGSize(width: 150, height: 50)
    }
    
    static var trackSize: CGSize {
        return CGSize(width: 280, height: 50)
    }
}
extension SwipeToUnlockView {
    func onSwipeSuccess(_ action: @escaping() -> Void) -> Self{
        var this = self
        this.actionSuccess = action
        return this
    }
}
struct SwipeToUnlockView: View{
    @State private var thumbSize: CGSize = CGSize.inactiveThumbSize
    @State private var dragOffset: CGSize = .zero
    @State private var isEnough = false
    private var actionSuccess: (() ->Void)?
    let trackSize = CGSize.trackSize
    var body: some View{
        ZStack{
            Capsule()
                .frame(width:trackSize.width, height:trackSize.height)
                .foregroundColor(.gray).opacity(0.5)
            
            Text("Swipe to Unlock")
                .font(.caption)
                .foregroundColor(.white)
                .offset(x:30, y:0)
            
            ZStack{
                Capsule()
                    .frame(width:thumbSize.width, height:thumbSize.height)
                    .foregroundColor(.gray)
                
                Image(systemName: "arrow.right")
                    .foregroundColor(.black)
            }
            .offset(x: getDragOffsetX(), y: 0)
            .gesture(
                DragGesture()
                    .onChanged({value in self.handleDrageChanged(value)})
                    .onEnded({_ in self.handleDrageEnded()})
            )
        }
    }
    private func getDragOffsetX() -> CGFloat {
        let clampedDrafoffsetX = dragOffset.width.clamp(lower: 0 , trackSize.width - thumbSize.width)
        return -( trackSize.width/2 - thumbSize.width/2 - (clampedDrafoffsetX))
    }
    
    private func handleDrageChanged(_ value: DragGesture.Value)->Void{
        self.dragOffset = value.translation
        
        let dragWidth = value.translation.width
        let targetDragWidth = self.trackSize.width - (self.thumbSize.width*2)
        let wasInitiated = dragWidth > 2
        let didReachTarget = dragWidth > targetDragWidth
        
        self.thumbSize = wasInitiated ? CGSize.activeThumbSize : CGSize.inactiveThumbSize
        if didReachTarget {
            self.isEnough = true
        }
        else{
            self.isEnough = false
        }
    }
    
    private func handleDrageEnded() -> Void{
        if self.isEnough {
            self.dragOffset = CGSize(width: self.trackSize.width - self.thumbSize.width, height:  0 )
            if nil != self.actionSuccess{
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.25){
                    self.actionSuccess!()
                }
            }
        }else{
            self.dragOffset = .zero
            self.thumbSize = CGSize.inactiveThumbSize
        }
        
        
        self.dragOffset = .zero
    }
}

struct launchscreen_Previews: PreviewProvider {
     static var previews: some View {
         Launchscreen_View()
         //SwipeView()
    }
}
