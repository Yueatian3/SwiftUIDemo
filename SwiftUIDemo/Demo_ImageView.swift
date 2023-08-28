//
//  Demo_ImageView.swift
//  SwiftUIDemo
//
//  Created by Yueatian on 2023/7/18.
//

import SwiftUI

struct Demo_ImageView: View {
    var body: some View {
        VStack {
            Image("demo_img_1")
                .resizable() // 拉伸缩放
                .edgesIgnoringSafeArea(.all) // 忽略安全区域
                .scaledToFit() // 等比例缩放, 等同于 .aspectRatio(contentMode: .fit)
                .clipShape(Circle()) // 裁剪形状
            /**
             Rectangle()  矩形
             Circle()  圆形
             RoundedRectangle(cornerRadius: 25.0)  圆角矩形
             Capsule()  椭圆形
             */
                .opacity(0.7) // 透明度
                .frame(width: 350)
                .overlay( // 覆盖
                    Text("编辑")
                        .foregroundColor(.white)
                        .font(.system(size: 30))
                        .fontWeight(.bold)
                        .tracking(15)
                        .multilineTextAlignment(.center)
                )
                .padding(20)
            
            Image(systemName: "pencil.tip.crop.circle.badge.plus")
                .foregroundStyle(.blue, .black)
                .font(.system(size: 100))
            
//              .renderingMode(.template)
            /*
             TemplateRenderingMode
             
             .template: 按原样渲染位图图像像素的模式
             .original: 将所有非透明像素渲染为前景色的模式
             */

                .symbolRenderingMode(.palette)
            /*
             SymbolRenderingMode
             
             .hierarchical: 将符号渲染为多层的模式，并对前景样式应用不同的不透明度
             .monochrome: 将符号渲染为填充前景样式的单层的模式
             .multicolor: 将符号渲染为多个图层并继承其样式的模式
             .palette: 将符号渲染为多个图层的模式，并对图层应用不同的样式,可以使用.foregroundStyle(_, _)分别自定义样式
             */
        }
    }
}

struct Demo_ImageView_Previews: PreviewProvider {
    static var previews: some View {
        Demo_ImageView()
    }
}
