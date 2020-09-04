//
//  ShapeView.swift
//  ShapeSettingsDemo
//
//  Created by Xiaochun Shen on 2020/9/4.
//

import SwiftUI

struct ShapeView: View {
    @State var showSettings = false
    
    var body: some View {
        NavigationView {
            InnerShape()
                .navigationBarItems(trailing: Button(action: {
                    self.showSettings = true
                }, label: {
                    Text("Settings")
                }))
                .sheet(isPresented: $showSettings, content: {
                    SettingsView()
                })
        }
    }
}

struct InnerShape: Shape {
    func path(in rect: CGRect) -> Path {
        Circle().path(in: rect)
    }
}

struct ShapeView_Previews: PreviewProvider {
    static var previews: some View {
        ShapeView()
    }
}
