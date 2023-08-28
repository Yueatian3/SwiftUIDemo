//
//  Demo_ListView02.swift
//  SwiftUIDemo
//
//  Created by Yueatian on 2023/8/4.
//

import SwiftUI

struct MessageModel: Identifiable {
    var id = UUID()
    var name: String
    var image: String
}

var MessageArray = [
    MessageModel(name: "QQ", image: "login_QQ"),
    MessageModel(name: "Wechat", image: "login_Wechat"),
    MessageModel(name: "Weibo", image: "login_Weibo")
]

struct Demo_ListView02: View {
    
    @State var messagesItems = MessageArray
    @State var showActionSheet = false
    @State var messageModel: MessageModel = MessageModel(name: "", image: "")
    
    var body: some View {
        NavigationView {
            List {
                ForEach(messagesItems) { model in
                    HStack {
                        Image(model.image)
                            .resizable()
                            .frame(width: 40, height: 40)
                            .cornerRadius(5)
                        Text(model.name)
                            .padding()
                    }
                    // ContextMenu上下文菜单
                    .contextMenu {
                        Button {
                            self.showActionSheet.toggle()
                            messageModel = model
                        } label: {
                            HStack {
                                Text("删除")
                                Image(systemName: "trash")
                            }
                        }
                    }
                    // ActionSheets弹窗, 常用于二次确认, 不像Alerts警告弹窗严肃，属于一般强调
                    .actionSheet(isPresented: $showActionSheet) {
                        ActionSheet(title: Text("删除此项"),
                                    message: nil,
                                    buttons: [
                                        .destructive(Text("删除"), action: {
                                            self.delete(item: messageModel)
                                        }),
                                        .cancel(Text("取消"))
                                    ]
                        )
                    }
                }
                .onDelete(perform: delegateRow(offsets:))
                .onMove(perform: moveItem(from:to:))
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing, content: {
                    EditButton()
                })
            }
        }
    }
    //
    func delete(item MessageModel: MessageModel) {
        if let index = self.messagesItems.firstIndex(where: { $0.id == MessageModel.id }) {
            self.messagesItems.remove(at: index)
        }
    }
    // 滑动删除
    func delegateRow(offsets: IndexSet) {
        messagesItems.remove(atOffsets: offsets)
    }
    // 拖动排序
    func moveItem(from source: IndexSet, to destination: Int) {
        messagesItems.move(fromOffsets: source, toOffset: destination)
    }
}

struct Demo_ListView02_Previews: PreviewProvider {
    static var previews: some View {
        Demo_ListView02()
    }
}
