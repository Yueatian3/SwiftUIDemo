//
//  Demo_ScrollView.swift
//  SwiftUIDemo
//
//  Created by Yueatian on 2023/7/18.
//

import SwiftUI

struct Demo_ScrollView: View {
    var body: some View {
        ScrollView{
            VStack {
                cardView(imageStr: "demo_img_1", titleStr: "你的能力是否能在全世界通用，如果不能,那么需求重新评估你的能力。")
                
                cardView(imageStr: "demo_img_2", titleStr: "当你判断你的想法是正确的，那么就在今天完成吧。")
                
                cardView(imageStr: "demo_img_3", titleStr: "将自身所学回馈社会，，不也是一件幸福的事么。")
            }
        }
    }

}

struct Demo_ScrollView_Previews: PreviewProvider {
    static var previews: some View {
        Demo_ScrollView()
    }
}

struct cardView: View {
    var imageStr: String
    var titleStr: String
    var body: some View {
        VStack {
            Image(imageStr)
                .resizable()
                .aspectRatio(contentMode: .fit)
            
            Text(titleStr)
                .font(.system(size: 17))
                .fontWeight(.bold)
                .foregroundColor(.black)
                .padding()
        }
        .cornerRadius(10)
        .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color("cell_bg_color"),lineWidth: 1))
        .padding([.top, .horizontal])
    }
}
