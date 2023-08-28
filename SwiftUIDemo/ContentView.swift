//
//  ContentView.swift
//  SwiftUIDemo
//
//  Created by Yueatian on 2023/7/18.
//

import SwiftUI

struct bodyModel: Identifiable {
    var id = UUID()
    var title: String
    var view: AnyView
}

var bodyArray = [
   bodyModel(title: "Text", view: AnyView(Demo_Text())),
   bodyModel(title: "ImageView", view: AnyView(Demo_ImageView())),
   bodyModel(title: "StackView", view: AnyView(Demo_StackView())),
   bodyModel(title: "ScrollView", view: AnyView(Demo_ScrollView())),
   bodyModel(title: "Button", view: AnyView(Demo_Button())),
   bodyModel(title: "Gradient", view: AnyView(Demo_Gradient())),
   bodyModel(title: "State", view: AnyView(Demo_State())),
   bodyModel(title: "Path", view: AnyView(Demo_Path())),
   bodyModel(title: "ListView", view: AnyView(Demo_ListView())),
   bodyModel(title: "NavigationView", view: AnyView(Demo_NavigationView())),
   bodyModel(title: "ModalView", view: AnyView(Demo_ModalView())),
   bodyModel(title: "FormView", view: AnyView(Demo_FormView())),
   bodyModel(title: "ListView02", view: AnyView(Demo_ListView02())),
   bodyModel(title: "UIGestures", view: AnyView(Demo_UIGestures())),
]

struct ContentView: View {
    
    @State var bodyItems = bodyArray
    
    var body: some View {
        NavigationView {
            List(bodyItems) { item in
                NavigationLink {
                    item.view
                } label: {
                    HStack(spacing: 15) {
                        Text(item.title)
                            .font(.system(size: 20))
                            .fontWeight(.medium)
                            .padding()
                    }
                }
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
