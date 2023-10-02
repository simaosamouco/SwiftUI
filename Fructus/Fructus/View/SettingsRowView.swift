//
//  SettingsRowView.swift
//  Fructus
//
//  Created by Simão Neves Samouco on 02/10/2023.
//

import SwiftUI

struct SettingsRowView: View {
    
    var name: String
    var content: String? = nil
    var linkLabel: String? = nil
    var linkDestinaiton: String? = nil
    
    var body: some View {
        VStack {
            Divider().padding(.vertical, 4)
            HStack {
                Text(name).foregroundStyle(Color.gray)
                Spacer()
                if (content != nil) {
                    Text(content!)
                } else if (linkLabel != nil && linkDestinaiton != nil){
                    Link(linkLabel!, destination: URL(string: "https://\(linkDestinaiton!)")!)
                    Image(systemName: "arrow.up.right.square").foregroundColor(.pink)
                }else {
                    EmptyView()
                }
            }
            
        }
    }
}

#Preview {
    Group {
        SettingsRowView(name: "Developer", content: "Simão")
            .previewLayout(.fixed(width: 375, height: 60))
            .padding()
        SettingsRowView(name: "Website", linkLabel: "GitHub", linkDestinaiton: "https://github.com/simaosamouco")
            .previewLayout(.fixed(width: 375, height: 60))
            .padding()
    }
}


