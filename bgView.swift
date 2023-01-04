//
//  bgView.swift
//  Awise
//
//  Created by Tangyi Qian on 11/20/22.
//

import SwiftUI

struct bgView: View {
    @State var blurR: CGFloat = 0.0
    @State var top1: CGFloat = -200
    @State var top2: CGFloat = -200
    @State var radius1: CGFloat = 700
    @State var radius2: CGFloat = 400
    
    var body: some View {
        VStack{
            Ellipse().frame(width: radius1, height:radius1).padding(.leading,top1).padding(.top,top1).foregroundColor(.cyan).blur(radius: blurR*4)
            Ellipse().frame(width: radius2, height:radius2).padding(.trailing,top2).padding(.top,top2).foregroundColor(.orange).blur(radius: blurR)
        }
    }
}

struct bgView_Previews: PreviewProvider {
    static var previews: some View {
        bgView(blurR: 0, top1:100, top2: -250, radius1:0, radius2:0).previewDevice("iPhone 14 Pro Max")
    }
}


