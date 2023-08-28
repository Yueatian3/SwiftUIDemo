//
//  Demo_Text.swift
//  SwiftUIDemo
//
//  Created by Yueatian on 2023/8/28.
//

import SwiftUI

struct Demo_Text: View {
    var body: some View {
        
        VStack {
            //MARK: - 基础使用
            Text("Text Learn 用法_记录Text Learn 用法_记录Text Learn 用法_记录Text Learn 用法_记录")
                .font(.system(size: 20, weight: .bold, design: .serif))
            /**
             .fontWeight(.bold) // 字重
             .font(.title) // 字体大小
             .fontDesign(.monospaced)  // 字体样式
             
             /*
              Font.Design
              
              .default: 默认
              .monospaced: 字体等宽
              .rounded: 圆角字体
              .serif: 衬线字体
              */
             
             /*
              Font
              
              .body: 正文文本样式
              .callout: 标注文本样式
              .caption: 标题文本样式
              .caption2: 备用标题文本样式
              .footnote: 脚注文本样式
              .headline: 标题文本样式
              .largeTitle: 大标题文本样式
              .subheadline: 副标题文本样式
              .title: 标题文本样式
              .title2: 二级分层标题样式
              .title3: 三级分层标题样式
              */
             */
                .italic()  // 斜体
                .baselineOffset(20)  // 基线偏移
                .kerning(50)  //两个字符之间的间距或字距
                .underline(true, color: .red) //文本应用下划线
                .strikethrough(true, color: .yellow) //文本应用删除线
                .tracking(5) //字间距
                .foregroundColor(.blue) // 字体颜色
                .background(Color.green) // 背景颜色
                .multilineTextAlignment(.center) //文字对齐方式
                .lineLimit(2) // 限制文字行数
                .lineSpacing(20) //设置行间距
                .truncationMode(.tail) // 截断模式
                .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)) // 限制内边距
                        .shadow(color: .red, radius: 2, x: 10, y: 10) // 设置文字阴影
                .rotationEffect(.degrees(30)) //2D旋转文字
                .rotation3DEffect(.degrees(30), axis: (x: 1.0, y: 0.0, z: 0.0)) //3D旋转文字
                .padding()
            /**
             tracking 与 kerning 的区别与联系:
             联系：两者都增加字母之间的间距
             区别：tracking 会拉开连字格式, kerning 不会；kerning 会留下一些尾随空白, tracking 不会。
             两属性同时设置时，采用tracking，忽略kerning
             */
            
            //MARK: - 使用AttributedString给Text添加样式
            var message1: AttributedString {
                let string = "使用AttributedString"
                var result = AttributedString()
                for (index, letter) in string.enumerated() { //将单个字符上下偏移
                    var letterString = AttributedString(String(letter))
                    letterString.baselineOffset = sin(Double(index)) * 5
                    result += letterString
                }
                result.font = .largeTitle
                result.foregroundColor = .white
                result.backgroundColor = .red
                return result
            }
            
            var message2: AttributedString {
                var result = AttributedString("给Text添加样式")
                result.font = .title
                result.foregroundColor = .yellow
                result.backgroundColor = .gray
                result.link = URL(string: "https://www.baidu.com/index.htm")
                return result
            }
            
            Text(message1 + message2)
                .padding(EdgeInsets(top: 10, leading: 0, bottom: 0, trailing: 0))
                .background( // 设置背景渐变颜色
                    LinearGradient(gradient: Gradient(colors: [Color.red, .green, Color.blue]), startPoint: .leading, endPoint: .trailing)
                )
            
            /*
             使用AttributedString修饰自定义字符串时，Text.background()修饰符不起作用
             */
            
        }
    }
}

struct Demo_Text_Previews: PreviewProvider {
    static var previews: some View {
        Demo_Text()
    }
}
