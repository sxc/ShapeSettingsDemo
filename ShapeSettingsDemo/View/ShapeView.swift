//
//  ShapeView.swift
//  ShapeSettingsDemo
//
//  Created by Xiaochun Shen on 2020/9/4.
//

import SwiftUI

struct ShapeView: View {
    @ObservedObject var shapeSettings = ShapeSettings()
    
    var body: some View {
        NavigationView {
            InnerShape()
                .foregroundColor(ShapeSettings.Colors[shapeSettings.choseColor])
                .navigationBarItems(trailing: Button(action: {
                    self.shapeSettings.showSettings = true
                }, label: {
                    Text("Settings")
                }))
                .sheet(isPresented: $shapeSettings.showSettings, content: {
                    SettingsView(shapeSettings: shapeSettings)
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
