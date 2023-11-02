//
//  RecipeRatingView.swift
//  Avacados
//
//  Created by Simão Neves Samouco on 02/11/2023.
//

import SwiftUI

struct RecipeRatingView: View {
    var recipe: Recipe
    
    var body: some View {
        HStack(alignment: .center, spacing: 5) {
            ForEach(1...(recipe.rating), id: \.self) { _ in
                Image(systemName: "star.fill")
                    .font(.body)
                .foregroundColor(Color.yellow)
            }
        }
    }
}

#Preview {
    RecipeRatingView(recipe: recipeData.first!)
        .previewLayout(.fixed(width: 320, height: 60))
}
