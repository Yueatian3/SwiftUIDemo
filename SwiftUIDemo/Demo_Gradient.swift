//
//  Demo_Gradient.swift
//  SwiftUIDemo
//
//  Created by Yueatian on 2023/7/19.
//

import SwiftUI

struct Demo_Gradient: View {
    var body: some View {
        
        ScrollView {
            VStack(spacing: 50) {
                
                Circle() // 线性渐变
                    .foregroundStyle(
                        LinearGradient(gradient: Gradient(colors: [.blue, .green]), startPoint: .leading, endPoint: .trailing)
                    ).frame(width: 200, height: 200)
                    .padding()
                
                
                Circle()
                    .foregroundStyle( // 中心渐变
                        RadialGradient(gradient: Gradient(colors: [.red, .yellow, .green, .blue, .purple]), center: .center, startRadius: 0, endRadius: 100)
                    ).frame(width: 200 ,height: 200)
                    .padding()
                
                Circle()
                    .foregroundStyle( // 圆锥渐变
                        AngularGradient(gradient: Gradient(colors: [.red, .yellow, .green, .blue, .purple, .red]), center: .center)
                    )
                    .frame(width: 200, height: 200)
                    .padding()
                
                Circle()
                    .strokeBorder( // 边框渐变
                        AngularGradient.init(gradient: Gradient(colors: [.red, .yellow, .green, .blue, .purple, .red]), center: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, startAngle: .zero, endAngle: .degrees(360)),
                        lineWidth: 25
                    )
                    .frame(width: 200, height: 200)
                
                
                Button {
                    
                } label: {
                    Text("Log In")
                }
                .buttonStyle(GradientBackgroundStyle())
                
            }
        }
    }
}

struct GradientBackgroundStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(minWidth: 0, maxWidth: .infinity)
            .font(.system(size: 25))
            .fontWeight(.bold)
            .padding()
            .background(LinearGradient(gradient: Gradient(colors: [Color("gradient_color_1"), Color("gradient_color_2")]), startPoint: .leading, endPoint: .trailing))
            .foregroundColor(.white)
            .cornerRadius(10)
            .padding(.horizontal, 20)
    }
}

struct Demo_Gradient_Previews: PreviewProvider {
    static var previews: some View {
        Demo_Gradient()
    }
}
