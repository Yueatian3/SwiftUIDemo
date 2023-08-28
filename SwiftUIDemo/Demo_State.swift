//
//  Demo_State.swift
//  SwiftUIDemo
//
//  Created by Yueatian on 2023/7/19.
//

import SwiftUI

struct Demo_State: View {
    
    @State var isSelect: Bool = false
    
    var body: some View {
        
        VStack {
            Button {
                // 切换状态
                self.isSelect.toggle()
            } label: {
                Image(systemName: self.isSelect ? "checkmark.circle.fill" : "circle")
                    .renderingMode(.template)
                    .font(.system(size: 100))
                    .foregroundColor( self.isSelect ? .green : .gray)
            }
            .padding()
            
            selectTitleView(isSelect: self.$isSelect)
            
        }

    }
}

struct Demo_State_Previews: PreviewProvider {
    static var previews: some View {
        Demo_State()
    }
}

struct selectTitleView: View {
    
    // 关联参数
    @Binding var isSelect: Bool
    
    var body: some View {
        Text(self.isSelect ? "已经开启" :"未开启")
            .font(.system(size: 20))
            .fontWeight(.bold)
            .tracking(1)
            .foregroundColor(self.isSelect ? .green : .black)
    }
}
