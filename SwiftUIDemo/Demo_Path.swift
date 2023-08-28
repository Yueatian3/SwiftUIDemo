//
//  Demo_Path.swift
//  SwiftUIDemo
//
//  Created by Yueatian on 2023/7/19.
//

import SwiftUI

struct Demo_Path: View {
    var body: some View {
        
        ScrollView {
            VStack {
                // 矩形
                Path { path in
                    path.move(to: CGPoint(x: 50, y: 50))
                    path.addLine(to: CGPoint(x: 50, y: 150))
                    path.addLine(to: CGPoint(x: 200, y: 150))
                    path.addLine(to: CGPoint(x: 200, y: 50))
                    path.closeSubpath()
                }
                .fill(.green)
                
                // 边框
                Path { path in
                    path.move(to: CGPoint(x: 50, y: 200))
                    path.addLine(to: CGPoint(x: 50, y: 300))
                    path.addLine(to: CGPoint(x: 200, y: 300))
                    path.addLine(to: CGPoint(x: 200, y: 200))
                    path.closeSubpath()
                }
                .stroke(.blue, lineWidth: 5)
                
                // 圆弧
                Path { path in
                    path.move(to: CGPoint(x: 50, y: 440))
                    path.addLine(to: CGPoint(x: 65, y: 440))
                    path.addQuadCurve(to: CGPoint(x: 335, y: 440), control: CGPoint(x: 200, y: 400))
                    path.addLine(to: CGPoint(x: 350, y: 440))
                    path.addLine(to: CGPoint(x: 350, y: 500))
                    path.addLine(to: CGPoint(x: 50, y: 500))
                    path.closeSubpath()
                }
                .stroke(.blue, lineWidth: 2)
                
                // 半圆弧
                Path { path in
                    path.move(to: CGPoint(x: 200, y: 600))
                    path.addArc(center: CGPoint(x: 200, y: 600), radius: 100, startAngle: Angle(degrees: 0), endAngle: Angle(degrees: 90), clockwise: true)
                    /*
                     addArc 绘制圆弧
                     center 圆弧中心点
                     radius 圆弧半径
                     startAngle 开始角度
                     endAngle 结束角度
                     clockwise 是否为顺时针
                     */
                }
                .fill(.green)
                
                
            }
        }
    }
}

struct Demo_Path_Previews: PreviewProvider {
    static var previews: some View {
        Demo_Path()
    }
}
