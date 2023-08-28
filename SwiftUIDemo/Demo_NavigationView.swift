//
//  Demo_NavigationView.swift
//  SwiftUIDemo
//
//  Created by Yueatian on 2023/7/20.
//

import SwiftUI

struct Demo_NavigationView: View {
    var messageArr = [
        message(image: "login_QQ", title: "QQ登录"),
        message(image: "login_Wechat", title: "微信登录"),
        message(image: "login_Weibo", title: "微博登录"),
        message(image: "login_QQ", title: "QQ登录(新账号)"),
    ]
    var body: some View {
        NavigationView {
            List(messageArr) { message in
                // 跳转
                NavigationLink {
                    DetailView(message: message)
                } label: {
                    HStack(spacing: 15) {
                        Image(message.image)
                            .resizable()
                            .frame(width: 40, height: 40)
                        
                        Text(message.title)
                            .font(.system(size: 20))
                            .fontWeight(.regular)
                            .tracking(1)
                    }
                }
            }
            .navigationTitle("navigationTitle")
            .navigationBarTitleDisplayMode(.inline)
            /*
             TitleDisplayMode
             
             .automatic: 继承上一个导航项的显示模式, 默认效果，大标题
             .inline: 在导航栏的标准范围内显示标题, 文字标题剧中
             .large: 在扩展的导航栏中显示大标题
             */
        }
    }
}

struct Demo_NavigationView_Previews: PreviewProvider {
    static var previews: some View {
        Demo_NavigationView()
    }
}

struct message: Identifiable {
    var id = UUID()
    var image: String
    var title: String
}

struct DetailView: View {
    @Environment(\.dismiss) private var dismiss
    var message: message
    var body: some View {
        VStack(spacing: 20) {
            Image(message.image)
                .resizable()
            .frame(width: 80, height: 80)
            
            Text(message.title)
                .font(.system(size: 30))
                .fontWeight(.regular)
                .tracking(1)
        }
        .navigationBarBackButtonHidden(true)
        //自定义NavigationBar
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Image(systemName: "chevron.left")
                    .foregroundColor(.gray)
                    .onTapGesture {
                        dismiss()
                    }
            }
        }
    }
}
