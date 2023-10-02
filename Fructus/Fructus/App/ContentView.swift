//
//  ContentView.swift
//  Fructus
//
//  Created by Simão Neves Samouco on 30/09/2023.
//

import SwiftUI

struct ContentView: View {
    var fruits: [Fruit] = fruitsData
    
    @State private var isShowingSettings: Bool = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(fruits.shuffled()) { fruit in
                    NavigationLink(destination: FruitDetailView(fruit: fruit)) {
                        FruitRowView(fruit: fruit)
                            .padding(.vertical, 4)
                    }
                }
            }
            .navigationTitle("Fruits")
            .navigationBarItems(trailing: Button(action: {
                isShowingSettings = true
            }, label: {
                Image(systemName: "slider.horizontal.3")
            })) //: Button
            .sheet(isPresented: $isShowingSettings, content: {
                SettingsView()
            })
        } //Navigation
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

#Preview {
    ContentView(fruits: fruitsData)
}
