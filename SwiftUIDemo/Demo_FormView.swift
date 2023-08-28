//
//  Demo_FormView.swift
//  SwiftUIDemo
//
//  Created by Yueatian on 2023/7/21.
//

import SwiftUI

struct Demo_FormView: View {
    
    @State var isToggleOn = false
    
    private var displayState = ["选项1", "选项2", "选项3"]
    @State private var selectIndex = 0
    
    @State private var amount = 0
    
    var body: some View {
        /*
         Form 与 List 的关系
         相同点: List列表和Form表单都是SwiftUI对UITableView的一个封装，在实现的机理基本上是一样的
         不同点: Form样式相对单一，List可以有几种样式，List上可以直接使用数据源遍历，Form需要配合ForEach
         */
        NavigationView {
            //表单
            Form {
                // Section为分组
                Section {
                    Toggle(isOn: $isToggleOn) {
                        Text("Toggle状态 _ \(self.isToggleOn.description)")
                    }
                } header: {
                    Text("分组表头文字")
                } footer: {
                    Text("分组表尾文字")
                }
                
                Section {
                    Picker(selection: $selectIndex) {
                        //选择器可选项内容
                        ForEach(0 ..< displayState.count, id: \.self) {
                            Text(self.displayState[$0])
                        }
                    } label: {
                        Text("Picker选择")
                    }
                }
                
                
                Section {
                    Stepper {
                        Text("Stepper_\(self.amount)")
                    } onIncrement: {
                        //点击加号后的操作
                        amount = amount + 1
                        if self.amount >= 99 {
                            self.amount = 99
                        }
                    } onDecrement: {
                        amount = amount - 1
                        if self.amount <= 0 {
                            self.amount = 0
                        }
                    }
                }
            }
            .navigationTitle("通用")
            .navigationBarTitleDisplayMode(.inline)
           
        }
        
    }
}

struct Demo_FormView_Previews: PreviewProvider {
    static var previews: some View {
        Demo_FormView()
    }
}
