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
            
            VStack {
                ForEach(0..<shapeSettings.shapeCount, id: \.self) { _ in
                    InnerShape(chosenShapen: shapeSettings.chosenShape)
                        .scale(CGFloat(shapeSettings.scale))
                        .foregroundColor(ShapeSettings.Colors[shapeSettings.choseColor])
                    
                }
            }
            
            
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
    var chosenShapen: ShapeSettings.Shapes
    
    func path(in rect: CGRect) -> Path {
        switch chosenShapen {
        case .Circle:
            return Circle().path(in: rect)
        default:
            return Rectangle().path(in: rect)
        }
    }
}

struct ShapeView_Previews: PreviewProvider {
    static var previews: some View {
        ShapeView()
    }
}
