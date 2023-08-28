//
//  Demo_Button.swift
//  SwiftUIDemo
//
//  Created by Yueatian on 2023/7/18.
//

import SwiftUI

struct Demo_Button: View {
    var body: some View {
        
        VStack(alignment: .center, spacing: 60) {
//            Spacer()
            
            VStack(alignment: .center, spacing: 20) {
                buttonView(titleStr: "Google登录", bgColoe: Color("login_google_bg_color"), titleColor: .white)
                
                buttonView(titleStr: "Apple登录", bgColoe: Color("login_apple_bg_color"), titleColor: .white)
            }
            
            HStack(spacing: 40) {
                iconButtonView(imgStr: "login_QQ")
                
                iconButtonView(imgStr: "login_Wechat")
                
                iconButtonView(imgStr: "login_Weibo")
            }
            
            Button {
                
            } label: {
                HStack {
                    
                    Image(systemName: "apple.logo")
                        .font(.title)
                    
                    Text("Apple登录")
                        .font(.title)
                        .fontWeight(.semibold)
                        .tracking(1)
                }
                .padding()
                .foregroundColor(.white)
                .frame(minWidth: 0, maxWidth: .infinity)
                .background(Color.black)
                .cornerRadius(10)
                .padding(.horizontal, 20)
            }
            
        }
    }
}

struct Demo_Button_Previews: PreviewProvider {
    static var previews: some View {
        Demo_Button()
    }
}

struct buttonView: View {
    var titleStr: String
    var bgColoe: Color
    var titleColor: Color
    
    var body: some View {
        Button {
            print("点击BUtton")
        } label: {
            Text(titleStr)
                .font(.system(size: 25))
                .frame(minWidth: 0, maxWidth: .infinity)
                .padding()
                .foregroundColor(titleColor)
                .background(bgColoe)
                .cornerRadius(5)
                .padding(.horizontal, 20)
                .tracking(1)
        }
    }
}

struct iconButtonView: View {
    var imgStr: String
    var body: some View {
        Button {
            print("点击图标")
        } label: {
            Image(imgStr)
                .resizable()
                .frame(minWidth: 0, maxWidth: 32, minHeight: 0, maxHeight: 32)
                .aspectRatio(contentMode: .fit)
                .padding()
                .background(Color("login_icon_bg"))
                .clipShape(Circle())
        }
    }
}
