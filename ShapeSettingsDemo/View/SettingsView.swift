//
//  SettingsView.swift
//  ShapeSettingsDemo
//
//  Created by Xiaochun Shen on 2020/9/4.
//

import SwiftUI

struct SettingsView: View {
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        NavigationView {
            Text("Settings Go Here!")
                .navigationBarTitle("Settings")
                .navigationBarItems(trailing: Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                }, label:  {
                    Text("Dismiss")
                }))
            
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
