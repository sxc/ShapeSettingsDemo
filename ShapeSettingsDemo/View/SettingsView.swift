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
                Section(header: Text("Shape Settings")) {
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
                    
                    HStack {
                        Text("Size")
                        Image(systemName: "circle.fill")
                            .imageScale(.small)
                        Slider(value: $shapeSettings.scale, in: 0...1)
                        Image(systemName: "circle.fill")
                            .imageScale(.large)
                        
                    }
                }
                
                Section(header: Text("Other Settings")) {
                    Stepper(value: $shapeSettings.shapeCount, in: 1...10) {
                        Text("Count: \(shapeSettings.shapeCount)")
                    }

                    Toggle(isOn: $shapeSettings.showShapes, label:  {
                        Text("Show Shapes")
                    })
                
                }
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
