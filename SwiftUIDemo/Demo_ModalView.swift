//
//  Demo_ModalView.swift
//  SwiftUIDemo
//
//  Created by Yueatian on 2023/7/20.
//

import SwiftUI

struct Demo_ModalView: View {
    @State var isShowModelDetailView: Bool = false
    var body: some View {
        Button {
            self.isShowModelDetailView.toggle()
        } label: {
            Text("进入新界面")
                .padding()
                .frame(minWidth: 0, maxWidth: .infinity)
                .font(.system(size: 30))
                .fontWeight(.regular)
                .foregroundColor(.white)
                .background(Color("login_apple_bg_color"))
                .cornerRadius(10)
                .padding(.horizontal, 20)
        }
        .sheet(isPresented: $isShowModelDetailView) {
            ModelDetailView(showModelDetailView: $isShowModelDetailView)
        }

    }
}

struct Demo_ModalView_Previews: PreviewProvider {
    static var previews: some View {
        Demo_ModalView()
    }
}

struct ModelDetailView: View {
    
    @Binding var showModelDetailView: Bool
    @State var showAlertView = false
    var body: some View {
        NavigationView {
            Button {
                self.showAlertView.toggle()
            } label: {
                Text("Alert弹窗")
                    .padding()
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .font(.system(size: 30))
                    .foregroundColor(.white)
                    .fontWeight(.regular)
                    .background(Color("login_apple_bg_color"))
                    .cornerRadius(10)
                    .padding(.horizontal, 20)
            }
            .alert(Text("Alert标题"), isPresented: $showAlertView, actions: {
                HStack {
                    Button {
                        print("取消")
                    } label: {
                        Text("Cancel")
                    }

                    Button {
                        print("展示Alert弹窗成功")
                    } label: {
                        Text("OK")
                    }
                }
            }, message: {
                Text("Alert内容")
            })
            
            .toolbar {
                ToolbarItem(placement: .navigation) {
                    Button {
                        self.showModelDetailView.toggle()
                    } label: {
                        Image(systemName: "chevron.left")
                            .font(.system(size: 30))
                            .foregroundColor(.gray)
                        
                    }
                }
            }
        }
    }
}
