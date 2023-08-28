//
//  Demo_StackView.swift
//  SwiftUIDemo
//
//  Created by Yueatian on 2023/7/18.
//

import SwiftUI

struct Demo_StackView: View {
    var body: some View {
        
        VStack(spacing: 10) {
            // 标题
            titleView()
            
            // 定价方案
            HStack {
                ZStack {
                    priceView(titleStr: "连续包月", priceStr: "¥18", perPriceStr: "", cellColor: Color("cell_bg_color"))
                        .overlay(RoundedRectangle(cornerRadius: 6).stroke(Color("cell_border_color"), lineWidth: 2))
                    // 首月优惠
                    discountView()
                }
                
                priceView(titleStr: "1个月", priceStr: "¥30", perPriceStr: "", cellColor: Color("cell_bg_color"))
                    .cornerRadius(10)
                
                priceView(titleStr: "12个月", priceStr: "¥228", perPriceStr: "¥19/月", cellColor: Color("cell_bg_color"))
                    .cornerRadius(10)
            }
            .padding(.horizontal)
            
        }
        
    }
}

struct Demo_StackView_Previews: PreviewProvider {
    static var previews: some View {
        Demo_StackView()
    }
}

struct titleView: View {
    var body: some View {
        HStack {
            // 标题
            VStack(alignment: .leading, spacing: 10) {
                Text("会员套餐")
                    .fontWeight(.bold)
                    .font(.title)
                Text("解锁高级功能")
                    .fontWeight(.bold)
                    .font(.title)
            }
            Spacer()
        }
        .padding()
    }
}

struct priceView: View {
    var titleStr: String
    var priceStr: String
    var perPriceStr: String
    var cellColor: Color
    
    var body: some View {
        VStack {
            Text(titleStr)
                .font(.system(size: 17))
                .fontWeight(.bold)
            .foregroundColor(.gray)
            
            Text(priceStr)
                .font(.system(size: 30))
                .fontWeight(.bold)
                .foregroundColor(.red)
            
            Text(perPriceStr)
                .font(.system(size: 17))
                .fontWeight(.bold)
                .foregroundColor(.gray)
        }
        .frame(minWidth: 0 , maxWidth:  .infinity, minHeight: 90)
        .padding(20)
        .background(Color("cell_bg_color"))
    }
}

struct discountView: View {
    var body: some View {
        Text("首月特惠")
            .font(.system(size: 14))
            .padding(5)
            .fontWeight(.bold)
            .foregroundColor(.white)
            .background(Color("cell_border_color"))
            .cornerRadius(4)
            .offset(x: 0, y: -65)
    }
}

struct pricingView: View {
    var body: some View {
        HStack {
            ZStack {
                
                VStack {
                    Text("连续包月")
                        .font(.system(size: 17))
                        .fontWeight(.bold)
                        .foregroundColor(.gray)
                    
                    Text("¥18")
                        .font(.system(size: 30))
                        .fontWeight(.bold)
                        .foregroundColor(.red)
                }
                // 最小宽度为0，最大宽度为自适应，最小高度为90
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 90)
                .padding(20)
                .background(Color("cell_bg_color"))
                .overlay(
                    /*
                     RoundedRectangle 圆角矩形
                     stroke 描边
                     */
                    RoundedRectangle(cornerRadius: 10).stroke(Color("cell_border_color"), lineWidth: 2)
                )
                
                // 首月特惠
                Text("首月特惠")
                    .font(.system(size: 14))
                    .padding(5)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .background(Color("cell_border_color"))
                    .cornerRadius(4)
                    .offset(x: 0, y: -65)
            }
            
            VStack {
                Text("1个月")
                    .font(.system(size: 17))
                    .fontWeight(.bold)
                    .foregroundColor(.gray)
                
                Text("¥30")
                    .font(.system(size: 30))
                    .fontWeight(.bold)
                    .foregroundColor(.red)
            }
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 90)
            .padding(20)
            .background(Color("cell_bg_color"))
            .cornerRadius(10)
            
            
            VStack {
                Text("12个月")
                    .font(.system(size: 17))
                    .fontWeight(.bold)
                    .foregroundColor(.gray)
                
                Text("¥228")
                    .font(.system(size: 30))
                    .fontWeight(.bold)
                    .foregroundColor(.red)
                
                Text("¥19/月")
                    .font(.system(size: 17))
                    .fontWeight(.bold)
                    .foregroundColor(.gray)
            }
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 90)
            .padding(20)
            .background(Color("cell_bg_color"))
            .cornerRadius(10)
            
            
        }
        .padding(.horizontal)
    }
}


