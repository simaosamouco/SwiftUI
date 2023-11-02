//
//  RipeningStagesView.swift
//  Avacados
//
//  Created by Simão Neves Samouco on 02/11/2023.
//

import SwiftUI

struct RipeningStagesView: View {
    var repeningStages: [Ripening] = repeningData
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            VStack {
                Spacer()
                HStack(alignment: .center, spacing: 25){
                    ForEach(repeningStages) { item in
                        RipeningView(ripening: item)
                    }
                }
                .padding(.vertical)
                .padding(.horizontal, 25)
                Spacer()
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
}

#Preview {
    RipeningStagesView(repeningStages: repeningData)
}
