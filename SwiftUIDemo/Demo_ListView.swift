//
//  Demo_ListView.swift
//  SwiftUIDemo
//
//  Created by Yueatian on 2023/7/19.
//

import SwiftUI

struct Demo_ListView: View {
    var messageArr = [
        messageModel(imgStr: "login_QQ", titleStr: "QQ登录"),
        messageModel(imgStr: "login_Wechat", titleStr: "微信登录"),
        messageModel(imgStr: "login_Weibo", titleStr: "微博登录"),
        messageModel(imgStr: "login_QQ", titleStr: "QQ登录(新账号)"),
    ]
    var body: some View {

        List {
            ForEach(messageArr) { model in
                HStack(spacing: 15) {
                    Image(model.imgStr)
                        .resizable()
                        .frame(width: 40, height: 40)
                    Text(model.titleStr)
                }
            }
        }
    }
}

struct Demo_ListView_Previews: PreviewProvider {
    static var previews: some View {
        Demo_ListView()
    }
}

/*
 遵循Identifiable的结构体可以自动跟踪它的id作为唯一标识符，不需要在body中指定id
 
 UUID() 函数用于生成一个全局惟一的随机标识符。
 */
struct messageModel: Identifiable {
    var id = UUID()
    var imgStr: String
    var titleStr: String
}
