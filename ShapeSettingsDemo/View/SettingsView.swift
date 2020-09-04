//
//  SettingsView.swift
//  ShapeSettingsDemo
//
//  Created by Xiaochun Shen on 2020/9/4.
//

import SwiftUI

struct SettingsView: View {
    @Environment(\.presentationMode) var presentationMode
    
    @ObservedObject var shapeSettings: ShapeSettings
    var body: some View {
        NavigationView {
            Form {
                Picker(selection: $shapeSettings.choseColor, label: Text("Color"), content: /*@START_MENU_TOKEN@*/{
                    ForEach(0..<ShapeSettings.Colors.count, id: \.self) { index in
                        Text("\(ShapeSettings.Colors[index].description)")
                            .tag(index)
                    }
                }/*@END_MENU_TOKEN@*/)
                
                Picker(selection: $shapeSettings.chosenShape, label: Text("Shape"), content: {
                    ForEach(ShapeSettings.Shapes.allCases, id: \.self) { shape in
                        Text("\(shape.rawValue)")
                            .tag(shape)
                        
                    }
                })
                .pickerStyle(SegmentedPickerStyle())
                
            }
                .navigationBarTitle("Settings")
                .navigationBarItems(trailing: Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                }, label:  {
                    Text("Dismiss")
                }))
            
        }
    }
}

//struct SettingsView_Previews: PreviewProvider {
//    static var previews: some View {
//        SettingsView(shapeSettings: shapeSettings)
//    }
//}
